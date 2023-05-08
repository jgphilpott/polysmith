from flask import request, render_template
from mongo.data.collect.clients.mongo import valid_client

def register_app_route(app):

    @app.route("/")
    def home():

        data = {"title": "Polymorph", "client": None}

        if "id" in request.cookies:

            data["client"] = valid_client(request.cookies.get("id"))

        return render_template("templates/app.jinja", data=data)
