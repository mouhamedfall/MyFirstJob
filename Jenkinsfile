pipeline {
  environment {
    registry = "mouhamedfall/docker-test"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent any
  stages {
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
    stage('Deploy Kubernetes') {
      steps {
        sh 'kubectl get nodes'
      }
    }
  }
}