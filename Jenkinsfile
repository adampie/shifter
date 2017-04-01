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
            sh 'docker run --rm --name adampie-keycloak -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=password123! -d jboss/keycloak'

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
    stage('Post') {
      steps {
        echo 'Cleaning up docker containers and images in post'
      }
    }
  }
  post {
    always {
      sh 'docker container kill adampie-postgresql'
      sh 'docker container kill adampie-keycloak'
      sh 'docker image rm adampie-shifter'
      sh 'docker image rm postgres'
      sh 'docker image rm debian'
      sh 'docker image rm jboss/keycloak'
    }

  }
}
