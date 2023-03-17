#Get base Tomcat image & to deploy custom War file!

FROM tomcat
MAINTAINER root
RUN apt-get update && apt-get install -y nano
RUN apt-get install -y git && apt-get install -y tree
ENV CATALINA_HOME: /usr/local/tomcat
ENV CATALINA_BASE: /usr/local/tomcat
ENV CATALINA_TMPDIR: /usr/local/tomcat/temp
ENV JRE_HOME: /usr
COPY /target/hello-1.0.war /usr/local/tomcat/webapps.dist
CMD ["catalina.sh", "run"]
