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
