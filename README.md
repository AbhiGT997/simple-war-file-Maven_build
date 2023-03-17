# *---Simple-java-war-file-creation-using-maven-build-tool---*


## Simple Maven java war file creation using maven build tool and executing it in a Jenkins pipeline running in a Docker container: 

## Prerequisites

- Docker to be installed & configured

## Creating a Custom-Jenkins image using Docker:

1. Clone this repo to your local and cd to the cloned folder, where Dockerfile amd pom.xml file would be located.

2. Build a custom jenkins image using command:

``` docker build -t custom-jenkins . ```

Note: Check the image use command ``` docker images ``` to list out all the images.

--Before running the container some pre-requisites are needed to run the container with hassel free

- Create a seprate network for jenkins, by using the command: ``` docker network create jenkins ```

- Create a Volume for data persistance, by using the command: ``` docker volume create jenkins-data ```

- Run the following Commands:

``` docker build -d --name jenkins \
-p 7070:8080 \
-v jenkins-data:/var/jenkins_home \
--network jenkins \
custom-jenkins:latest ```

Note: execute first line ie: docker build -d --name jenkins \  then press --enter-- then execute all the commands as mentioned above.

- Check if the container is running or not use command ``` docker ps -a ``` To list out all the running containers



4. A deployable War file would be generated in target/hello-1.0.war Directory.
5. Build image using docker use: "docker build -t tomcat:1.0 ."
6. Run the image using command "docker run -d -t -p 7070:8080 tomcat:1.0"
7. By default the Webbapps folder would be de-adtivated, we need to go into the container using command: "docker exec -it <-container id-> bash
8. By default it would load to /usr/local/tomcat directory, where we have to delete the webbapps folder & re-name webapps.dist folder as webbapps
9. Use command mv /webapps.dist /webapps <-Check whether the hello-1.0.war file is loaded inside the webapps folder->
10. Go to the http address ie: <ip_address>:7070/hello-1.0 eg: localhost:7070/hello-1.0

Done!

Open your browser at http://localhost:7070/hello-1.0 To open up the page. 
