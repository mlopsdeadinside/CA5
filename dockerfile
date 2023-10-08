# Use the official Python image from Docker Hub
FROM python:3.8

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Flask app code into the container
COPY . .

# Expose the port your Flask app runs on
EXPOSE 5000

# Environment variables for MongoDB connection
ENV MONGO_HOST=localhost
ENV MONGO_PORT=27017
ENV MONGO_USERNAME=admin11
ENV MONGO_PASSWORD=0000
ENV MONGO_DATABASE=MlopsdeadinsideDB

# Command to run your Flask app
CMD ["python", "Flask_app.ipynb"]
