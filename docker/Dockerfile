# Dockerfile
FROM centos

RUN yum update -y

ADD provision.sh /tmp/provision.sh
RUN ./tmp/provision.sh

CMD top
