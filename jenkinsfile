pipeline {
    agent { node { label 'linux-rohit'
    customWorkspace '/home/ec2-user' }
    }
    stages {
        stage('Checkout') {
            steps {
                sh '''
                rm -rf game-of-life
                git clone https://github.com/Dee601/game-of-life.git
                cd game-of-life
                '''
                echo 'Checkout Successfully'
            }
        }
        stage('Build') {
            steps {
                sh '''
                cd /home/ec2-user/game-of-life
                mvn clean install
                '''
                echo 'Build Successfully'
            }
        }
        stage('Deploy') {
            steps {
                sh 'cp game-of-life/gameoflife-web/target/gameoflife.war /mnt/apache-tomcat-9.0.81/webapps'
                echo 'Build Successfully'
            }
        }
    }
}
