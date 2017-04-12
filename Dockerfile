# Dockerfile
FROM ubuntu

EXPOSE 80

# Base
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y net-tools wget curl build-essential python-software-properties zip unzip git sudo nano screen htop dos2unix libfontconfig
RUN useradd -m -U adampie -G www-data -s /bin/bash

# PHP
RUN apt-get install -y php7.0 php7.0-curl php7.0-pgsql php7.0-fpm php7.0-mbstring php7.0-mcrypt php7.0-dom
COPY php.ini /ect/php/7.0/cli

# Node
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get update -y
RUN apt-get install -y nodejs

# Composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/bin/composer
RUN chmod +x /usr/bin/composer

# Cady
RUN curl -fsSL https://getcaddy.com | bash -s search
RUN setcap cap_net_bind_service=+ep /usr/local/bin/caddy

# Code
COPY /api /var/www/api
COPY /app /var/www/html
RUN chown -R adampie:www-data /var/www
RUN cd /var/www/api && chmod -R ug+rwx storage bootstrap
RUN cd /var/www/html && npm install && npm run build
RUN cd /var/www/api && sudo -H -u adampie composer install

COPY Caddyfile /home/adampie
COPY deploy.sh /home/adampie
RUN dos2unix /home/adampie/deploy.sh

CMD bash /home/adampie/deploy.sh && htop
