pipeline {
    environment {
        regAddr = '088190408337.dkr.ecr.us-east-1.amazonaws.com'
    }
    agent {
        node {
            label 'prod'
        }
    }
    stages {
        stage('Clone Git Project') {
            steps {
                git url: 'https://github.com/hosseinkarjoo/DevOps-Training-Full-Deployment.git', branch: 'k8s-monitor', credentialsId: 'github_creds'
            }
        }
//        stage('gather info - Buld prometheus config file') {
//            steps {
//                script {
//                    sh'/bin/bash ./prometheus-monitor-config.sh'
//                }
//            }
//        }
        stage ('Deploy to Minoting-Stack') {
            steps {
                script {
//                    try {
//                        sh'docker-compose down'
 //                       sh'docker-compose rm --force'
  //                  }
 //                   catch (err) {
 //                       echo: 'EROR'
 //                   }
                    sh'sudo kubectl apply -f cm-prometheus.yml'                    
                    sh'sudo kubectl apply -f deployment-prometheus.yml'
                    sh'sudo kubectl apply -f svc-prometheus.yml'
                    sh'sudo kubectl apply -f rbac-prometheus.yml'
                }
            }
        }                      
//       stage ('test') {
//           steps {
//              script {
//                 try {
//                sh'timeout 5s docker container run -i --rm --network flask_app_main-net mikesplain/telnet flask_app_devops-training-app 80 > /tmp/mysql-test'
//               }
//              catch (err) {
//                 echo: 'ERRORR'
//            }
//           sh'cat /tmp/mysql-test | grep Connect'
//      }
// }
// }
    }
}
