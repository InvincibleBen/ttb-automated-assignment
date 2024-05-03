pipeline {
    agent any
    stages {
        stage('Run Test Automate') {
            steps {
                sh 'pip install -r requirement.txt'
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