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
        sh "echo 'unit tests'"
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
          #sh " docker login -u admin -p admin123 mfall:8083"
          sh " docker push $registry:$BUILD_NUMBER"
          #docker.withRegistry( '', registryCredential ) {
            #dockerImage.push()
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
            sh "echo 'deploy on kubernetes'"
        }
    }
  }
}
