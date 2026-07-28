import tensorflow as tf
import numpy as np
from PIL import Image

model = tf.keras.models.load_model('model/keras_model.h5')

class_names = ['Healthy Plant', 'Sick Plant']

def predict_plant(image_path):
    img = Image.open(image_path).convert('RGB')
    img = img.resize((224, 224))

    img_array = np.array(img) / 255.0
    img_array = np.expand_dims(img_array, axis=0)

    predictions = model.predict(img_array)
    index = np.argmax(predictions)
    confidence = predictions[0][index] * 100

    print(f'Prediction: {class_names[index]} ({confidence:.1f}% confident)')


predict_plant('images.jpeg')
predict_plant('download.jpeg')