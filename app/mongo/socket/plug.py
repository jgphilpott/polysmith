from flask_socketio import SocketIO

from mongo.socket.clients.outlet import connect_clients
from mongo.socket.images.outlet import connect_images
from mongo.socket.models.outlet import connect_models

def plugin(app):

    app = SocketIO(app)

    connect_clients(app)
    connect_images(app)
    connect_models(app)

    return app

def unplug(app):

    return app.stop()
