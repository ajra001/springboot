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
        sh 'docker login -u amirajroud -p cacaroto7'
        sh 'docker build . -t sample-spring-boot:latest'
      }
    }
    stage('Docker Push') {
      agent any
      steps {
        sh 'docker tag sample-spring-boot amirajroud/sample-spring-boot:latest'
        sh 'docker  push amirajroud/sample-spring-boot:latest'
      }
    }
    stage('GCloud Push') {
      steps {
        sh 'sudo -u root snap install google-cloud-sdk --classic'
        sh 'gcloud auth activate-service-account --project=amirproject --key-file=amirproject-001.json'
        sh 'gcloud config set account jenkins-gcr-account-5@amirproject.iam.gserviceaccount.com'
        sh 'gcloud auth application-default login --no-launch-browser'
        sh 'gcloud compute instances list'
        sh 'gcloud auth list'
        sh 'gcloud auth revoke'
        sh 'gcloud info'
        sh 'docker tag sample-spring-boot  gcr.io/amirproject/sample-spring-boot:latest'
        sh 'docker  push gcr.io/amirproject/sample-spring-boot:latest'
      }
    }
  }
  tools {
    maven 'Maven 3.3.9'
    jdk 'jdk8'
  }
}
