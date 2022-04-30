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
                                    "forkme": False,
                                    "shortcuts": ["cube", "cylinder", "sphere"]
                                },
                                "panels": {
                                    "camera": True,
                                    "lights": False,
                                    "menu": False,
                                    "meshes": True,
                                    "settings": False,
                                    "shapes": False,
                                    "shortcuts": True
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
                                "camera": {
                                    "position": {"x": 135, "y": 135, "z": 55},
                                    "target": {"x": 0, "y": 0, "z": 0},
                                    "open": "speed"
                                },
                                "controls": {
                                    "dragSpeed": 25,
                                    "flySpeed": 25,
                                    "zoomSpeed": 25,
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
