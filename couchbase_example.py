from couchbase.cluster import Cluster, ClusterOptions
from couchbase.auth import PasswordAuthenticator
from couchbase.exceptions import CouchbaseException

# Подключение к Couchbase
cluster = Cluster('couchbase://couchbase', ClusterOptions(PasswordAuthenticator('admin', 'password')))
bucket = cluster.bucket('default')
collection = bucket.default_collection()

try:
    # Создание документа
    collection.upsert('user::1', {'name': 'John Doe', 'age': 30})

    # Чтение документа
    result = collection.get('user::1')
    print(result.content_as[dict])
except CouchbaseException as e:
    print(f"Error: {e}")
