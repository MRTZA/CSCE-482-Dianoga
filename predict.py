from imageai.Prediction.Custom import CustomImagePrediction
import os

execution_path = os.getcwd()

prediction = CustomImagePrediction()
prediction.setModelTypeAsResNet()
prediction.setModelPath(os.path.join(execution_path, "trashnet/models/model_ex-002_acc-0.223214.h5"))
prediction.setJsonPath(os.path.join(execution_path, "trashnet/json/model_class.json"))
prediction.loadModel(num_objects=6)

predictions, probabilities = prediction.predictImage(os.path.join(execution_path, "trashnet/test/glass/glass452.jpg"), result_count=5)

for eachPrediction, eachProbability in zip(predictions, probabilities):
    print(eachPrediction , " : " , eachProbability)