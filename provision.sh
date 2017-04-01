# Set up the enviroment
echo "SETTING UP ENVIROMENT"

# User
#useradd -m -U adampie -G www-data -s /bin/bash
#chown -R www-data:www-data /var/www/html

# Apache

# PHP
apt-get install -y wget curl apt-transport-https lsb-release ca-certificates
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list
apt-get update -y
apt-get install -y php7.1

# Composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/bin/composer
chmod +x /usr/bin/composer

# Node

# Build Lumen and VueJS
