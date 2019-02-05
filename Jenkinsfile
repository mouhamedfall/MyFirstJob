pipeline {
  environment {
    registry = "mouhamedfall/docker-test"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/mouhamedfall/MyFirstJob.git'
      }
    }
    stage('Unit Tests') {
      steps {
        sh "unit tests"
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
    stage('Remove Unused docker image') {
        steps{
            sh "docker rmi $registry:$BUILD_NUMBER"
        }
    }
      stage('Deploy container on kubernetes') {
        steps{
            sh "sudo kubectl --kubeconfig .kube/config  get nodes"
        }
    }
  }
}