pipeline {
  agent {
        dockerfile true
  }
  environment {
        PATH = "$PATH:/usr/local/bin"
  }
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
          sh 'rm -rf google-cloud-sdk google-cloud-sdk-228.0.0-linux-x86.tar.gz && wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-228.0.0-linux-x86.tar.gz && tar -xvf google-cloud-sdk-228.0.0-linux-x86.tar.gz && ./google-cloud-sdk/install.sh'
          sh 'gcloud auth login amir.ajroud@gmail.com'
          sh 'docker tag sample-spring-boot  gcr.io/amirproject/sample-spring-boot:latest'
          //sh "docker login -u amir_ajroud -p Cacaroto009 gcr.io/amirproject"
          sh 'docker  push gcr.io/amirproject/sample-spring-boot:latest'
      }
    }
  }
  tools {
    maven 'Maven 3.3.9'
    jdk 'jdk8'
  }
}
