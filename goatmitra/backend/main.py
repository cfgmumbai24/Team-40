import os
import random
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
import numpy as np
from tensorflow.keras.preprocessing.image import ImageDataGenerator, load_img, img_to_array
from tensorflow.keras.applications.inception_v3 import InceptionV3, preprocess_input
from tensorflow.keras.layers import Dense, Flatten
from tensorflow.keras.models import Model
from tensorflow.keras.callbacks import EarlyStopping
from fastapi import FastAPI, UploadFile, File
from pydantic import BaseModel
from fastapi.middleware.cors import CORSMiddleware
import uvicorn
import joblib
import base64
import io

# Define paths to the directories
main_dir = './dataset/'
goat_pox_dir = os.path.join(main_dir, 'goatpox')
lumps_dir = os.path.join(main_dir, 'lumps')

# Example paths to random images for visualization
random_goat_pox = os.path.join(goat_pox_dir, random.choice(os.listdir(goat_pox_dir)))
random_lumps = os.path.join(lumps_dir, random.choice(os.listdir(lumps_dir)))

# Preparing data generators
train_datagen = ImageDataGenerator(
    featurewise_center=True,
    rotation_range=20,
    width_shift_range=0.2,
    height_shift_range=0.2,
    shear_range=0.2,
    zoom_range=0.2,
    horizontal_flip=True,
    preprocessing_function=preprocess_input
)

# Flow from directory
train_data = train_datagen.flow_from_directory(
    directory=main_dir,
    target_size=(256, 256),
    batch_size=32,
    class_mode='binary'  # binary classification since there are two classes: goat pox and lumps
)

# Create base model_image (InceptionV3) and load weights
base_model_image = InceptionV3(input_shape=(256, 256, 3), include_top=False, weights='imagenet')

# Add custom classification layers
x = base_model_image.output
x = Flatten()(x)
predictions = Dense(1, activation='sigmoid')(x)

# Combine base model_image and custom layers into a new model_image
model_image = Model(inputs=base_model_image.input, outputs=predictions)

# Compile the model_image
model_image.compile(optimizer='adam', loss='binary_crossentropy', metrics=['accuracy'])

# Define callbacks (only EarlyStopping)
es = EarlyStopping(monitor="accuracy", min_delta=0.01, patience=5, verbose=1)
cb = [es]

# Train the model_image
history = model_image.fit(train_data, steps_per_epoch=10, epochs=30, callbacks=cb)

# Load the trained model
model_file = 'svc_goat_health_model.joblib'
model_text = joblib.load(model_file)

# Initialize FastAPI app
app = FastAPI()

# Allow CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Define request and response models using Pydantic
class GoatHealthRequest(BaseModel):
    Weight: float
    Height: float
    Fever: str
    Lethargy: str
    Diarrhea: str
    Running_Nose: str
    Coughing_Sneezing: str
    Coat_Changes: str


@app.post("/predict/image")
async def predict_image(image: UploadFile = File(...)):
    # Read image file
    contents = await image.read()
    img = load_img(io.BytesIO(contents), target_size=(256, 256))
    img_array = img_to_array(img)
    img_array = preprocess_input(img_array)
    input_arr = np.array([img_array])

    # Make predictions
    pred = model_image.predict(input_arr)

    # Display prediction result
    if pred[0] >= 0.5:
        return "The image is predicted to show lumps."
    else:
        return "The image is predicted to show goat pox."
    
@app.post("/predict/text")
async def predict_text(data: GoatHealthRequest):
    # Extract features from the request data
    weight = data.Weight
    height = data.Height
    fever = 1 if data.Fever == 'yes' else 0
    lethargy = 1 if data.Lethargy == 'yes' else 0
    diarrhea = 1 if data.Diarrhea == 'yes' else 0
    running_nose = 1 if data.Running_Nose == 'yes' else 0
    coughing_sneezing = 1 if data.Coughing_Sneezing == 'yes' else 0
    coat_changes = 1 if data.Coat_Changes == 'yes' else 0

    # Prepare the feature array for prediction
    features = np.array([[weight, height, fever, lethargy, diarrhea, running_nose, coughing_sneezing, coat_changes]])

    # Make the prediction
    prediction_prob = model_text.decision_function(features)
    threshold = 0
    prediction = (prediction_prob > threshold).astype(int)

    # Prepare the response
    health_status = 'unhealthy' if prediction[0] == 1 else 'healthy'
    response = {
        'prediction': health_status
    }

    return response


if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=9000)
