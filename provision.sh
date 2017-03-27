# Set up the enviroment
echo "SETTING UP ENVIROMENT"

# User
useradd -m -U adampie -G www-data
chown -R www-data:www-data /var/www/html

# Composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/bin/composer
chmod +x /usr/bin/composer

runuser -l adampie -c 'cd /var/www/html && composer install'

# Node
