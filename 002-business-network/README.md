### create and deploy banana file
```
# composer archive create --archiveFile my-network.bna --sourceType dir --sourceName .
```
we are using predefined PeerAdmin user to deploy BNA file. Please note that, password provided with -s arg can be random string since we are using certs from KeyVal store defined in profile. 
```
# composer network deploy --archiveFile my-network.bna --connectionProfileName hlfv1 --enrollId PeerAdmin --enrollSecret ... 
```
### check
```
# composer network ping -n my-network -p hlfv1 -i PeerAdmin -s ...
```
the chaincode container is visible now in docker.
```
470c07f1e100        dev-peer0.org1.example.com-my-network-0.9.1   "chaincode -peer.a..."   22 seconds ago      Up 20 seconds                                                        dev-peer0.org1.example.com-my-network-0.9.1
85687ebebafe        hyperledger/fabric-peer:x86_64-1.0.0-rc1      "peer node start -..."   15 minutes ago      Up 15 minutes       0.0.0.0:7051->7051/tcp, 0.0.0.0:7053->7053/tcp   peer0.org1.example.com
5d83c1983338        hyperledger/fabric-couchdb:x86_64-1.0.0-rc1   "tini -- /docker-e..."   15 minutes ago      Up 15 minutes       4369/tcp, 9100/tcp, 0.0.0.0:5984->5984/tcp       couchdb
902e6099fc78        hyperledger/fabric-orderer:x86_64-1.0.0-rc1   "orderer"                15 minutes ago      Up 15 minutes       0.0.0.0:7050->7050/tcp                           orderer.example.com
419837ceb882        hyperledger/fabric-ca:x86_64-1.0.0-rc1        "sh -c 'fabric-ca-..."   15 minutes ago      Up 15 minutes       0.0.0.0:7054->7054/tcp                           ca.org1.example.com
```
