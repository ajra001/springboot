pipeline {
  agent any
  stages {
    stage('Message') {
      steps {
        echo 'Jenkins Multi Pipeline'
      }
    }
    stage('Build') {
      steps {
        sh '''sh \'pwd\'
sh \'mvn clean install\''''
      }
    }
  }
}