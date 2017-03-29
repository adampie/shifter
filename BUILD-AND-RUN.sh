cleanUp(){
	# Remove local images pulled for this project
	echo '#####################################'
	echo '#            CLEANING UP            #'
	echo '#####################################'
	docker container kill adampie-postgresql
	docker container rm adampie-postgresql
	docker image rm adampie-postgresql
	docker image rm postgres

	docker container kill adampie-shifter
	docker container rm adampie-shifter
	docker image rm centos
	docker image rm adampie-shifter

}
echo '#################################################'
echo '#    ____  _   _ ___ _____ _____ _____ ____     # '
echo '#   / ___|| | | |_ _|  ___|_   _| ____|  _ \    #'
echo '#   \___ \| |_| || || |_    | | |  _| | |_) |   #'
echo '#    ___) |  _  || ||  _|   | | | |___|  _ <    #'
echo '#   |____/|_| |_|___|_|     |_| |_____|_| \_\   #'
echo '#                                               #'
echo '#################################################'



# Run PostgreSQL and Keycloak
echo '#####################################'
echo '#        Deploying PostgreSQL       #'
echo '#####################################'
docker run --name adampie-postgresql -e POSTGRES_PASSWORD=password123! -e POSTGRES_DB=shifter -d postgres
echo 'DONE!'

# Build local images - shifter
echo '#####################################'
echo '#          Building Shifter         #'
echo '#####################################'
docker build -t adampie-shifter .
echo 'DONE!'

# Run image (Will remove container on exit)
echo '#####################################'
echo '#         Deploying Shifter         #'
echo '#       http://localhost:8888       #'
echo '#####################################'
#docker run --name adampie-shifter -i --rm  --link adampie-postgresql -d adampie-shifter -t adampie-shifter
docker run -t -i -p 8888:80 --rm --name adampie-shifter adampie-shifter
# Remove
trap cleanUp EXIT
