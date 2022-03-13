pipeline {
    environment {
        dockerhubapp = "hosseinkarjoo/devops-training-app"
        dockerhubdb = "hosseinkarjoo/devops-training-db"
        dockerhubapi = "hosseinkarjoo/devops-training-api"
        dockerhubReg = "hosseinkarjoo"
    }
    agent {
        node {
            label 'prod-stage'
        }
    }
    stages {
        stage('Clone Git Project') {
            steps {
                git url: 'https://github.com/hosseinkarjoo/DevOps-Training-Full-Deployment.git', branch: 'project-compose', credentialsId: 'github_creds'
                }
            }
        stage ('Deploy') {
            steps {
                script {
                    sh 'docker-compose build '
                }
            }
        }
        stage ('Third - Push Images to DockerHub') {
            steps {
                script {
                    sh 'docker login -u dockerhubReg -p hub_credentialsId'
                    sh 'docker-compose push'
                }
            }
        }
    }
}

