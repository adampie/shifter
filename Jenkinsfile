pipeline {
  agent any
  stages {
    stage('Docker') {
      steps {
        parallel(
          "Docker": {
            echo 'Docker'
            
          },
          "PostgreSQL": {
            echo 'PostgreSQL'
            
          }
        )
      }
    }
    stage('Build') {
      steps {
        echo 'Build'
      }
    }
    stage('Test') {
      steps {
        echo 'Test'
      }
    }
    stage('Clean up') {
      steps {
        echo 'Clean up'
      }
    }
  }
}