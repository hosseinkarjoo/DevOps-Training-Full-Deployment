pipeline {
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
        } 
}
