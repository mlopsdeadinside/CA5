from flask import Flask, request, render_template, redirect, url_for
from pymongo import MongoClient

app = Flask(__name__)
# Extracted MongoDB configuration from Docker Compose
mongo_host = 'localhost'  # This should be the host where your MongoDB container is running
mongo_port = 27017  # This should match the port you've mapped in Docker Compose
mongo_username = 'admin11'  # MongoDB username
mongo_password = '0000'  # MongoDB password
mongo_database = 'MlopsdeadinsideDB'  # MongoDB database name

# Construct MongoDB URI for Flask application
mongodb_uri = f'mongodb://{mongo_username}:{mongo_password}@{mongo_host}:{mongo_port}/{mongo_database}'

# Configure MongoDB
app.config['MONGO_URI'] = mongodb_uri

client = MongoClient(app.config['MONGO_URI'])
db = client.get_database()

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        name = request.form['name']
        username = request.form['username']
        email = request.form['email']

        users_collection = db.users  # Change "users" to the name of your MongoDB collection
        user_data = {
            'name': name,
            'username': username,
            'email': email
        }
        users_collection.insert_one(user_data)

        return redirect(url_for('users'))

    return render_template('index.html')

@app.route('/users')
def users():
    users_collection = db.users  # Change "users" to the name of your MongoDB collection
    data = users_collection.find()

    return render_template('users.html', users=data)

if __name__ == '__main__':
    app.run(debug=True)
