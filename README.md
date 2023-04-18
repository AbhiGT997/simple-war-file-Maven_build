# *---Simple-java-war-file-creation-using-maven-build-tool---*


## Simple Maven java war file creation using maven build tool and executing it in a Jenkins pipeline running in a Docker container: 

## Prerequisites

- Docker to be installed & configured

## Creating a Custom-Jenkins image using Docker:

1. Clone this repo to your local and cd to the cloned folder, where Dockerfile amd pom.xml file would be located.

2. Build a custom jenkins image using command:

``` docker build -t custom-jenkins . ```

Note: Check the image use command ``` docker images ``` to list out all the images.

--*Before running the container some pre-requisites are needed to run the container with hassle free*--

- Create a seprate network for jenkins, by using the command: ``` docker network create jenkins ```

- Create a Volume for data persistance, by using the command: ``` docker volume create jenkins-data ```

- Run the following Commands:

``` 
docker build -d --name jenkins \
-p 7070:8080 \
-v jenkins-data:/var/jenkins_home \
--network jenkins \
custom-jenkins:latest 
```

Note: execute first line ie: docker build -d --name jenkins \  then press --enter-- then execute all the commands as mentioned above.

- Check if the container is running or not use command ``` docker ps -a ``` To list out all the running containers

- Go to your Browser (crome/edge) type localhost:7070 to access Jenkins portal. if you are using cloud providers VM's open all required security ports and use public ip then port eg: 19.245.45.256:7070 to access the portal.

3. Configuring Jenkins:

- For password we have to log in to the container use command ``` docker ps -a ```  to know all the running containers and use command ``` docker exec -it <cintainer id> bash ``` to log into jenkins container.

- use command cat /var/jenkins_home/secrects/ and initialpasssword file to get your password, copy and paste it to gain access. 

- Insatll all the required pluggins and user data required for log-in.

4. Jenkins Global-Tool-configuration

- Go to jenkins dashbord and to manage jenkins > global-tool-configuration.

- Under JDK add the following [java file directory in the container]

Give a name: Java-11
JAVA_HOME /opt/java/openjdk/bin/java

- Under Maven add the local directory to maven installation file [in container]

Give a name: Maven
MAVEN_HOME /usr/share/maven

- Save the settings.

5. Create a Pipeline:

- Select New item, then Pipeline select a name for the pipelile, and paste the following pipeline script:

```
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
        // If you have configured more than one global server connection, you can specify its name //      
        sh "${scannerHome}/bin/sonar-scanner"
        sh "mvn sonar:sonar"
            }
         }
      }
   }
}
```
6. Save and execute the piplene the build would be completed, it could be checked in the console output.

7. If we exec into the container and navigate to /var/jenkins_home/ the war file would be generated in the pipeline's folder under target directory. 

8. For setting up SonarQube server follow the Readme file in the SonarQube-Server-Setup folder. 

---*Thus a simple War file would be genetated using docker and jenkins and maven to generate all the necessary documentations and create a war file.*---
