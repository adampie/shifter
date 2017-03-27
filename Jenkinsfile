pipeline {
  agent any
  stages {
    stage('BUILD') {
      steps {
        sh './BUILD-AND-RUN.sh'
      }
    }
    stage('TEST') {
      steps {
        echo 'ADD TESTING HERE'
      }
    }
  }
}