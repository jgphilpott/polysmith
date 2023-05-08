from routes.app.route import register_app_route
from routes.docs.route import register_docs_route
from routes.tutorials.route import register_tutorials_route

def register_routes(app):

    register_app_route(app)
    register_docs_route(app)
    register_tutorials_route(app)

    return app
