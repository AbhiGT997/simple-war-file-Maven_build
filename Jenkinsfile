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
        stage('SonarQube Static-Code Analysis') {
            steps {
                withSonarQubeEnv('sonarqube') { 
        // If you have configured more than one global server connection, you can specify its name
//      sh "${scannerHome}/bin/sonar-scanner"
        sh "mvn sonar:sonar"
            }
        }
    }
  }
}
