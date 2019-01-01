pipeline {
  agent any
  stages {
    stage('Initialize') {
      steps {
        sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                '''
      }
    }
    stage('Build') {
      post {
        success {
          junit 'target/surefire-reports/**/*.xml'

        }

      }
      steps {
        sh 'mvn -Dmaven.test.failure.ignore=true install'
      }
    }
    stage('Build image') {
      agent any
      steps {
        echo 'Starting to build docker image'
        sh 'docker build amirajroud/sample-spring-boot:latest'
      }
    }
    stage('Docker Push') {
      agent any
      steps {
        sh 'docker push amirajroud/sample-spring-boot:latest'
      }
    }
  }
  tools {
    maven 'Maven 3.3.9'
    jdk 'jdk8'
  }
}