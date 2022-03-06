pipeline {
    environment {
        dockerhubReg = "hosseinkarjoo/devops-training-app"
    }
    agent {
        node {
            label 'prod-stage'
        }
    }
    stages {
        stage('First - Clone Git Project') {
            steps {
                git url: 'https://github.com/hosseinkarjoo/DevOps-Training-Full-Deployment.git', branch: 'Front-Stage', credentialsId: 'github_creds'
                }
            }
        stage ('Secound - Build Docker Image') {
            steps {
                script {
                    image = docker.build dockerhubReg
                }
            }
        }
        stage ('Third - Push Image to DockerHub') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'hub_credentialsId') {
                        image.push("${BUILD_NUMBER}")
                        image.push("latest")
                    }
                }
            }
        }
    }
}
