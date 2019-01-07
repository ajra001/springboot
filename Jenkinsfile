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
        sh 'pwd'
        sh 'docker build . -t sample-spring-boot:latest'
      }
    }
    stage('Docker Push') {
      agent any
      steps {
        withCredentials([sshUserPrivateKey(credentialsId: 'amirproject', keyFileVariable: '2d81c6222af2701092a6ab819aff36da9898d05d')]) {
          //sh "docker login -u amir_ajroud -p Cacaroto009 gcr.io/amirproject"
          sh 'docker push sample-spring-boot:latest'
        }
      }
    }
  }
  tools {
    maven 'Maven 3.3.9'
    jdk 'jdk8'
  }
}
