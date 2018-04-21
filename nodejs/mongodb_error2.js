var MongoClient = require('mongodb').MongoClient;
var url = 'mongodb://127.0.0.1:27017/testdb';
MongoClient.connect(url, function(err, db) {
  if (err) throw (err)

  var col = db.collection("test1");
  var batch = col.initializeUnorderedBulkOp({
    useLegacyOps: true
  });
  console.time('insert,10w');
  for (var i = 0; i < 100000; i++) {
    batch.insert({
      count: i
    });
  }
  batch.execute(function(err) {
    if (err) {
      console.log(err)
    }
    console.timeEnd('insert,10w');
  })
});