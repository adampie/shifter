cd /var/www/html && screen -S app -d -m npm run dev
cd /var/www/api && screen -S api -d -m php -S 0.0.0.0:8081 -t public/
cd /home/adampie && screen -S caddy -d -m caddy -conf=Caddyfile
