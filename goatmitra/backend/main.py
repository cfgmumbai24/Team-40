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
from fastapi.middleware.cors import CORSMiddleware
import uvicorn
import base64
import io

# Define paths to the directories
main_dir = './dataset/'
goat_pox_dir = os.path.join(main_dir, 'goatpox')
lumps_dir = os.path.join(main_dir, 'lumps')

# Example paths to random images for visualization
random_goat_pox = os.path.join(goat_pox_dir, random.choice(os.listdir(goat_pox_dir)))
random_lumps = os.path.join(lumps_dir, random.choice(os.listdir(lumps_dir)))

# Display random images from each category
plt.figure(figsize=(10, 5))

plt.subplot(1, 2, 1)
goat_pox_img = mpimg.imread(random_goat_pox)
plt.imshow(goat_pox_img)
plt.title('Goat Pox')

plt.subplot(1, 2, 2)
lumps_img = mpimg.imread(random_lumps)
plt.imshow(lumps_img)
plt.title('Lumps')

plt.tight_layout()
plt.show()

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

# Check the class indices assigned by the generator
print(train_data.class_indices)

# Create base model (InceptionV3) and load weights
base_model = InceptionV3(input_shape=(256, 256, 3), include_top=False, weights='imagenet')

# Add custom classification layers
x = base_model.output
x = Flatten()(x)
predictions = Dense(1, activation='sigmoid')(x)

# Combine base model and custom layers into a new model
model = Model(inputs=base_model.input, outputs=predictions)

# Compile the model
model.compile(optimizer='adam', loss='binary_crossentropy', metrics=['accuracy'])

# Define callbacks (only EarlyStopping)
es = EarlyStopping(monitor="accuracy", min_delta=0.01, patience=5, verbose=1)
cb = [es]

# Train the model
history = model.fit(train_data, steps_per_epoch=10, epochs=30, callbacks=cb)

# Plot training history
plt.plot(history.history['loss'], 'go--', c='green')
plt.plot(history.history['accuracy'], 'go--', c='red')
plt.title("Loss vs Accuracy")
plt.show()

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

@app.post("/predict")
async def predict(image: UploadFile = File(...)):
    # Read image file
    contents = await image.read()
    img = load_img(io.BytesIO(contents), target_size=(256, 256))
    img_array = img_to_array(img)
    img_array = preprocess_input(img_array)
    input_arr = np.array([img_array])

    # Make predictions
    pred = model.predict(input_arr)

    # Display prediction result
    if pred[0] >= 0.5:
        return "The image is predicted to show lumps."
    else:
        return "The image is predicted to show goat pox."

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=9000)
