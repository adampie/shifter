# Dockerfile
FROM eboraas/laravel

EXPOSE 80
EXPOSE 443

# Base
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y net-tools wget curl build-essential python-software-properties zip unzip git

# Node
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get install -y nodejs

# Composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/bin/composer
RUN chmod +x /usr/bin/composer

# Code
COPY /api /var/www/laravel
COPY /app /var/www/html

#RUN cd /var/www/html && npm install && npm run build

CMD ["/bin/bash"]
