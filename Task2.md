# Documentation Task2:
## Task2: Create Dockerfile for Deploying a Web Application on Apache Tomcat using Docker

## Create Dockerfile 
- I already have 1 Dockerfile, So I did another as Dockerfile.tomcat
```
FROM ubuntu:20.04
RUN apt-get update && apt-get install -y openjdk-11-jdk wget && apt-get clean
ENV TOMCAT_VERSION=9.0.87
ENV TOMCAT_HOME=/usr/local/tomcat
RUN wget https://archive.apache.org/dist/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz \
    && tar xvf apache-tomcat-${TOMCAT_VERSION}.tar.gz \
    && mv apache-tomcat-${TOMCAT_VERSION} ${TOMCAT_HOME} \
    && rm apache-tomcat-${TOMCAT_VERSION}.tar.gz
COPY ./index2.html ${TOMCAT_HOME}/webapps/ROOT/index.html
EXPOSE 8080
CMD ["sh", "/usr/local/tomcat/bin/catalina.sh", "run"]
```
### Explanation oF Dockerfile.tomcat
FROM ubuntu:20.04:  Sets the base image to Ubuntu 20.04. The container will be built on top of this OS.

RUN apt-get update:  Updates the package list inside the container.Ensures the latest versions of packages are available.

ENV DEBIAN_FRONTEND=noninteractive:  Prevents interactive prompts during package installation.Useful for automation and script execution.

RUN apt-get install -y openjdk-11-jdk wget:  Installs OpenJDK 11 (Java Development Kit), which is needed to run Tomcat. Installs wget, a tool used to download files from the internet.

ENV TOMCAT_VERSION=9.0.87:  Defines an environment variable for the Tomcat version (9.0.87).

ENV TOMCAT_HOME=/usr/local/tomcat:  Sets an environment variable for the Tomcat installation directory (/usr/local/tomcat).

RUN wget https://archive.apache.org/dist/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz:  Downloads Apache Tomcat 9.0.87 from the Apache archives.

RUN tar xvf apache-tomcat-${TOMCAT_VERSION}.tar.gz:  Extracts the Tomcat archive (.tar.gz file).

RUN mv apache-tomcat-${TOMCAT_VERSION} ${TOMCAT_HOME}:  Moves the extracted Tomcat folder to /usr/local/tomcat for better organization.

RUN rm apache-tomcat-${TOMCAT_VERSION}.tar.gz:  Deletes the downloaded archive to save space and keep the container lightweight.

COPY ./index2.html ${TOMCAT_HOME}/webapps/ROOT/index.html:  Copies the index2.html file (your website) into Tomcat’s root web directory (ROOT). This makes it the default web page when accessing the Tomcat server.

EXPOSE 8080:  Opens port 8080, which is the default port for Tomcat. This allows the container to receive external traffic on this port.

CMD ["sh", "/usr/local/tomcat/bin/catalina.sh", "run"]:  Starts Tomcat in the foreground, keeping the container running. The catalina.sh run command launches the Tomcat server.

### What This Dockerfile Does:
- Creates a Docker container with Ubuntu 20.04.
- Installs OpenJDK 11 and wget.
- Downloads, extracts, and installs Apache Tomcat 9.0.87.
- Copies a custom index2.html web page into Tomcat's default directory.
- Exposes port 8080 for web access.
- Starts the Tomcat server when the container runs

### Create index.html
- It contain webstite content.
  
## Add, Commit, Push it in Remote Repository
```
git add .
git commit - m "creating dokerfile with tomcat service"
git push <url> <branch>
```
## Clone It on AWS instance and go with that directory
```
git clone <url>
```
## Build AMI using docker file 

```
docker build -t <img-name>:<tag> .
```
## Create Docker container using Image 

```
docker run -d -p 8080:8080 --name <name-container> <img-name>:<tag>
```
## And its Done 
- check with instance Ip with port number.
