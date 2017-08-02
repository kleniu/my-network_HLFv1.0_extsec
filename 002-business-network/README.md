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
2363cb70ca81        dev-peer0.org1.example.com-my-network-0.10.1   "chaincode -peer.a..."   33 seconds ago      Up 32 seconds                                                        dev-peer0.org1.example.com-my-network-0.10.1
b7107832dd0d        hyperledger/fabric-peer:x86_64-1.0.0           "peer node start -..."   3 minutes ago       Up 3 minutes        0.0.0.0:7051->7051/tcp, 0.0.0.0:7053->7053/tcp   peer0.org1.example.com
669b3e8e10fe        hyperledger/fabric-couchdb:x86_64-1.0.0        "tini -- /docker-e..."   3 minutes ago       Up 3 minutes        4369/tcp, 9100/tcp, 0.0.0.0:5984->5984/tcp       couchdb
a9239ae59953        hyperledger/fabric-orderer:x86_64-1.0.0        "orderer"                3 minutes ago       Up 3 minutes        0.0.0.0:7050->7050/tcp                           orderer.example.com
b377ef4a480f        hyperledger/fabric-ca:x86_64-1.0.0             "sh -c 'fabric-ca-..."   3 minutes ago       Up 3 minutes        0.0.0.0:7054->7054/tcp                           ca.org1.example.com
```
