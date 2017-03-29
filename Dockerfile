# Dockerfile
FROM centos
EXPOSE 8888

RUN yum update -y

#COPY /api /var/www/html/

ADD provision.sh provision.sh
RUN ./provision.sh

CMD ["/bin/bash"]
