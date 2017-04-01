pipeline {
  agent any
  stages {
    stage('Docker') {
      steps {
        parallel(
          "Docker": {
            echo 'Creating environment with docker containers '
            
          },
          "PostgreSQL": {
            sh 'docker run --name adampie-postgresql -e POSTGRES_PASSWORD=password123! -e POSTGRES_DB=shifter -d postgres'
            
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
  }
  post {
    always {
      echo 'RUNNING POST'
      
    }
    
  }
}