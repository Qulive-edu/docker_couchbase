from flask import Flask, jsonify
from couchbase.cluster import Cluster, ClusterOptions
from couchbase.auth import PasswordAuthenticator
from couchbase.exceptions import CouchbaseException

app = Flask(__name__)

cluster = Cluster('couchbase://couchbase', ClusterOptions(PasswordAuthenticator('admin', 'password')))
bucket = cluster.bucket('default')
collection = bucket.default_collection()


@app.route('/create_user', methods=['POST'])
def create_user():
    try:
        # Создание документа
        collection.upsert('user::1', {'name': 'John Doe', 'age': 30})

        # Чтение документа
        result = collection.get('user::1')
        return jsonify(result.content_as[dict]), 200
    except CouchbaseException as e:
        return jsonify({'error': str(e)}), 500
