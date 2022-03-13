pipeline {
    environment {
        nexusRegapp = "172.31.42.252:9001/devops-training-app"
        nexusRegdb = "172.31.42.252:9001/devops-training-db"
        nexusRegapi = "172.31.42.252:9001/devops-training-api"
        nexusReg = "172.31.42.252:9001"
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
                        sh'docker login http://172.31.42.252:9001/repository/docker-reg'
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

