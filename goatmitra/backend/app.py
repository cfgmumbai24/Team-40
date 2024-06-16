from flask import Flask, request, jsonify
import joblib
import numpy as np

# Initialize the Flask app
app = Flask(__name__)

# Load the trained model
model_file = 'svc_goat_health_model.joblib'
model = joblib.load(model_file)

@app.route('/')
def home():
    return "Goat Health Prediction API"

@app.route('/predict', methods=['POST'])
def predict():
    # Get the JSON data from the request
    data = request.get_json()

    # Extract features from the JSON data
    weight = data.get('Weight')
    height = data.get('Height')
    fever = 1 if data.get('Fever') == 'yes' else 0
    lethargy = 1 if data.get('Lethargy') == 'yes' else 0
    diarrhea = 1 if data.get('Diarrhea') == 'yes' else 0
    running_nose = 1 if data.get('Running_Nose') == 'yes' else 0
    coughing_sneezing = 1 if data.get('Coughing_Sneezing') == 'yes' else 0
    coat_changes = 1 if data.get('Coat_Changes') == 'yes' else 0

    # Prepare the feature array for prediction
    features = np.array([[weight, height, fever, lethargy, diarrhea, running_nose, coughing_sneezing, coat_changes]])

    # Make the prediction
    prediction_prob = model.decision_function(features)
    threshold = 0
    prediction = (prediction_prob > threshold).astype(int)

    # Prepare the response
    health_status = 'unhealthy' if prediction[0] == 1 else 'healthy'
    response = {
        'prediction': health_status
    }

    return jsonify(response)

if __name__ == '__main__':
    app.run(debug=True)
