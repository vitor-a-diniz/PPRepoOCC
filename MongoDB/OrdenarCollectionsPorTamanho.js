-- Ordenar collections por tamanho

var collections = db.getCollectionNames().map(function(collection) {
    var stats = db[collection].stats();
    return {
        name: collection,
        size: stats.storageSize
    };
});

collections.sort(function(a, b) {
    return b.size - a.size;
});

collections.forEach(function(collection) {
    print(collection.name + ": " + collection.size + " bytes");
});