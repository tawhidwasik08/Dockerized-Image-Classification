

# Dockerized Image Classification
The repository contains gpu supported dockerized code for training, inferencing and evaluating an image classification model using ensembling techniques. It uses pre-trained VGG16 and ResNet152 models for classification and combines their predictions using an ensemble model. The dataset used is a collection of images divided into four classes: berry, bird, dog, and flower. The code includes data preprocessing, model creation, training, inference for single images, evaluation metrics such as accuracy and loss, and visualization of training results. 
## Table of Contents

- [Getting Started](#getting-started)
- [Training](#training)
- [Inference](#inference)

## Getting Started
1. Install docker on your system.
2. Clone the repository:
   ```bash
   git clone https://github.com/tawhidwasik08/image_classification_dockerized.git
   ```
3. Move into project directory in command line
    ```bash 
    cd image_classification_dockerized/
    ```
4. Run
  ```bash
  docker compose up
  ```
5. Move dataset into **docker_mount** folder. It directory should look like this :
  ```bash
  image_classification_dockerized/docker_mount/dataset/train/berry/
  ```
6. Jupyter should be running in [localhost:8888](http://localhost:8888). Make sure **port 8888** is not occupied.


## Training
1. The model architecture is defined for VGG16 classification using the `Vgg16Classifier` class. 
2. The model is initialized with pretrained VGG16 weights and a linear layer for the final classification. 
3. The model summary is printed using the `summary` function.
4. The model's parameters except for the linear layer are set to not require gradients.
5. The training loop  is implemented using the `training` function.
6. The model is trained for the specified number of epochs using the provided dataloaders, criterion, optimizer, and learning rate
7. The best model based on the lowest validation loss is saved. 
8. The training loss, training accuracy, validation loss, and validation accuracy are stored for visualization and evaluation.

## Inference
1. The `infer` function  is defined to perform inference on a single image using the trained model. 
2. A random image from the test set  is selected using the `get_random_image_from_test_set` function. 
3. The actual class  and predicted class  for the image are displayed.


**Hope it helps to anyone looking for simple dockerized machine/deep learning notebooks with gpu support.**  
*Peace!* :v:
