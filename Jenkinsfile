pipeline {
    environment {
        reg-addr = '582826443728.dkr.ecr.us-east-1.amazonaws.com'
    agent {
        node {
            label 'prod'
        }
    }
    stages {
        stage('Clone Git Project') {
            steps {
                git url: 'https://github.com/hosseinkarjoo/DevOps-Training-Full-Deployment.git', branch: 'k8s-app', credentialsId: 'github_creds'
            }
        }
        stage('build'){
            steps{
                sh'docker build -t ${reg-addr}/app:${BUILD_NUMBER} -t ${reg-addr}/app:latest ./app/'
                sh'docker build -t ${reg-addr}/api:${BUILD_NUMBER} -t ${reg-addr}/api:latest ./api/'
                sh'docker build -t ${reg-addr}/db:${BUILD_NUMBER} -t ${reg-addr}/db:latest ./db/'
            }
        }
        stage('PUSH'){
           steps{
                sh'sudo docker push ${reg-addr}/app:${BUILD_NUMBER}'
                sh'sudo docker push ${reg-addr}/app:latest'
                sh'sudo docker push ${reg-addr}/api:${BUILD_NUMBER}'
                sh'sudo docker push ${reg-addr}/api:latest'
                sh'sudo docker push ${reg-addr}/db:${BUILD_NUMBER}'
                sh'sudo docker push ${reg-addr}/db:latest'
            }
        }
 //       stage('run ansible'){
 //           steps{        
 //               input("Ready to proceed?")
 //           }
 //       }
        stage('run deployment'){
            steps{
                sh'sudo kubectl apply -f deployment-app.yml '
            }
        }
    }
}
