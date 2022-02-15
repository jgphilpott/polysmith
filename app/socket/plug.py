from flask_socketio import SocketIO

from socket.images import connect_images
from socket.models import connect_models

def plugin(app):

    app = SocketIO(app)

    connect_images(app)
    connect_models(app)

    return app

def unplug(app):

    return app
