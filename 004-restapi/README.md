### run REST API server 
```
# composer-rest-server -p hlfv1 -n my-network -i part1 -s ... -N never
```
or
```
# composer-rest-server -p hlfv1 -n my-network -i part2 -s ... -N never
```
now lets check what participant will be used to make transactions
```
curl -s -X GET --header 'Accept: application/json' 'http://localhost:3000/api/system/ping' | jq
```
```json
{
  "version": "0.9.1",
  "participant": "org.acme.sample.SampleParticipant#PART1"
}
```
it's the user who has started the REST API server. Let's change it!
