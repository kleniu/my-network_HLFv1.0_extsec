### cleanup of old creds and profiles
```
# rm -rf ~/.composer-connection-profiles
# rm -rf ~/.composer-credentials
```

### download docker images
```
# ./s0.downloadFabric.sh
```
```
REPOSITORY                   TAG                 IMAGE ID            CREATED             SIZE
hyperledger/fabric-couchdb   x86_64-1.0.0-rc1    b37a08f8a0cb        2 weeks ago         1.48 GB
hyperledger/fabric-orderer   x86_64-1.0.0-rc1    5ec6333eae10        2 weeks ago         179 MB
hyperledger/fabric-peer      x86_64-1.0.0-rc1    cf6bedc2935e        2 weeks ago         182 MB
hyperledger/fabric-ca        x86_64-1.0.0-rc1    cea779a46670        2 weeks ago         238 MB
hyperledger/fabric-ccenv     x86_64-1.0.0-rc1    13ed472038d2        2 weeks ago         1.29 GB
```

### create fabric (create channel and join peer to the channel)
```
# ./s1.createFabric.sh 
```
```javastript
CONTAINER ID        IMAGE                                         COMMAND                  CREATED             STATUS              PORTS                                            NAMES
2cfe80eefbb6        hyperledger/fabric-peer:x86_64-1.0.0-rc1      "peer node start -..."   4 minutes ago       Up 4 minutes        0.0.0.0:7051->7051/tcp, 0.0.0.0:7053->7053/tcp   peer0.org1.example.com
0bce9eef12b0        hyperledger/fabric-ca:x86_64-1.0.0-rc1        "sh -c 'fabric-ca-..."   4 minutes ago       Up 4 minutes        0.0.0.0:7054->7054/tcp                           ca.org1.example.com
7db268a26291        hyperledger/fabric-couchdb:x86_64-1.0.0-rc1   "tini -- /docker-e..."   4 minutes ago       Up 4 minutes        4369/tcp, 9100/tcp, 0.0.0.0:5984->5984/tcp       couchdb
2bbdc4f6c073        hyperledger/fabric-orderer:x86_64-1.0.0-rc1   "orderer"                4 minutes ago       Up 4 minutes        0.0.0.0:7050->7050/tcp                           orderer.example.com
```

### create example profile and creds
```
# ./s2.createComposerProfile.sh
```

###### based on this [link](https://github.com/hyperledger/composer-tools/blob/master/packages/fabric-dev-servers/README.md).
