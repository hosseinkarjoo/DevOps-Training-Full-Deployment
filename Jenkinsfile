pipeline {
    environment {
        dockerhubReg = "hosseinkarjoo/devops-training-app"
        dockercontainername = "devops-training-API"
        dockercontainerRedis = "devops-training-Redis"
    }
    agent {
        node {
            label 'prod-stage'
       }
   }
    stages {
        stage('First - Clone Git Project') {
#            agent { label 'prod-stage' }
            steps {
                git url: 'https://github.com/hosseinkarjoo/DevOps-Training-Full-Deployment.git', branch: 'Back-API', credentialsId: 'github_creds'
                }
            }
        stage ('Secound - Build Docker Image') {
#            agent { label 'prod-stage' }
            steps {
                script {
                    image = docker.build dockerhubReg
                }
            }
        }
        stage ('Third - Push Image to DockerHub') {
#            agent { label 'prod-stage' }
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'hub_credentialsId') {
                        image.push("${BUILD_NUMBER}")
                        image.push("latest")
                    }
                }
            }
        }
        stage ("Forth - Deploy to Stage") {
#            agent { label 'prod-stage' }
            steps {
                script {
                    try {
                        sh 'docker container stop ${dockercontainername}'
                        sh 'docker container rm ${dockercontainername}'
                        sh 'docker image rm ${dockerhubReg}'
                    } 
                    catch (err) {
                        echo: 'ERROORR'
                    }
                    sh 'docker run -d --name ${dockercontainername} -p 8080:5001 --network=main-net ${dockerhubReg}'
                }    
            }
        }
        stage ("Fifth - test app") {
            steps {
                script {
                    try {
                        sh 'python3.6 ./test.py'
                    }
                    catch (err) {
                        echo: 'ERROORR'
                    }
                }
            }
        }
        stage ("Sixth - Deploy Redis-Cache") {
            steps {
                script {
                    try {
                        sh 'docker container stop ${dockercontainerRedis}'
                        sh 'docker container rm ${dockercontainerRedis}'
                    }
                    catch (err) {
                        echo: 'ERROORR'
                    }
                    sh 'docker run -d --name ${dockercontainerRedis} --network=main-net redis
                }
            }


    }
}
