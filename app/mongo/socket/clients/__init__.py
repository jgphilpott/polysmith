from flask_socketio import emit

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

        pass

    @app.on("login")
    def login(client):

        pass

    @app.on("update_settings")
    def update_settings(update):

        pass
