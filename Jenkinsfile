pipeline {
//    environment {
//    }
    agent {
        node {
            label 'monitoring'
        }
    }
    stages {
        stage('Clone Git Project') {
            steps {
                git url: 'https://github.com/hosseinkarjoo/DevOps-Training-Full-Deployment.git', branch: 'monitoring', credentialsId: 'github_creds'
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
        stage('gather info - ip addresses of Slave Node') {
            agent { label 'prod-stage' }
                steps {
                    script {
//                        sh'/bin/bash ./prometheus-slave-config.sh'
                        sh(script:'MONITOR_PRV_IP=$(/usr/sbin/ip a show eth0 | grep 'inet\b' | awk '{print $2}' | cut -d/ -f1)')
                        sh '''
                        MONITOR_PUB_IP=$(curl ipv4.icanhazip.com)
                        MONITOR_PRV_IP=$(/usr/sbin/ip a show eth0 | grep 'inet\b' | awk '{print $2}' | cut -d/ -f1)
                        echo $MONITOR_PUB_IP
                        echo $MONITOR_PRV_IP
                        '''
                    }
                }
        }
        stage('gather info - Buld prometheus config file') {
            steps {
                script {
                    sh'/bin/bash ./prometheus-monitor-config.sh'
                }
            }
        }
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
                    sh'docker stack deploy --compose-file docker-compose-monitoring-stack.yml monitoring'
                }
            }
        }
        stage ('Deploy to Jenkins-Slave-Node') {
            agent { label 'prod-stage' }
                steps {
                    script {
//                        try {
 //                           sh'docker-compose down'
  //                          sh'docker-compose rm --force'
 //                       }
//                        catch (err) {
//                            echo: 'EROR'
//                        }    
                        sh'docker stack deploy --compose-file docker-compose-slave-node.yml flask_app'
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
