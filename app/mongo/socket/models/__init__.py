from flask_socketio import emit

def connect_models(app):

    @app.on("post_model")
    def post_model():

        pass

    @app.on("get_model")
    def get_model():

        pass
