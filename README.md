# CA4
MLOPS Class Activity 4

## Database

Open a terminal and go to the project directory where the work.js script and Dockerfile are located.

Create the Docker container image for the MongoDB database service: build my-mongodb-image with docker -t.

Use the following command to launch a Docker container using the MongoDB database service: 27017:27017 my-mongodb-image docker run -d --name my-mongodb-container

A Docker container will now be used to execute the MongoDB database service.

When the container starts, an automatic execution of the work.js script takes place. It adds test data and initialises the MongoDB collections.

## Run the application
1. build and run the mongo db image 
2. build and run the flask app image
3. docker build -t flask-app-img .
4. docker run -d --name flask-app-container -p 5000:5000 flask-app-img
4. open the browser and go to http://localhost:5000/

