pipeline {
    agent any
    environment {
        PATH = "/opt/usr/share/maven/bin:$PATH"
    }

    stages {
        stage('Cloning-repo') {
            steps {
                git 'https://github.com/AbhiGT997/simple-war-file-Maven_build.git'
            }
        }
        stage('Building-war-file') {
            steps {
                sh "mvn package"
            }
        }
        stage('The War file created') {
            steps {
                echo "The file has been created"
            }
        }
    }
}
