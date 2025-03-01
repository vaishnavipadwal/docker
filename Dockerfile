FROM ubuntu:20.04
RUN apt-get update
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get install apache2 -y
RUN apt install -y apache2-utils
RUN apt clean
COPY ./index.html /var/www/html/index.html
CMD [ "apache2ctl", "-DFOREGROUND"]