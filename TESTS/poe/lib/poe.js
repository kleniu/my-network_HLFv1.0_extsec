/**
 * POE transaction processor function.
 * @param {org.poe.addDoc} tx adding new doc as asset.
 * @transaction
 */
function addDoc(tx) {
        return getAssetRegistry('org.poe.docAsset')
                .then(function (registry) {
                        // get the Participant who issues the transaction
                        var currentParticipant = getCurrentParticipant();

                        // Get the factory. Factory is required to create new asset.
                        var factory = getFactory();

                        // Create a new doc. Args: "namespace of the resource to create", "The type of the resource to create.", "The identifier of the new resource."
                        var newDoc = factory.newResource('org.poe', 'docAsset', tx.hash);

                        // Set the properties of the new doc.
                        newDoc.owner = currentParticipant.getFullyQualifiedIdentifier() ;
                        newDoc.name = tx.name;
                        newDoc.version = tx.version;
                        newDoc.hashType = tx.hashType;
                        /* newDoc.time = tx.time; */

                        return registry.add(newDoc);
                });
} 
