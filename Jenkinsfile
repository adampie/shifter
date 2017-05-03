pipeline {
  agent any
  stages {
    stage('Docker') {
      steps {
        parallel(
          "Shifter": {
            sh 'docker build -t adampie-shifter .'
            sh 'docker run -d --rm -t -p 80:80 --name adampie-shifter --link adampie-postgresql adampie-shifter'
            
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
          "Laravel": {
            sh '''docker exec adampie-shifter /bin/bash -c "cd /var/www/html && sudo -H -u adampie composer install"
docker exec adampie-shifter /bin/bash -c "cd /var/www/html && sudo -H -u adampie composer update"
docker exec adampie-shifter /bin/bash -c "sudo -H -u adampie mv /var/www/html/.env.example /var/www/html/.env"
docker exec adampie-shifter /bin/bash -c "cd /var/www/html && sudo -H -u adampie php artisan key:generate"
docker exec adampie-shifter /bin/bash -c "cd /var/www/html && sudo -H -u adampie php artisan migrate"
'''
            
          },
          "VueJS": {
            sh '''docker exec adampie-shifter /bin/bash -c "cd /var/www/html && npm install"
docker exec adampie-shifter /bin/bash -c "cd /var/www/html && npm run production"'''
            
          }
        )
      }
    }
    stage('Test') {
      steps {
        sh 'docker exec adampie-shifter /bin/bash -c "cd /var/www/html && phpunit"'
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
      sh 'docker container kill adampie-shifter'
      sh 'docker container kill adampie-postgresql'
      sh 'docker container kill adampie-keycloak'
      sh 'docker image rm adampie-shifter'
      sh 'docker image rm postgres'
      sh 'docker image rm ubuntu'
      sh 'docker image rm jboss/keycloak'
      
    }
    
  }
}