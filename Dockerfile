# Dockerfile
FROM php:7.1-apache
EXPOSE 8888

RUN apt-get update -y
RUN apt-get upgrade -y

COPY /api /var/www/html/
RUN cd /var/www/html && ls -la

ADD provision.sh provision.sh
RUN ./provision.sh
RUN cd /var/www/html && ls -la
