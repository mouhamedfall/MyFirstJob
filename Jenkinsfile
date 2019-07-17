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
          sh " docker login -u mouhamedfall -p TaySiir28 "
          sh " sudo docker push $registry:$BUILD_NUMBER"
          //sh "sudo docker run --name nginx -p 8080:80 -d nginx"
          //docker.withRegistry( '', registryCredential ) {
            //dockerImage.push()
          //}
        }
      }
    }
    stage('Remove Unused docker image') {
        steps{
            sh "sudo docker rmi $registry:$BUILD_NUMBER"
        }
    }
      stage('Deploy container on kubernetes') {
        steps{
            sh "echo 'deploy on kubernetes'"
            //sh "kubectl get nodes"
            sh("kubectl get nodes")
            sh("helm list ")
        }
    }
  }
}
