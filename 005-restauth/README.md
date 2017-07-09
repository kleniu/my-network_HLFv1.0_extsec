### Important Notes
(1) for the sake of simplicity we are still using http. In prod env you should consider switch to https.
(2) the scenario described below requires that clients trust the REST server, since the REST server stores the clients Blockchain identities, including the private keys.

### register your app on GitHub
1. Login to your GitHub account
2. Click "View profile and mode" icon on top right corner
3. Hit "Settings" 
4. Hit "OAuth applications"
5. Press "Register new application" button
6. Provide:
- Application name: Composer
- Hompage URL: 
- Application description: 
- Authorization callback URL: 
and hit "Register application"
7. Remember values
```
Client ID
    <_your_client_id_>
Client Secret
    <_your_client_secret_>
```

### start secured REST API server
```json
export COMPOSER_PROVIDERS='{
  "github": {
    "provider": "github",
    "module": "passport-github",
    "clientID": "_your_client_id_",
    "clientSecret": "_your_client_secret_",
    "authPath": "/auth/github",
    "callbackURL": "/auth/github/callback",
    "successRedirect": "/",
    "failureRedirect": "/"
  }
}'
```
```
# composer-rest-server -p hlfv1 -n my-network -i part1 -s qyRSFVCnyZLH -N never -S true
```

When you configure the Composer REST server this way, each authenticated user gets their own private wallet on the Composer REST server to store Blockchain identities (enrolment certificates). The Composer REST server uses a Blockchain identity from the authenticated users private wallet to submit all REST API calls to the Blockchain.


### check 
now we are not able to ping network, as we did previously
```
curl -s -X GET --header 'Accept: application/json' 'http://localhost:3000/api/system/ping' | jq
```
```json
{
  "error": {
    "statusCode": 401,
    "name": "Error",
    "message": "Authorization Required",
    "code": "AUTHORIZATION_REQUIRED",
    "stack": "<... removed ...>"
  }
}
```
let's fix it in next step

### authenticate with your GitHub user
Using Firefox do following
1. Open http://localhost:3000/auth/github
2. Authenticate with your credentials on GitHub
3. On response you will see JSON data - click on Headers tab
4. Copy Cookie content to clipboard
5. Export env variable CONCOOK with copied cookie content, e.g.:
```
export CONCOOK="connect.sid=s%3AsHLbnHugGmHm3rMcxaIW7z4WLXcsb0Vy.W980RXCGapF%2Bz6KYQv9qQffK3KtJxVjpEhvkvkfNayg; access_token=s%3AF7V2btGUZnmTc7G8kyPKOxdY98Jzz8lyCmALdBRgqM84DpygcJAkQaxIjm8ZZpEC.XTH4qGri9fgVtXAEJ4FphSP8otbYKbhDQxdi1ZG8MLQ; userId=s%3A1.cJt90VPvLRb6wgFdnj86fADkYfCuYUekaSPp%2BMgYdzo"
```
we will use CONCOOK in subsequent commands

### check 
now are not able to ping network, because we are authenticated with GitHub only, but not with fabric
```
curl -s -X GET --header 'Accept: application/json' --cookie "$CONCOOK" 'http://localhost:3000/api/system/ping' | jq
```
```json
{
  "error": {
    "statusCode": 500,
    "name": "Error",
    "message": "No enrollment ID or enrollment secret has been provided",
    "stack": "<... removed ...>"
  }
}
```
let's fix it in next step

### configure wallet
1. Read defined wallets
it must be done every time you start or restart REST Server
```
curl -s -X GET --header 'Accept: application/json' --cookie "$CONCOOK" 'http://localhost:3000/api/wallets' | jq
```
```json
[
  {
    "description": "Default wallet",
    "id": 1
  }
]
```
2. Create new instance of identity
it must be done every time you start or restart REST Server
```
curl -s -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --cookie "$CONCOOK" -d '{"enrollmentID": "robert", "enrollmentSecret": "SCEjAoFgOlcd"}' 'http://localhost:3000/api/wallets/1/identities' | jq
```
```json
{
  "enrollmentID": "robert",
  "enrollmentSecret": "SCEjAoFgOlcd",
  "id": 1
}
```
3. Set identity as default in wallet
it must be done every time you start or restart REST Server
responce code 204 means success
```
curl -s -X POST -w "%{http_code}" --header 'Content-Type: application/json' --header 'Accept: application/json' --cookie "$CONCOOK" 'http://localhost:3000/api/wallets/1/identities/1/setDefault'
```

### check again
```
curl -s -X GET --header 'Accept: application/json' --cookie "$CONCOOK" 'http://localhost:3000/api/system/ping' | jq
```
```json
{
  "version": "0.9.1",
  "participant": "org.acme.sample.SampleParticipant#robert"
}
```

now it works fine

## based on https://hyperledger.github.io/composer/integrating/enabling-rest-authentication.html
