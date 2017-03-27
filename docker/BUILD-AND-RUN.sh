cleanUp(){
	# Remove local images pulled for this project
	docker rmi adampie-shifter
	docker rmi centos
}

# Build local images - shifter
docker build -t adampie-shifter .

# Run image (Will remove container on exit)
docker run -i --rm -t adampie-shifter

# Remove
trap cleanUp EXIT
