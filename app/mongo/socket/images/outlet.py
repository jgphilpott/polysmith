from flask_socketio import emit

from mongo.data.collect.images.mongo import *
from mongo.data.collect.images.model import Image

def connect_images(app):

    @app.on("get_image")
    def get_image():

        pass

    @app.on("post_image")
    def post_image():

        pass
