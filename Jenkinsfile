pipeline {
  agent any
  stages {
    stage('BUILD') {
      steps {
        sh './BUILD-AND-RUN.sh'
        sh 'uname -a'
      }
    }
    stage('TEST') {
      steps {
        echo 'ADD TESTING HERE'
      }
    }
  }
}