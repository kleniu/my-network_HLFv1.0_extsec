#!/bin/bash
# Grab the current directory.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Shut down the Docker containers for the system tests.
cd "${DIR}"/composer
docker kill $(docker ps -qa)
docker rm $(docker ps -qa)


# remove the local state
rm -rf ~/.composer-connection-profiles/*
rm -f ~/.composer-credentials/*

# remove chaincode docker images
CCIM=$(docker images dev-* -q)
if [[ .$CCIM. != .. ]]; then
	docker rmi $CCIM
else 
	echo no chaincode images found. There is nothing to to clean.  
fi

cd ..
# Your system is now clean
