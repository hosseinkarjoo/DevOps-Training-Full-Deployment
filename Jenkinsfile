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
                sh'docker build -t ec2-44-197-172-165.compute-1.amazonaws.com:8443/app:${BUILD_NUMBER} -t ec2-44-197-172-165.compute-1.amazonaws.com:8443/app:latest ./app/'
                sh'docker build -t ec2-44-197-172-165.compute-1.amazonaws.com:8443/api:${BUILD_NUMBER} -t ec2-44-197-172-165.compute-1.amazonaws.com:8443/api:latest ./api/'
                sh'docker build -t ec2-44-197-172-165.compute-1.amazonaws.com:8443/db:${BUILD_NUMBER} -t ec2-44-197-172-165.compute-1.amazonaws.com:8443/db:latest ./db/'
                sh'docker login -u "admin" -p "123@qwer" https://ec2-44-197-172-165.compute-1.amazonaws.com/repository/docker-reg'
                sh'docker push ec2-44-197-172-165.compute-1.amazonaws.com:8443/app:${BUILD_NUMBER}'
                sh'docker push ec2-44-197-172-165.compute-1.amazonaws.com:8443/app:latest'
                sh'docker push ec2-44-197-172-165.compute-1.amazonaws.com:8443/api:${BUILD_NUMBER}'
                sh'docker push ec2-44-197-172-165.compute-1.amazonaws.com:8443/db:${BUILD_NUMBER}'
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
//                sh'sudo kubectl create secret docker-registry regcred --docker-server="http://c4df90f5fc3c.mylabserver.com:8081" --docker-username="admin" --docker-password="123@qwer"'
                sh'sudo kubectl apply -f deployment-flask-app.yml'
            }
        }
    }
}
