docker run --rm --name adampie-postgresql -e POSTGRES_PASSWORD=password123! -e POSTGRES_DB=shifter -d postgres
docker build -t adampie-shifter .
docker run -t -i -p 80:80 -p 443:443 -p 8080:8080 -p 8081:8081 --rm --name adampie-shifter --link adampie-postgresql adampie-shifter
