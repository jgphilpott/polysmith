import os

def configure_settings(app):

    app.jinja_env.auto_reload = True
    app.config["TEMPLATES_AUTO_RELOAD"] = True
    app.config["SECRET_KEY"] = os.urandom(42).hex()

    return app
