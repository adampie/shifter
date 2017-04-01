pipeline {
  agent any
  stages {
    stage('Docker') {
      steps {
        parallel(
          "Shifter": {
            sh 'docker run -i -p 8888:80 --rm --name adampie-shifter adampie-shifter'
            
          },
          "PostgreSQL": {
            sh 'docker run --name adampie-postgresql -e POSTGRES_PASSWORD=password123! -e POSTGRES_DB=shifter -d postgres'
            
          },
          "Keycloak": {
            echo 'ADD KEYCLOAK HERE'
            
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
    stage('Clean Up') {
      steps {
        echo 'Cleaning up docker'
      }
    }
  }
  post {
    always {
      sh 'docker container kill adampie-postgresql'
      sh 'docker container rm adampie-postgresql'
      sh 'docker image rm adampie-postgresql'
      sh 'docker image rm postgres'
      sh 'docker container kill adampie-shifter'
      sh 'docker container rm adampie-shifter'
      sh 'docker image rm centos'
      sh 'docker image rm adampie-shifter'
      
    }
    
  }
}