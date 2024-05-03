pipeline {
    agent any
    stages {
        stage('Checkout Code From Git') {
            steps {
                sh 'git clone https://github.com/InvincibleBen/ttb-automated-assignment.git'
            }
        }
        stage('Run Test Automate') {
            steps {
                sh 'python -m venv .venv'
                sh 'pip install -r requirement.txt'
                sh 'robot -d results 3.robot'
            }
        }
        stage('Send Result To Jenkins') {
            steps {
                archiveArtifacts artifacts: './results', followSymlinks: false
            }
        }
    }
}