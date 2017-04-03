docker build -t adampie-shifter .
docker run -t -i -p 8080:80 -p 8443:443 --rm --name adampie-shifter adampie-shifter
