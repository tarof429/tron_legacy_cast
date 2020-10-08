pipeline {
    agent none
    
    stages {
        stage('Build image') {
            agent { label 'milkshake' }

            steps {

                git branch: 'master',
                    url: 'https://github.com/tarof429/tron_legacy_cast.git'                

                script {
                    env.SHA = sh(script: 'git rev-parse HEAD', returnStdout: true).trim()                    
                    echo "Building git revision ${env.SHA}"
                }
                
                dockerfile {
                    dir 'api_client'
                    label 'tarof429/tron_legacy_cast:latest'
                }
            }
        }
    }
}