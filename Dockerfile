# Using the official MongoDB image as the base image
FROM mongo:latest

COPY work.js /docker-entrypoint-initdb.d/

EXPOSE 27017