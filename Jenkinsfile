pipeline {
    environment {
        nexusRegfluentd = "174.129.167.2:8082/fluentd"
        nexusReg = "174.129.167.2:8082"
    }
    agent {
        node {
            label 'logging'
        }
    }
    stages {
        stage('Clone Git Project') {
            steps {
                git url: 'https://github.com/hosseinkarjoo/DevOps-Training-Full-Deployment.git', branch: 'Logging', credentialsId: 'github_creds'
            }
        }
        stage ('image cleanup') {
            steps {
                script {
                    try {
                        sh'docker image rmi $(docker image ls -qa) --force'
                    }
                    catch (err) {
                        echo: 'ERRORR'
                    }
                }
            }
        }          
        stage ('Build') {
            steps {
                script {
                    sh 'docker build -t ${nexusRegfluentd}:${BIULD_NUMBER} .'
                }
            }
        }
        stage ('Third - Push Images to DockerHub') {
            steps {
                script {
//                    withCredentials([usernamePassword(credentialsId: 'nexusReg-Creds', passwordVariable: 'NEXUS_PASSWORD', usernameVariable: 'NEXUS_USERNAME')]) {
                    sh'docker login -u "admin" -p "123@qwer" http://${nexusReg}/repository/docker-reg'
                    sh 'docker push ${nexusRegfluentd}:${BIULD_NUMBER}'
//                    }
                    
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
                    sh'docker stack deploy --compose-file docker-compose-ek.yml elastisearch-kibana'
                }
            }
        }
    }
}
