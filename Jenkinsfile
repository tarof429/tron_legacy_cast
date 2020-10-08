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
                    echo "Building git revision ${env.GIT_COMMIT}"
                    status = sh(returnStatus: true, script: 'docker build -t tarof429/tron_legacy_cast:latest api_client')
                    if (status != 0) {
                        error("Unable to build docker container")
                    }

                    status = sh(returnStatus: true, script: "docker tag tarof429/tron_legacy_cast:latest tarof429/tron_legacy_cast:${env.GIT_COMMIT}")
                    if (status != 0) {
                        error("Unable to tag docker container with git revision")
                    }
                }
            }
        }
    }
}