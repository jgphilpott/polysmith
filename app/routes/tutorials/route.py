from flask import request, render_template
from mongo.data.collect.clients.mongo import valid_client

def register_tutorials_route(app):

    @app.route("/tutorials")
    def tutorials():

        data = {"title": "Tutorials", "client": None}

        if "id" in request.cookies:

            data["client"] = valid_client(request.cookies.get("id"))

        return render_template("templates/tutorials.jinja", data=data)
