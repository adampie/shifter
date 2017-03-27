pipeline {
  agent any
  stages {
    stage('Build docker image') {
      steps {
        sh '''cd docker
./BUILD-AND-RUN.sh'''
      }
    }
  }
}