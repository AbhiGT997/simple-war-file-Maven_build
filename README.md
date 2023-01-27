Sample-java-war-hello-Tomcat-Deployment
=======================================

Sample Hello World Java application packaged as a war file, Copy and deployed in Tomcat container:

## Prerequisites

- Git
- Java
- Maven
- Docker

## Running

1. git clone the repo to local
2. cd boxfuse-sample-java-war-hello
3. Run "mvn package"
4. A deployable War file would be generated in target/hello-1.0.war Directory.
5. Build image using docker use: "docker build -t tomcat:1.0 ."
6. Run the image using command "docker run -d -t -p 7070:8080 tomcat:1.0"
7. By default the Webbapps folder would be de-adtivated, we need to go into the container using command: "docker exec -it <-container id-> bash
8. By default it would load to /usr/local/tomcat directory, where we have to delete the webbapps folder & re-name webapps.dist folder as webbapps
9. Use command mv /webapps.dist /webapps <-Check whether the hello-1.0.war file is loaded inside the webapps folder->
10. Go to the http address ie: <ip_address>:7070/hello-1.0 eg: localhost:7070/hello-1.0

Done!

Open your browser at http://localhost:7070/hello-1.0 To open up the page. 
