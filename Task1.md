# Documentation - Task 1

## Task 1: Create Docker image using docker file which include apache2 installation and deploy small webstite

## Create Dockerfile:
```
FROM ubuntu:20.04
RUN apt-get update
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get install apache2 -y
RUN apt install -y apache2-utils
RUN apt clean
COPY ./index.html /var/www/html/index.html
CMD [ "apache2ctl", "-DFOREGROUND"]
```
### Explanation of Docker file 
FROM ubuntu:20.04: This sets the base image to ubuntu:20.04. It means the container will be built on top of Ubuntu 20.04.

RUN apt-get update: Updates the package list in the container. Ensures that we get the latest versions of packages.

ENV DEBIAN_FRONTEND=noninteractive: Prevents interactive prompts during package installation. Useful when running commands in an automated script.

RUN apt-get install apache2 -y: Installs Apache2 web server. The -y flag automatically confirms the installation.

RUN apt install -y apache2-utils: Installs additional Apache utilities, such as htpasswd for authentication.

RUN apt clean: Cleans up cached files to reduce image size. This helps keep the container lightweight.

COPY ./index.html /var/www/html/index.html: Copies the local index.html file into the container. Places it in the default Apache web server directory (/var/www/html/).

CMD [ "apache2ctl", "-DFOREGROUND"]: This is the default command that runs when the container starts. apache2ctl -DFOREGROUND keeps Apache running in the foreground so the container doesn’t exit immediately.

### What This Dockerfile Does:
Creates a Docker container with Ubuntu 20.04.
Installs and configures Apache2.
Copies a custom index.html file to serve as the web page.
Starts the Apache web server when the container runs.

## Create inde.html file 
- It include website content
  
## Now add commit and push that file in Remote Repository

## Take ssh of an instance on cloud shell and go with root user
```
ssh -i <key-name> <usr-name>@<pub-IP>
sudo -i
```
## Clone Remote repository on that instance and go in that repositorie's-directory
```
git clone <url>
cd <dir-name>
```
## Build docker image using docker file 
```
docker build -t <img-name>:<tag> .
```
## Check docker image
```
docker images
```

## Create container using builed image by docker file 
```
docker run -d -p <port-no> --name <name> <img-name>:<tag>
```
## And its done check with public-IP of instance with port number on browser
