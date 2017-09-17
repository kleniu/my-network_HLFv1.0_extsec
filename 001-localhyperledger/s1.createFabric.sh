#!/bin/bash

# Exit on first error, print all commands.
set -e

# Grab the current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo ">>>" $DIR
#
cd "${DIR}"/composer

docker-compose -f "${DIR}"/composer/docker-compose.yaml down
docker-compose -f "${DIR}"/composer/docker-compose.yaml up -d

# cleanup
# rm ca-db/fabric-ca-server.db

# wait for Hyperledger Fabric to start
# incase of errors when running later commands, issue export FABRIC_START_TIMEOUT=<larger number>
export FABRIC_START_TIMEOUT=15
echo Waiting ${FABRIC_START_TIMEOUT} seconds for OSN ....
sleep ${FABRIC_START_TIMEOUT}

# Create the channel
docker exec peer0.org1.example.com peer channel create -o orderer.example.com:7050 -c composerchannel -f /etc/hyperledger/configtx/composer-channel.tx

# Join peer0.org1.example.com to the channel.
docker exec -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp" peer0.org1.example.com peer channel join -b composerchannel.block

cd ..
