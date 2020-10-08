pipeline {
    options {
        buildDiscarder(logRotator(numToKeepStr: '30', artifactNumToKeepStr: '0'))
    }
    
    agent none
    
    stages {

        stage('Build image') {
            agent { label 'milkshake' }

            steps {

                git branch: 'master',
                    url: 'https://github.com/tarof429/tron_legacy_cast.git'                

                script {
                    withEnv(["SHA=${env.GIT_COMMIT}", "DOCKER_USERNAME=${env.DOCKER_USERNAME}", "DOCKER_PASSWORD=${env.DOCKER_PASSWORD}"]) {
                        status = sh(returnStatus: true, script: "sh ./deploy.sh")
                        if (status != 0) {
                            error("Deployment failed")
                        }
                    }
                }
            }
        }
    }
}