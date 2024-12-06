# Use the Jenkins LTS image with the latest supported JDK
FROM jenkins/jenkins:lts-jdk17

# Switch to root user to install additional tools
USER root

# Update package lists and install additional dependencies
RUN apt-get update && apt-get install -y \
    maven \
    git \
    nano \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /var

# Expose the Jenkins web interface port
EXPOSE 8080

