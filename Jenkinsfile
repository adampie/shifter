pipeline {
  agent any
  stages {
    stage('BUILD') {
      steps {
        sh './BUILD-AND-RUN.sh', label: 'Test?'
        sh 'uname -a', label: 'Test2?'
      }
    }
    stage('TEST') {
      steps {
        echo 'ADD TESTING HERE'
      }
    }
  }
}
