pipeline {
  agent any
  stages {
    stage('Docker') {
      steps {
        parallel(
          "Shifter": {
            sh 'docker build -t adampie-shifter .'
            sh 'docker run -i -p 80:80 --rm --name adampie-shifter -d adampie-shifter'
            
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
        parallel(
          "Lumen": {
            sh '''docker exec -t -i adampie-shifter /bin/bash
cd /var/www/api && sudo -H -u adampie composer install
cd /var/www/api && sudo -H -u adampie composer update'''
            
          },
          "VueJS": {
            sh '''docker exec -t -i adampie-shifter /bin/bash
cd /var/www/html && npm install
cd /var/www/html && npm run build'''
            
          }
        )
      }
    }
    stage('Test') {
      steps {
        parallel(
          "PHP Unit": {
            sh '''docker exec -t -i adampie-shifter /bin/bash
cd /var/www/api && phpunit'''
            
          },
          "NPM Unit": {
            sh '''docker exec -t -i adampie-shifter /bin/bash
cd /var/www/html && npm run unit'''
            
          },
          "NPM e2e": {
            sh '''docker exec -t -i adampie-shifter /bin/bash
cd /var/www/html && npm run e2e'''
            
          }
        )
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