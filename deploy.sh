cd /var/www/html && sudo -H -u adampie mv .env.example .env
cd /var/www/html && sudo -H -u adampie php artisan key:generate
cd /var/www/html && sudo -H -u adampie php artisan migrate
cd /var/www/html && screen -S shifter -d -m php artisan serve
cd /home/adampie && screen -S caddy -d -m caddy -conf=Caddyfile
