pipeline {
    environment {
        nexusRegapp = "c4df90f5fc3c.mylabserver.com:9001/devops-training-app"
        nexusRegdb = "c4df90f5fc3c.mylabserver.com:9001/devops-training-db"
        nexusRegapi = "c4df90f5fc3c.mylabserver.com:9001/devops-training-api"
        nexusReg = "1c4df90f5fc3c.mylabserver.com:9001"
        dockerhubpass = credentials('hub_credentialsId')
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
        stage ('image cleanup') {
            steps {
                script {
                    sh'docker image rmi $(docker image ls -qa) --force'
                }
            }
        }          
        stage ('Build') {
            steps {
                script {
                    sh 'docker-compose build '
                }
            }
        }
        stage ('Third - Push Images to DockerHub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'nexusReg-Creds', passwordVariable: 'NEXUS_PASSWORD', usernameVariable: 'NEXUS_USERNAME')]) {
                        sh'docker login http://c4df90f5fc3c.mylabserver.com:9001/repository/docker-reg'
                        sh 'docker-compose push'
                    }
                    
                }
            }
        }
        stage ('Deploy') {
            steps {
                script {
                    try {
                        sh'docker-compose down'
                        sh'docker-compose rm --force'
                    }
                    catch (err) {
                        echo: 'EROR'
                    }    
                    sh'docker-compose up'
                }
            }
        }
       stage ('test') {
            steps {
                script { 
                    sh'docker container exec -i devops-training-db mysql show databases;'
                }
            }
       }
    }
}

