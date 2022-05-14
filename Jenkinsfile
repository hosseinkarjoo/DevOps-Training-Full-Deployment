pipeline {
    agent {
        node {
            label 'prod'
        }
    }
    stages {
        stage('Clone Git Project') {
            steps {
                git url: 'https://github.com/hosseinkarjoo/DevOps-Training-Full-Deployment.git', branch: 'project-compose', credentialsId: 'github_creds'
            }
        }
        stage('build and push'){
            steps{
                sh'docker build -t 109736915890.dkr.ecr.us-east-1.amazonaws.com/app:${BUILD_NUMBER} -t 109736915890.dkr.ecr.us-east-1.amazonaws.com/app:latest ./app/'
                sh'docker build -t 109736915890.dkr.ecr.us-east-1.amazonaws.com/api:${BUILD_NUMBER} -t 109736915890.dkr.ecr.us-east-1.amazonaws.com/api:latest ./api/'
                sh'docker build -t 109736915890.dkr.ecr.us-east-1.amazonaws.com/db:${BUILD_NUMBER} -t e109736915890.dkr.ecr.us-east-1.amazonaws.com/db:latest ./db/'
//                sh'docker login -u "admin" -p "123@qwer" https://ec2-52-4-250-168.compute-1.amazonaws.com:8443/repository/docker-reg'
                sh'sudo docker push 109736915890.dkr.ecr.us-east-1.amazonaws.com/app:${BUILD_NUMBER}'
                sh'sudo docker push 109736915890.dkr.ecr.us-east-1.amazonaws.com/app:latest'
                sh'docker push 109736915890.dkr.ecr.us-east-1.amazonaws.com/api:${BUILD_NUMBER}'
                sh'sudo docker push 109736915890.dkr.ecr.us-east-1.amazonaws.com/api:latest'
                sh'docker push 109736915890.dkr.ecr.us-east-1.amazonaws.com/db:${BUILD_NUMBER}'
                sh'sudo docker push 109736915890.dkr.ecr.us-east-1.amazonaws.com/db:latest'
            }
        }
 //       stage('run ansible'){
 //           steps{        
 //               input("Ready to proceed?")
 //           }
 //       }
        stage('run deployment'){
            steps{
//                sh'sudo kubectl delete secret regcred'
//                sh'sudo kubectl create secret docker-registry regcred --docker-server="https://ec2-52-90-104-177.compute-1.amazonaws.com:8081" --docker-username="admin" --docker-password="123@qwer"'
                sh'sudo kubectl apply -f deployment-flask-app.yml '
            }
        }
    }
}
