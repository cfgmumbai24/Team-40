import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.svm import SVC
from sklearn.metrics import classification_report, accuracy_score
import joblib
import matplotlib.pyplot as plt
import numpy as np


# Load the CSV dataset
file_path = './goat_health_dataset.csv'  # Replace with your actual file path
df = pd.read_csv(file_path)

# Display the first few rows of the dataset for verification
print("Dataset preview:")
print(df.head())

# Convert 'Fever' to binary (0 and 1)
df['Fever'] = df['Fever'].apply(lambda x: 1 if x == 'yes' else 0)

# Convert 'Health' to binary (0 and 1)
df['Health'] = df['Health'].apply(lambda x: 1 if x == 'unhealthy' else 0)

# One-hot encode categorical variables: Lethargy, Diarrhea, Running_Nose, Coughing_Sneezing, Coat_Changes
df = pd.get_dummies(df, columns=['Lethargy', 'Diarrhea', 'Running_Nose', 'Coughing_Sneezing', 'Coat_Changes'], drop_first=True)

# Separate features (X) and target (y)
X = df.drop('Health', axis=1)
y = df['Health']

# Split data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Initialize SVC model
svc = SVC(kernel='linear')

# Train the model
svc.fit(X_train, y_train)

# Save the trained model to a file using joblib
model_file = 'svc_goat_health_model.joblib'
joblib.dump(svc, model_file)
print("Model saved successfully.")

# Make predictions
y_pred_prob = svc.decision_function(X_test)  # Decision function outputs confidence scores
threshold = 0  # Set your desired threshold here
y_pred = (y_pred_prob > threshold).astype(int)  # Convert confidence scores to binary predictions

# Evaluate model performance
print("\nClassification Report:")
print(classification_report(y_test, y_pred))

# Calculate accuracy
accuracy = accuracy_score(y_test, y_pred)
print(f"\nAccuracy: {accuracy:.2f}")

# Example prediction (replace with actual test data if available)
example_goat = [[29.548659380020972, 30.97029339384026, 0, 0, 0, 1, 0, 0]]  # Example data
example_pred_prob = svc.decision_function(example_goat)
example_pred = (example_pred_prob > threshold).astype(int)

print(f"\nExample prediction for a goat:")
if example_pred[0] == 1:
    print("Health status: unhealthy")
else:
    print("Health status: healthy")

example_pred_prob = svc.decision_function(example_goat)[0]

# Calculate probabilities
prob_healthy = 1 / (1 + np.exp(-example_pred_prob))
prob_unhealthy = 1 - prob_healthy

# Visualization for the example goat's health probability
plt.figure(figsize=(6, 4))
plt.bar(['Healthy', 'Unhealthy'], [prob_healthy, prob_unhealthy], color=['green', 'red'])
plt.title('Health Probability for the Example Goat')
plt.xlabel('Health Status')
plt.ylabel('Probability')
plt.ylim(0, 1)
plt.show()