#!/bin/bash

# Exit on first error, print all commands.
set -ev

# Grab the current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo ">>>" $DIR
#
cd "${DIR}"/composer

docker-compose -f "${DIR}"/composer/docker-compose.yaml up -d

# Create the channel
#docker exec peer0.org1.example.com peer channel create -o orderer.example.com:7050 -c composerchannel -f /etc/hyperledger/configtx/composer-channel.tx

# Join peer0.org1.example.com to the channel.
#docker exec -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp" peer0.org1.example.com peer channel join -b composerchannel.block

cd ..
