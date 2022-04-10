from os import urandom

class Client():

    def __init__(self, client):

        self.email = client["email"]
        self.password = client["password"]

        self.id = client["id"] if "id" in client else None

        if "settings" in client:

            self.settings = client["settings"]

        else:

            self.settings = {
                                "ui": {
                                    "nav": "black",
                                    "forkme": False
                                },
                                "panels": {
                                    "camera": True,
                                    "geometries": False,
                                    "menu": False,
                                    "meshes": True,
                                    "shapes": True
                                },
                                "axes": {
                                    "axesCaps": True,
                                    "xyPlane": False,
                                    "xzPlane": False,
                                    "yzPlane": False,
                                    "xyPlaneStep": 10,
                                    "xzPlaneStep": 10,
                                    "yzPlaneStep": 10,
                                    "gridSnap": 1
                                },
                                "controls": {
                                    "flySpeed": 50,
                                    "spinSpeed": 50,
                                    "dragSpeed": 50,
                                    "zoomSpeed": 1000,
                                    "zoomMax": 500,
                                    "zoomMin": 1
                                }
                            }

    def refresh_id(self):

        self.id = urandom(42).hex()

        return self

    def update_settings(self, category, setting, value):

        self.settings[category][setting] = value

        return self
