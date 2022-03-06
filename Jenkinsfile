pipeline {
    agent any
    stages {
        stage('First - Clone Git Project') {
            steps {
            git url: 'https://github.com/hosseinkarjoo/DevOps-Training-Full-Deployment.git', branch: 'FrontStage', credetialsId: 'github'
            }
        }
    } 
}
