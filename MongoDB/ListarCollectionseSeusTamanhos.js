-- Listar collections e seus tamanhos


db.getCollectionNames().forEach(function(collection) {
    var stats = db[collection].stats();
    print(collection + ": " + stats.storageSize + " bytes");
});
