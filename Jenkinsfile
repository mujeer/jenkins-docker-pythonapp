pipeline { 
  agent any
  environment {
      
    dockerImage = ''
    registry = 'mujeer472/nginx'
    registryCredential = 'DOCKER-HUB'
  }
  
  stages {
    stage ('Git Checkout') {
        steps {
          git 'https://github.com/mujeer/jenkins-docker-pythonapp.git'
        }
    }
    stage ('Docker Image') {
        steps {
          script {
              dockerImage = docker.build registry + ":$BUILD_NUMBER"
          }
        }
    }
    stage('Deploy our image') { 
        steps { 
            script { 
              docker.withRegistry( '', registryCredential ) { 
              dockerImage.push() 
                    }
                }
         }
    }
    stage('Run command in the docker host') {
        steps {
            script {
              sshagent(credentials: ['ssh-docker'], ignoreMissing: true) { 
              sh 'ssh root@13.78.214.65  "docker run -p 5000:5000 -d --name test mujeer472/nginx:$BUILD_NUMBER"'
               
                  }
            
              } 
            }
        }
    }
    
}
