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
                sh'docker build -t c8n.io/hosseinkarjoooutlookcom/app:${BUILD_NUMBER} -t c8n.io/hosseinkarjoooutlookcom/app:latest ./app/'
                sh'docker build -t c8n.io/hosseinkarjoooutlookcom/api:${BUILD_NUMBER} -t c8n.io/hosseinkarjoooutlookcom/api:latest ./api/'
                sh'docker build -t c8n.io/hosseinkarjoooutlookcom/db:${BUILD_NUMBER} -t c8n.io/hosseinkarjoooutlookcom/db:latest ./db/'
                sh'docker login -u "hosseinkarjoo@outlook.com" -p "z8CIlygf59hu36b0QT4Rhg9kkyR7ysHz" https://c8n.io/hosseinkarjoooutlookcom/repository/docker-reg'
                sh'docker push c8n.io/hosseinkarjoooutlookcom/app:${BUILD_NUMBER}'
                sh'docker push c8n.io/hosseinkarjoooutlookcom/app:latest'
                sh'docker push c8n.io/hosseinkarjoooutlookcom/api:${BUILD_NUMBER}'
                sh'docker push c8n.io/hosseinkarjoooutlookcom/db:${BUILD_NUMBER}'
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
