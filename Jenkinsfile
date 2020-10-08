pipeline {
    agent { label 'master' }

    environment {
        SHA = "${sh(script: 'git rev-parse HEAD', returnStdout: true).trim()}"
    }
    
    stages {
        stage('Build image') {
            agent { label 'milkshake' } 
            steps {
                echo "Building git revision ${SHA}"
                // git branch: 'master',
                //     url: 'https://github.com/tarof429/tron_legacy_cast.git'

                // dir('tron_legacy_cast/api_client') {
                //     sh returnStatus: true, script: 'docker build -t tarof429/tron_legacy_cast:latest .'
                // }
            }
        }
    }
}