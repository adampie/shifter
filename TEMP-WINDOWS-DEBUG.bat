docker build -t adampie-shifter .
docker run -t -i -p 80:80 -p 443:443 -p 8080:8080 -p 8081:8081 --rm --name adampie-shifter adampie-shifter
