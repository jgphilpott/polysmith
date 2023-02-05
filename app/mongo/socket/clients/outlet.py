live_count = 0

from hashlib import sha256
from flask_socketio import emit

from mongo.data.collect.clients.mongo import *
from mongo.data.collect.clients.model import Client

def connect_clients(app):

    @app.on("connect")
    def connect():

        global live_count
        live_count += 1

    @app.on("disconnect")
    def disconnect():

        global live_count
        live_count -= 1

    @app.on("signup")
    def signup(client):

        client["password"] = sha256(client["password"].encode("utf-8")).hexdigest()

        try:

            find_client({"email": client["email"]})

            emit("signup_failed")

        except:

            client = Client(client)

            add_client(vars(client))

            emit("signup_success", client.id)

    @app.on("login")
    def login(client):

        client["password"] = sha256(client["password"].encode("utf-8")).hexdigest()

        try:

            match = find_client({"email": client["email"]})

            if match["password"] == client["password"]:

                client = Client(match).refresh_id()

                update_client(vars(client))

                emit("login_success", client.id)

            else:

                emit("login_failed")

        except:

            emit("login_failed")

    @app.on("update_settings")
    def update_settings(update):

        try:

            update_client(vars(Client(find_client({"id": update["id"]})).update_settings(update["category"], update["setting"], update["value"])))

            emit("update_settings_success", {"category": update["category"], "setting": update["setting"], "value": update["value"]})

        except:

            emit("update_settings_failed", {"category": update["category"], "setting": update["setting"], "value": update["value"]})
