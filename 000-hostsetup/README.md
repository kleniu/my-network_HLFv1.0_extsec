### download setup script
```
curl -O https://hyperledger.github.io/composer/prereqs-ubuntu.sh
```
### check version of required tools
```
# git --version    ->>> git version 2.11.0 (Apple Git-81)
# npm --version    ->>> 3.10.10
# node --version   ->>> v6.11.0
# docker --version ->>> Docker version 17.03.1-ce, build c6d412e
```
### install some usefull tools
```
# sudo apt install jq
```
### clean up 
```
# npm uninstall -g composer-cli
# npm uninstall -g generator-hyperledger-composer
# npm uninstall -g composer-rest-server
# npm uninstall -g yo
# npm uninstall -g composer-playground
# npm uninstall -g passport-github
# docker kill $(docker ps -qa)
# docker rm $(docker ps -qa)
# docker rmi -f $(docker images -q)
# rm -rf ~/.composer-connection-profiles
# rm -rf ~/.composer-credentials
```

### install required npm packages
```
# npm install -g composer-cli
# npm install -g generator-hyperledger-composer
# npm install -g composer-rest-server
# npm install -g composer-playground
# npm install -g passport-github
```
