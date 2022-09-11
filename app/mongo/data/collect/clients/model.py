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
                                "general": {
                                    "language": "en-US",
                                    "scale": "metric",
                                    "unit": {"imperial": "inch", "metric": "millimeter"},
                                    "snap": False,
                                    "size": 100,
                                    "grid": 1
                                },
                                "ui": {
                                    "title": "POLYMORPH",
                                    "navbar": True,
                                    "forkme": False,
                                    "metabox": True,
                                    "help": False,
                                    "shortcuts": ["box", "cylinder", "sphere"]
                                },
                                "tooltips": {
                                    "guidelines": True,
                                    "measurements": False
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
                                    "xAxis": True,
                                    "yAxis": True,
                                    "zAxis": True,
                                    "xyPlane": False,
                                    "xzPlane": False,
                                    "yzPlane": False,
                                    "xyPlaneStep": 10,
                                    "xzPlaneStep": 10,
                                    "yzPlaneStep": 10
                                },
                                "camera": {
                                    "position": {"x": 135, "y": 135, "z": 55},
                                    "target": {"x": 0, "y": 0, "z": 0},
                                    "open": "speed"
                                },
                                "controls": {
                                    "dragSpeed": 50,
                                    "flySpeed": 50,
                                    "zoomSpeed": 50,
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
