docker build -t adampie-shifter .
docker run -t -i -p 80:80 --rm --name adampie-shifter adampie-shifter
