pipeline {
    agent { node { label 'linux-rohit' } }
    parameters {
                    string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
    }
    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
        stage('Build') {
            steps {
                sh 'java -version'
                echo 'Build Successfully'
            }
        }
        stage('Deploy') {
            steps {
                sh 'mvn -version'
                sh 'cd .'
                echo 'Build Successfully'
            }
        }
    }
}
