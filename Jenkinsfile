pipeline {
  agent any
  stages {
    stage('Docker') {
      steps {
        parallel(
          "Shifter": {
            sh 'docker build -t adampie-shifter .'
            sh 'docker run -i -p 8888:80 --rm --name adampie-shifter adampie-shifter'

          },
          "PostgreSQL": {
            sh 'docker run --rm --name adampie-postgresql -e POSTGRES_PASSWORD=password123! -e POSTGRES_DB=shifter -d postgres'

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
        echo 'Cleaning up docker in post'
      }
    }
  }
  post {
    always {
      echo  'Before'
      sh 'docker container ls -a'
      sh 'docker image ls -a'
      echo 'After'
      sh 'docker container kill adampie-postgresql'
      sh 'docker image rm adampie-shifter'
      sh 'docker image rm postgres'
      sh 'docker image rm centos'
      sh 'docker container ls -a'
      sh 'docker image ls -a'
    }

  }
}
