pipeline {
    agent { label 'deploy' } // Runs the script on the deployment server 

    parameters {
        // Dropdown to select which environment to roll back to [cite: 14, 19, 71]
        choice(name: 'ROLLBACK_TARGET', choices: ['blue', 'green'], description: 'Rollback NGINX to which environment?')
    }

    stages {
        stage('Rollback NGINX Traffic') {
            steps {
                script {
                    // Logic to define the port: 8081 for Blue, 8082 for Green [cite: 25, 34, 75, 76]
                    def port = params.ROLLBACK_TARGET == 'blue' ? '8081' : '8082'
                    
                    echo "Rolling back NGINX to ${params.ROLLBACK_TARGET.toUpperCase()} (Port ${port})" [cite: 26, 77]

                    // Replaces the proxy_pass line in NGINX config using sed [cite: 27, 34, 78]
                    // It targets the pattern 808(1-2) and replaces it with the selected port
                    sudo sed -i "s/808[1-2]/${port}/" /etc/nginx/sites-available/default [cite: 27, 78]

                    // Restarts NGINX to apply the change [cite: 28, 36, 79]
                    sudo systemctl reload nginx [cite: 28, 79]

                    echo "NGINX traffic is now pointed to ${params.ROLLBACK_TARGET.toUpperCase()} (${port})" [cite: 29, 80]
                }
            }
        }
    }

    post {
        success {
            echo "Rollback complete!" [cite: 38, 83]
        }
        failure {
            echo "Rollback failed. Please verify manually" [cite: 40, 85]
        }
    }
}
