# Dockerfile
FROM debian
EXPOSE 8888

RUN apt-get update -y
RUN apt-get upgrade -y

COPY /api /var/www/api/
COPY /app /var/www/html/

ADD provision.sh provision.sh
RUN ./provision.sh

CMD ["/bin/bash"]
