FROM jenkins/jenkins:lts-jdk11
USER root
RUN apt-get update
RUN apt-get install -y openjdk-11-jre-headless && apt-get install -y maven
RUN apt-get install -y git && apt-get install -y nano
WORKDIR /var
EXPOSE 8080

