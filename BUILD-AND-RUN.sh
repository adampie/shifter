cleanUp(){
	# Remove local images pulled for this project
	echo '#####################################'
	echo '#            CLEANING UP            #'
	echo '#####################################'
	docker container kill adampie-postgresql
	docker image rm adampie-postgresql
	docker image rm postgres

	#docker container kill adampie-keycloak
	#docker image rm jboss/keycloak

	docker container kill adampie-shifter
	docker image rm ubuntu
	docker image rm adampie-shifter

}
echo '#################################################'
echo '#    ____  _   _ ___ _____ _____ _____ ____     #'
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
docker run --rm --name adampie-postgresql -e POSTGRES_PASSWORD=password123! -e POSTGRES_DB=shifter -d postgres
echo 'DONE!'

#echo '#####################################'
#echo '#        Deploying Keycloak         #'
#echo '#####################################'
#docker run --rm --name adampie-keycloak -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=password123! -d jboss/keycloak
#echo 'DONE!'

# Build local images - shifter
echo '#####################################'
echo '#          Building Shifter         #'
echo '#####################################'
docker build -t adampie-shifter .
echo 'DONE!'

# Run image (Will remove container on exit)
echo '#####################################'
echo '#         Deploying Shifter         #'
echo '#       http://yourdockerip:80      #'
echo '#####################################'
docker run -t -i -p 80:80 --rm --name adampie-shifter --link adampie-postgresql adampie-shifter

# Clean up
trap cleanUp EXIT
