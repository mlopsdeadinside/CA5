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

# Command to run your Flask app
CMD ["python", "Flask_app.py"]

# Use the official SQL Server 2019 image from Microsoft
FROM mcr.microsoft.com/mssql/server:2019-latest

# Set the SA password for SQL Server (change this to a strong password)
ENV SA_PASSWORD=CAT@DOG123

# Copy the SQL script into the image
COPY create-db.sql /docker-entrypoint-initdb.d/

# Define the command to run when the container starts
CMD ["/opt/mssql/bin/sqlservr"]