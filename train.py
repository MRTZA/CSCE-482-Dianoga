from imageai.Prediction.Custom import ModelTraining
import os
import tensorflow as tf

# GPU Details
print(tf.Session(config=tf.ConfigProto(log_device_placement=True)))

model_trainer = ModelTraining()
model_trainer.setModelTypeAsResNet()
model_trainer.setDataDirectory(r"./trashnet/")
num_objects = len(next(os.walk(os.path.join(os.getcwd(), "trashnet/train/")))[1])

model_trainer.trainModel(num_objects=num_objects, num_experiments=1, enhance_data=True, batch_size=32, show_network_summary=True)