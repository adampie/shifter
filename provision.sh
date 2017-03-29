# Set up the enviroment
echo "SETTING UP ENVIROMENT"

# User
#useradd -m -U adampie -G www-data -s /bin/bash
#chown -R www-data:www-data /var/www/html

# Apache
yum install -y httpd

# PHP
yum install -y php

# Composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/bin/composer
chmod +x /usr/bin/composer

#runuser -l adampie -c 'cd /var/www/html && composer install'

# Node
