const { MongoClient } = require('mongodb');
const url = 'mongodb://localhost:27017';

const dbName = 'MlopsdeadinsideDB';
const client = new MongoClient(url);

//  initialization 
async function initialize() {
  try {
    await client.connect();
    const db = client.db(dbName);

    const usersCollection = db.collection('users');
    await usersCollection.insertMany([
      { name: 'Ahm1', email: 'Ahm1@example.com' },
      { name: 'Ahm2', email: 'Ahm2@example.com' },
    ]);

    console.log('initialization done.');
  } catch (error) {
    console.error('Error:', error);
  } finally {
    // Closing connection
    client.close();
  }
}

initialize();