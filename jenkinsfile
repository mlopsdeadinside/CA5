pipeline {
    agent any

    stages {
        stage('Build and Push Database Image') {
            steps {
                script {
                    // Define your Docker Hub credentials
                    def dockerHubCredentials = credentials('docker-hub-credentials')

                    // Set up the Docker image name and tag
                    def imageName = 'mlopsdeadinside/ca5'
                    def imageTag = 'v1'

                    // Build the Docker image using the Dockerfile
                    sh "docker build -t ${imageName}:${imageTag} ."

                    // Log in to Docker Hub using credentials
                    withCredentials([usernamePassword(credentialsId: dockerHubCredentials, usernameVariable: 'DOCKER_HUB_USERNAME', passwordVariable: 'DOCKER_HUB_PASSWORD')]) {
                        sh "docker login -u $DOCKER_HUB_USERNAME -p $DOCKER_HUB_PASSWORD"
                    }

                    // Push the Docker image to Docker Hub
                    sh "docker push ${imageName}:${imageTag}"
                }
            }
        }
    }
}
