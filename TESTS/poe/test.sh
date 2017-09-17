


function testsh() {
	NAME=$1
	SHA=$2

	curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d "{ \"$class\": \"org.poe.docAsset\", \"hash\": \"$SHA\", \"owner\": \"OWNER1\", \"name\": \"$NAME\", \"version\": \"v1\", \"hashType\": \"sha256\" }" 'http://192.168.99.201:3000/api/docAsset' > /dev/null 2>&1 
}

STARTEPOCH=`date +%s`
echo "Start test # $1" `date +%H:%M:%S.%N` "sepoch=$STARTEPOCH"

L=0
while [[ $L -le 43 ]]; do
	NAME=$1`date +%H:%M:%S.%N | sed 's/ /_/g'`
	SHA=`echo $NAME | sha256sum | awk '{print $1}'`
	# echo $NAME $SHA
	
	testsh $NAME $SHA

	(( L = L + 1 ))
done

ENDEPOCH=`date +%s`
(( DUR = ENDEPOCH - STARTEPOCH ))
echo "End test # $1" `date +%H:%M:%S.%N` "eepoch=$ENDEPOCH" "duration=$DUR"
