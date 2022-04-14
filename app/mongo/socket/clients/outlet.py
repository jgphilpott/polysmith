from hashlib import sha256
from flask_socketio import emit

from mongo.data.collect.clients.mongo import *
from mongo.data.collect.clients.model import Client

clients = 0

def connect_clients(app):

    @app.on("connect")
    def connect():

        global clients
        clients += 1

    @app.on("disconnect")
    def disconnect():

        global clients
        clients -= 1

    @app.on("signup")
    def signup(client):

        try:

            find_client({"email": client["email"]})

            emit("signup_failed")

        except:

            client["password"] = sha256(client["password"].encode("utf-8")).hexdigest()
            client = Client(client).refresh_id()

            new_client(client.__dict__)

            emit("signup_success", client.id)

    @app.on("login")
    def login(client):

        try:

            match = find_client({"email": client["email"]})

            if match["password"] == sha256(client["password"].encode("utf-8")).hexdigest():

                client = Client(match).refresh_id()

                update_client(client.__dict__)

                emit("login_success", client.id)

            else:

                emit("login_failed")

        except:

            emit("login_failed")

    @app.on("update_settings")
    def update_settings(update):

        try:

            client = Client(find_client({"id": update["id"]})).update_settings(update["category"], update["setting"], update["value"])

            update_client(client.__dict__)

            emit("update_settings_success", {"category": update["category"], "setting": update["setting"], "value": update["value"]})

        except:

            emit("update_settings_failed", {"category": update["category"], "setting": update["setting"], "value": update["value"]})
