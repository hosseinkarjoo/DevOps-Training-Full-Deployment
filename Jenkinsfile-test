pipeline {
    environment {
        dockerhubapp = "hosseinkarjoo/devops-training-app"
        dockerhubdb = "hosseinkarjoo/devops-training-db"
        dockerhubapi = "hosseinkarjoo/devops-training-api"
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
        stage ('Build app Docker Image and Push to dockerHub') {
            dir(/app){
                steps {
                    script {
                        image-app = docker.build dockerhubapp
                        docker.withRegistry('https://registry.hub.docker.com', 'hub_credentialsId') {
                            image-app.push("${BUILD_NUMBER}")
                            image-app.push("latest")
                        }
                    }
                }
            }
        }
        stage ('Build Docker Image and Push to dockerHub') {
            dir(/api){
                steps {
                    script {
                        image-api = docker.build dockerhubapi
                        docker.withRegistry('https://registry.hub.docker.com', 'hub_credentialsId') {
                            image-api.push("${BUILD_NUMBER}")
                            image-api.push("latest")
                        }
                    }
                }
            }
        }
        stage ('Build Docker Image and Push to dockerHub') {
            dir(/db){
                steps {
                    script {
                        image-db = docker.build dockerhubdb
                        docker.withRegistry('https://registry.hub.docker.com', 'hub_credentialsId') {
                            image-db.push("${BUILD_NUMBER}")
                            image-db.push("latest")
                        }
                    }
                }
            }
        }
        stage ("Forth - Deploy to Stage") {
            steps {
                script {
                    try {
                        sh 'docker-compose down'
                        sh 'docker image rm dockerhubapp dockerhubdb dockerhubapi'
                    } 
                    catch (err) {
                        echo: 'ERROORR'
                    }
                    sh 'docker-compose up'
                }    
            }
        }
//        stage ("Fifth - HealthCheck") {
//            steps {
//                sh 'docker container exec -i ${dockercontainername}  python test.py'
//            }
//        }

    }
}
