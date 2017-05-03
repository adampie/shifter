sudo -H -u adampie mv /var/www/html/.env.example /var/www/html/.env
cd /var/www/html && sudo -H -u adampie php artisan key:generate
cd /var/www/html && sudo -H -u adampie php artisan migrate
cd /var/www/html && screen -S shifter -d -m php artisan serve --host=0.0.0.0 --port=80
#cd /home/adampie && screen -S caddy -d -m caddy -conf=Caddyfile
