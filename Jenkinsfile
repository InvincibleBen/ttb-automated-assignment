// 5 Please create jenkins pipeline for executing automated script.
// use pipeline script from scm to clone repository and locate Jenkinsfile

pipeline {
    agent any
    stages {
        stage('Run Test Automate') {
            steps {
                sh 'source .venv/bin/activate'
                sh 'robot -d results 3.robot'
            }
        }
        stage('Send Result To Jenkins') {
            steps {
                archiveArtifacts artifacts: 'results/'
            }
        }
    }
}