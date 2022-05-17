pipeline {
    environment {
        regAddr = '007611673475.dkr.ecr.us-east-1.amazonaws.com'
    }
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
                sh'docker build -t ${regAddr}/app:${BUILD_NUMBER} -t ${regAddr}/app:latest ./app/'
                sh'docker build -t ${regAddr}/api:${BUILD_NUMBER} -t ${regAddr}/api:latest ./api/'
                sh'docker build -t ${regAddr}/db:${BUILD_NUMBER} -t ${regAddr}/db:latest ./db/'
            }
        }
        stage('PUSH'){
           steps{
                sh'sudo docker push ${regAddr}/app:${BUILD_NUMBER}'
                sh'sudo docker push ${regAddr}/app:latest'
                sh'sudo docker push ${regAddr}/api:${BUILD_NUMBER}'
                sh'sudo docker push ${regAddr}/api:latest'
                sh'sudo docker push ${regAddr}/db:${BUILD_NUMBER}'
                sh'sudo docker push ${regAddr}/db:latest'
            }
        }
        stage('confi deployments'){
            steps{        
                script {
                    sh """sed -i "s|IMAGE-ADDR|${regAddr}|" ./deployment-app.yml"""
                    sh """sed -i "s|IMAGE-NUMBER|${BUILD_NUMBER}|" ./deployment-app.yml"""
                    sh """sed -i "s|IMAGE-ADDR|${regAddr}|" ./deployment-api.yml"""
                    sh """sed -i "s|IMAGE-NUMBER|${BUILD_NUMBER}|" ./deployment-api.yml"""
                    sh """sed -i "s|IMAGE-ADDR|${regAddr}|" ./deployment-db.yml"""
                    sh """sed -i "s|IMAGE-NUMBER|${BUILD_NUMBER}|" ./deployment-db.yml"""
                }
            }
        }
        stage('run deployment'){
            steps{
                sh'sudo kubectl apply -f deployment-app.yml '
                sh'sudo kubectl apply -f deployment-api.yml '
                sh'sudo kubectl apply -f deployment-db.yml '
            }
        }
    }
}
