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
                sh'docker build -t c4df90f5fc3c.mylabserver.com:8082/app:${BUILD_NUMBER} -t c4df90f5fc3c.mylabserver.com:8082/app:latest ./app/'
                sh'docker build -t c4df90f5fc3c.mylabserver.com:8082/api:${BUILD_NUMBER} -t c4df90f5fc3c.mylabserver.com:8082/api:latest ./api/'
                sh'docker build -t c4df90f5fc3c.mylabserver.com:8082/db:${BUILD_NUMBER} -t c4df90f5fc3c.mylabserver.com:8082/db:latest ./db/'
                sh'docker login -u "admin" -p "123@qwer" http://c4df90f5fc3c.mylabserver.com:8082/repository/docker-reg'
                sh'docker push c4df90f5fc3c.mylabserver.com:8082/app:${BUILD_NUMBER}'
                sh'docker push c4df90f5fc3c.mylabserver.com:8082/app:latest'
                sh'docker push c4df90f5fc3c.mylabserver.com:8082/api:${BUILD_NUMBER}'
                sh'docker push c4df90f5fc3c.mylabserver.com:8082/db:${BUILD_NUMBER}'
            }
        }
        stage('run deployment'){
            steps{
//                sh'sudo kubectl delete secret regcred'
                sh'sudo kubectl create secret docker-registry regcred --docker-server="http://c4df90f5fc3c.mylabserver.com:8082" --docker-username="admin" --docker-password="123@qwer"'
                sh'sudo kubectl apply -f deployment-flask-app.yml'
            }
        }
    }
}
