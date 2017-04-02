# Set up the enviroment
echo "SETTING UP ENVIROMENT"

apt-get install -y wget curl sudo

# User
useradd -m -U adampie -G www-data -s /bin/bash

# NGiNX
#apt-get install -y nginx

# PHP
echo "deb http://packages.dotdeb.org jessie all " >> /etc/apt/sources.list.d/php.list
echo "deb-src http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list.d/php.list
wget https://www.dotdeb.org/dotdeb.gpg
apt-key add dotdeb.gpg
apt-get update -y
apt-get install -y php5 phpunit php5-mcrypt php5-json php5-curl php5-pgsql


# Composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/bin/composer
chmod +x /usr/bin/composer

# Node
#apt-get install -y build-essential python-software-properties
#curl -sL https://deb.nodesource.com/setup_7.x | bash -
#apt-get install -y nodejs

# Build Lumen and VueJS
chown -R www-data:www-data /var/www/
sudo -H -u adampie bash -c "cd /var/www/api/ && composer update"
#cd /var/www/html/ && npm install && npm run build
