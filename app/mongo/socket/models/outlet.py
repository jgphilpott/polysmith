from flask_socketio import emit

from mongo.data.collect.models.mongo import *
from mongo.data.collect.models.model import Model

def connect_models(app):

    @app.on("get_model")
    def get_model():

        pass

    @app.on("post_model")
    def post_model():

        pass
