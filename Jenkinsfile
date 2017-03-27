pipeline {
  agent any
  stages {
    stage('BUILD') {
      steps {
        sh '''cd docker
./BUILD-AND-RUN.sh'''
      }
    }
    stage('TEST') {
      steps {
        echo 'ADD TESTING HERE'
      }
    }
  }
}