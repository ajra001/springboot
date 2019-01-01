pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        echo 'Jenkins Multi Pipeline'
        git(url: 'https://github.com/ajra001/springboot.git', branch: 'master')
      }
    }
    stage('Build') {
      steps {
        sh 'mvn clean install'
      }
    }
  }
}