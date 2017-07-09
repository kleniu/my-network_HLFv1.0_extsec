### initial creds
```
ls ~/.composer-credentials/* 
/home/hlfd/.composer-credentials/114aab0e76bf0c78308f89efc4b8c9423e31568da0c340ca187a9b17aa9a4457-priv
/home/hlfd/.composer-credentials/114aab0e76bf0c78308f89efc4b8c9423e31568da0c340ca187a9b17aa9a4457-pub
/home/hlfd/.composer-credentials/PeerAdmin

```

### create participants for starting REST API server
```
# composer participant add -p hlfv1 -n my-network -i PeerAdmin -s ... -d '{"$class":"org.acme.sample.SampleParticipant","participantId":"PART1","firstName":"FN PART1","lastName":"LN PART1"}'
# composer participant add -p hlfv1 -n my-network -i PeerAdmin -s ... -d '{"$class":"org.acme.sample.SampleParticipant","participantId":"PART2","firstName":"FN PART2","lastName":"LN PART2"}'
```

### create participants for regular users
feel free to make your own, robert and onufry user is just an example. You should have 2 accounts on github, so we'll be able to associate them with newly created participants.
```
# composer participant add -p hlfv1 -n my-network -i PeerAdmin -s ... -d '{"$class":"org.acme.sample.SampleParticipant","participantId":"robert","firstName":"Robert","lastName":"Kleniewski"}'
# composer participant add -p hlfv1 -n my-network -i PeerAdmin -s ... -d '{"$class":"org.acme.sample.SampleParticipant","participantId":"onufry","firstName":"Onufry","lastName":"Zagloba"}'
```

### check
```
# composer network list -p hlfv1 -n my-network -i PeerAdmin -s ...
```

### issue identity predefined CA admin user
the password for admin is defined in [docker-compose.yaml](../001-localhyperledger/composer/docker-compose.yaml) line 14
```
# composer identity issue -p hlfv1 -n my-network -i admin -s adminpw -u part1 -a "org.acme.sample.SampleParticipant#PART1"
An identity was issued to the participant 'org.acme.sample.SampleParticipant#PART1'
The participant can now connect to the business network with the following details:
  userID = part1
  userSecret = <1st thing to remember> qyRSFVCnyZLH 
Command succeeded
```
```
# composer identity issue -p hlfv1 -n my-network -i admin -s adminpw -u part2 -a "org.acme.sample.SampleParticipant#PART2"
An identity was issued to the participant 'org.acme.sample.SampleParticipant#PART2'
The participant can now connect to the business network with the following details:
  userID = part2
  userSecret = <2nd thing to remember> YvUwRzUNbFFf
```
```
# composer identity issue -p hlfv1 -n my-network -i admin -s adminpw -u robert -a "org.acme.sample.SampleParticipant#robert"
An identity was issued to the participant 'org.acme.sample.SampleParticipant#robert'
The participant can now connect to the business network with the following details:
  userID = robert
  userSecret = <3rd thing to remember> SCEjAoFgOlcd
Command succeeded
```
```
# composer identity issue -p hlfv1 -n my-network -i admin -s adminpw -u onufry -a "org.acme.sample.SampleParticipant#onufry"
An identity was issued to the participant 'org.acme.sample.SampleParticipant#onufry'
The participant can now connect to the business network with the following details:
  userID = onufry
  userSecret = <4th thing to remember> mhCyBDjRrEuB
Command succeeded
```

### check
```
# composer network ping -p hlfv1 -n my-network -i part1 -s qyRSFVCnyZLH
# composer network ping -p hlfv1 -n my-network -i part2 -s YvUwRzUNbFFf
# composer network ping -p hlfv1 -n my-network -i robert -s SCEjAoFgOlcd
# composer network ping -p hlfv1 -n my-network -i onufry -s mhCyBDjRrEuB 
```

### credentials
```
ls ~/.composer-credentials/* 
/home/hlfd/.composer-credentials/0f3c7e6d0616adf8bd66e4a114f4f93b387419e1c4b97c40d0f2a29bcda53ed0-priv
/home/hlfd/.composer-credentials/0f3c7e6d0616adf8bd66e4a114f4f93b387419e1c4b97c40d0f2a29bcda53ed0-pub
/home/hlfd/.composer-credentials/114aab0e76bf0c78308f89efc4b8c9423e31568da0c340ca187a9b17aa9a4457-priv
/home/hlfd/.composer-credentials/114aab0e76bf0c78308f89efc4b8c9423e31568da0c340ca187a9b17aa9a4457-pub
/home/hlfd/.composer-credentials/14a5e86de39a4c9fd9ed19a28ff5aaa2f4daf7693209f08beb7050741d9cb1d5-priv
/home/hlfd/.composer-credentials/14a5e86de39a4c9fd9ed19a28ff5aaa2f4daf7693209f08beb7050741d9cb1d5-pub
/home/hlfd/.composer-credentials/4effb5a03ed6edc2ad82599ec5c93c816fd903e7b3612cfe0df83e0ca729486e-priv
/home/hlfd/.composer-credentials/4effb5a03ed6edc2ad82599ec5c93c816fd903e7b3612cfe0df83e0ca729486e-pub
/home/hlfd/.composer-credentials/52bfde37988b4c58ecedfb677f163c18814fdc73b4b53b5c747a55c497019c53-priv
/home/hlfd/.composer-credentials/92985a390ddd0299cbed90b567e24e59e83739b10180273ba83de67aaa6e3685-priv
/home/hlfd/.composer-credentials/92985a390ddd0299cbed90b567e24e59e83739b10180273ba83de67aaa6e3685-pub
/home/hlfd/.composer-credentials/9a1f06ef4bd774e43374c5faf194fb7eb27e87c08195f210ddbfc02121c79c33-priv
/home/hlfd/.composer-credentials/9a1f06ef4bd774e43374c5faf194fb7eb27e87c08195f210ddbfc02121c79c33-pub
/home/hlfd/.composer-credentials/admin
/home/hlfd/.composer-credentials/da9aa08f7617dada2ab430048d583611dc63491b9f452ea88019119545fca2cd-priv
/home/hlfd/.composer-credentials/onufry
/home/hlfd/.composer-credentials/part1
/home/hlfd/.composer-credentials/part2
/home/hlfd/.composer-credentials/PeerAdmin
/home/hlfd/.composer-credentials/robert
```
