pipeline {
  environment {
    registry = "mouhamedfall/docker-test"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent any
  stages {
    // Checkout Stage
        stage ('Checkout') {
          environment {
            HTTPS_PROXY = 'nrs-proxy01.ad-subs.w2k.francetelecom.fr:3128'
            HTTP_PROXY = 'nrs-proxy01.ad-subs.w2k.francetelecom.fr:3128'
            PROXY_ENABLED = 'TRUE'
          }
    stage('Shell-script') {
      steps {
        sh 'echo hello world'
      }
    }
    stage('Cloning Git') {
      steps {
        git 'https://github.com/mouhamedfall/MyFirstJob.git'
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
  }
}
