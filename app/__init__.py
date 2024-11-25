from flask import Flask

app = Flask(__name__)

# Можно добавить маршруты
@app.route('/')
def hello_world():
    return 'Hello, World!'