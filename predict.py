from imageai.Prediction.Custom import CustomImagePrediction
from operator import itemgetter
import os
import glob

# Set up directory variables
execution_path = os.getcwd()
test_directory = os.path.join(execution_path, "trashnet/test/")
model_directory = os.path.join(execution_path, "trashnet/models/")

# Error checks
if len(os.listdir(model_directory)) == 0:
    raise FileNotFoundError("NO MODELS FOUND")

# Get the most recent model
list_of_models = glob.glob(os.path.join(model_directory, "*.h5"))
latest_model = max(list_of_models, key=os.path.getctime)

# Get all possible object classifications
objects = next(os.walk(test_directory))[1]

# Prediction setup
prediction = CustomImagePrediction()
prediction.setModelTypeAsResNet()
prediction.setModelPath(latest_model)
prediction.setJsonPath(os.path.join(execution_path, "trashnet/json/model_class.json"))
prediction.loadModel(num_objects=len(objects))

for obj in objects:
    # Dict to store the guesses of all predictions of this object
    results = dict()
    for o in objects:
        results[o] = 0

    num_correct = 0;
    num_total = 0;

    # Set current object directory
    object_directory = os.path.join(test_directory, obj)

    # Iterate through files in current object directory
    for root, dirs, files in os.walk(object_directory):
        for filename in files:
            if ".jpg" in filename:
                predictions, probabilities = prediction.predictImage(os.path.join(object_directory, filename), result_count=5)

                mapped = zip(predictions, probabilities)
                guess = max(mapped, key=itemgetter(1))[0]
                results[guess] += 1
                num_total += 1

                if guess == obj:
                    num_correct += 1

    accuracy = num_correct/num_total
    print(results)
    print("Accuracy on " + str(obj) + ": " + str(accuracy) + "\n")
