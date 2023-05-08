from flask import request, render_template
from mongo.data.collect.clients.mongo import valid_client

def register_docs_route(app):

    @app.route("/docs")
    def docs():

        data = {"title": "Documentation", "client": None}

        if "id" in request.cookies:

            data["client"] = valid_client(request.cookies.get("id"))

        return render_template("templates/docs.jinja", data=data)
