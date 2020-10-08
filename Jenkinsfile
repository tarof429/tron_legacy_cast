pipeline {
    agent none
    
    stages {
        stage('Build image') {
            agent { label 'milkshake' }

            steps {

                git branch: 'master',
                    url: 'https://github.com/tarof429/tron_legacy_cast.git'
                
                dir('tron_legacy_cast') {
                    script {
                        env.SHA = sh(script: 'git rev-parse HEAD', returnStdout: true).trim()                    
                        echo "Building git revision ${env.SHA}"
                    }
                }
                dir('tron_legacy_cast/api_client') {
                    script {
                        pwd = sh(script: 'ls', returnStdout: true).trim()
                        echo "pwd: ${pwd}"
                        status = sh(returnStatus: true, script: 'docker build -t tarof429/tron_legacy_cast:latest .')
                        echo "Status: ${status}"
                    }
                }
            }
        }
    }
}