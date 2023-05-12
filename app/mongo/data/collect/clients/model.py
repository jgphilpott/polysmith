import os
import pydash

class Client():

    def __init__(self, client):

        self.id = client["id"] if "id" in client else os.urandom(42).hex()

        self.email = client["email"] if "email" in client else None
        self.password = client["password"] if "password" in client else None

        self.default_settings = {
                                    "camera": {
                                        "type": "perspective",
                                        "position": {"x": 240, "y": 240, "z": 120},
                                        "target": {"x": 0, "y": 0, "z": 0},
                                        "near": 0.1,
                                        "far": 1000,
                                        "fov": 75
                                    },
                                    "controls": {
                                        "speed": {
                                            "drag": 50,
                                            "fly": 50,
                                            "zoom": 50
                                        },
                                        "zoom": {
                                            "min": 1,
                                            "max": 500
                                        }
                                    },
                                    "filaments": {
                                        "abs": {
                                            "type": "ABS",
                                            "name": "Generic ABS",
                                            "description": "",
                                            "brand": "Generic",
                                            "color": "#000000",
                                            "diameter": 1.75,
                                            "density": 1.10,
                                            "weight": 1000,
                                            "cost": 0,
                                            "fan": 0,
                                            "temperature": {
                                                "bed": 80,
                                                "nozzle": 240,
                                                "standby": 200
                                            },
                                            "retraction": {
                                                "speed": 45,
                                                "distance": 5
                                            }
                                        },
                                        "nylon": {
                                            "type": "Nylon",
                                            "name": "Generic Nylon",
                                            "description": "",
                                            "brand": "Generic",
                                            "color": "#000000",
                                            "diameter": 1.75,
                                            "density": 1.14,
                                            "weight": 1000,
                                            "cost": 0,
                                            "fan": 100,
                                            "temperature": {
                                                "bed": 60,
                                                "nozzle": 245,
                                                "standby": 175
                                            },
                                            "retraction": {
                                                "speed": 25,
                                                "distance": 8
                                            }
                                        },
                                        "petg": {
                                            "type": "PETG",
                                            "name": "Generic PETG",
                                            "description": "",
                                            "brand": "Generic",
                                            "color": "#000000",
                                            "diameter": 1.75,
                                            "density": 1.27,
                                            "weight": 1000,
                                            "cost": 0,
                                            "fan": 50,
                                            "temperature": {
                                                "bed": 70,
                                                "nozzle": 240,
                                                "standby": 200
                                            },
                                            "retraction": {
                                                "speed": 45,
                                                "distance": 5
                                            }
                                        },
                                        "pla": {
                                            "type": "PLA",
                                            "name": "Generic PLA",
                                            "description": "",
                                            "brand": "Generic",
                                            "color": "#000000",
                                            "diameter": 1.75,
                                            "density": 1.24,
                                            "weight": 1000,
                                            "cost": 0,
                                            "fan": 100,
                                            "temperature": {
                                                "bed": 50,
                                                "nozzle": 200,
                                                "standby": 180
                                            },
                                            "retraction": {
                                                "speed": 45,
                                                "distance": 5
                                            }
                                        }
                                    },
                                    "general": {
                                        "language": "en-US",
                                        "currency": "USD",
                                        "scale": "metric",
                                        "snap": True
                                    },
                                    "panels": {
                                        "camera": {
                                            "open": True,
                                            "selected": "speed"
                                        },
                                        "lights": {
                                            "open": False,
                                            "selected": None
                                        },
                                        "menu": {
                                            "open": False,
                                            "selected": None
                                        },
                                        "meshes": {
                                            "open": True,
                                            "selected": None
                                        },
                                        "polygen": {
                                            "open": False,
                                            "selected": None
                                        },
                                        "settings": {
                                            "open": False,
                                            "selected": None
                                        },
                                        "shapes": {
                                            "open": False,
                                            "selected": ["basic", "prisms", "pyramids", "hedrons", "special"]
                                        },
                                        "shortcuts": {
                                            "open": True,
                                            "selected": ["box", "cylinder", "sphere"]
                                        }
                                    },
                                    "printer": {
                                        "size": {"x": 250, "y": 250, "z": 300},
                                        "shape": "rectangular",
                                        "centred": False,
                                        "heated": {
                                            "volume": False,
                                            "bed": True
                                        },
                                        "nozzles": [
                                            {
                                                "filament": 1.75,
                                                "diameter": 0.4,
                                                "gantry": 25
                                            }
                                        ]
                                    },
                                    "scales": {
                                        "angle": {
                                            "detail": 1,
                                            "snap": True,
                                            "unit": "degree"
                                        },
                                        "area": {
                                            "detail": 1,
                                            "snap": True,
                                            "unit": {
                                                "imperial": "inchSq",
                                                "metric": "millimeterSq"
                                            }
                                        },
                                        "data": {
                                            "detail": 1,
                                            "snap": True,
                                            "unit": "byte"
                                        },
                                        "energy": {
                                            "detail": 1,
                                            "snap": True,
                                            "unit": "watt"
                                        },
                                        "frequency": {
                                            "detail": 1,
                                            "snap": True,
                                            "unit": "hertz"
                                        },
                                        "length": {
                                            "detail": 2,
                                            "snap": True,
                                            "unit": {
                                                "imperial": "inch",
                                                "metric": "millimeter"
                                            }
                                        },
                                        "mass": {
                                            "detail": 1,
                                            "snap": True,
                                            "unit": {
                                                "imperial": "ounce",
                                                "metric": "gram"
                                            }
                                        },
                                        "pressure": {
                                            "detail": 1,
                                            "snap": True,
                                            "unit": "psi"
                                        },
                                        "speed": {
                                            "detail": 1,
                                            "snap": True,
                                            "unit": {
                                                "imperial": "inchsPerSecond",
                                                "metric": "millimetersPerSecond"
                                            }
                                        },
                                        "temperature": {
                                            "detail": 1,
                                            "snap": True,
                                            "unit": "celsius"
                                        },
                                        "time": {
                                            "detail": 1,
                                            "snap": True,
                                            "unit": "millisecond"
                                        },
                                        "volume": {
                                            "detail": 1,
                                            "snap": True,
                                            "unit": {
                                                "imperial": "inchCu",
                                                "metric": "millimeterCu"
                                            }
                                        }
                                    },
                                    "slicing": {
                                        "gcode": "marlin",
                                        "adhesion": False,
                                        "support": False,
                                        "layer": 0.1,
                                        "infill": {
                                            "density": 10,
                                            "pattern": "honeycomb"
                                        }
                                    },
                                    "tooltips": {
                                        "bounding": True,
                                        "rotation": True,
                                        "guidelines": True,
                                        "measurements": False,
                                        "grid": {
                                            "volume": False,
                                            "caps": True,
                                            "axes": {
                                                "x": True,
                                                "y": True,
                                                "z": True
                                            },
                                            "ticks": {
                                                "xy": True,
                                                "xz": False,
                                                "yz": False,
                                                "step": {
                                                    "xy": 10,
                                                    "xz": 10,
                                                    "yz": 10
                                                }
                                            }
                                        }
                                    },
                                    "ui": {
                                        "title": "POLYMORPH",
                                        "theme": "light",
                                        "navbar": True,
                                        "forkme": False,
                                        "metabox": True,
                                        "help": False
                                    }
                                }

        if "settings" in client:

            self.settings = client["settings"]

            if "camera" not in self.settings: self.settings["camera"] = self.default_settings["camera"]
            if "type" not in self.settings["camera"]: self.settings["camera"]["type"] = self.default_settings["camera"]["type"]
            if "position" not in self.settings["camera"]: self.settings["camera"]["position"] = self.default_settings["camera"]["position"]
            if "target" not in self.settings["camera"]: self.settings["camera"]["target"] = self.default_settings["camera"]["target"]
            if "near" not in self.settings["camera"]: self.settings["camera"]["near"] = self.default_settings["camera"]["near"]
            if "far" not in self.settings["camera"]: self.settings["camera"]["far"] = self.default_settings["camera"]["far"]
            if "fov" not in self.settings["camera"]: self.settings["camera"]["fov"] = self.default_settings["camera"]["fov"]

            if "controls" not in self.settings: self.settings["controls"] = self.default_settings["controls"]
            if "speed" not in self.settings["controls"]: self.settings["controls"]["speed"] = self.default_settings["controls"]["speed"]
            if "zoom" not in self.settings["controls"]: self.settings["controls"]["zoom"] = self.default_settings["controls"]["zoom"]

            if "filaments" not in self.settings: self.settings["filaments"] = self.default_settings["filaments"]
            if "abs" not in self.settings["filaments"]: self.settings["filaments"]["abs"] = self.default_settings["filaments"]["abs"]
            if "nylon" not in self.settings["filaments"]: self.settings["filaments"]["nylon"] = self.default_settings["filaments"]["nylon"]
            if "petg" not in self.settings["filaments"]: self.settings["filaments"]["petg"] = self.default_settings["filaments"]["petg"]
            if "pla" not in self.settings["filaments"]: self.settings["filaments"]["pla"] = self.default_settings["filaments"]["pla"]

            if "general" not in self.settings: self.settings["general"] = self.default_settings["general"]
            if "language" not in self.settings["general"]: self.settings["general"]["language"] = self.default_settings["general"]["language"]
            if "currency" not in self.settings["general"]: self.settings["general"]["currency"] = self.default_settings["currency"]["language"]
            if "scale" not in self.settings["general"]: self.settings["general"]["scale"] = self.default_settings["general"]["scale"]
            if "snap" not in self.settings["general"]: self.settings["general"]["snap"] = self.default_settings["general"]["snap"]

            if "panels" not in self.settings: self.settings["panels"] = self.default_settings["panels"]
            if "camera" not in self.settings["panels"]: self.settings["panels"]["camera"] = self.default_settings["panels"]["camera"]
            if "lights" not in self.settings["panels"]: self.settings["panels"]["lights"] = self.default_settings["panels"]["lights"]
            if "menu" not in self.settings["panels"]: self.settings["panels"]["menu"] = self.default_settings["panels"]["menu"]
            if "meshes" not in self.settings["panels"]: self.settings["panels"]["meshes"] = self.default_settings["panels"]["meshes"]
            if "polygen" not in self.settings["panels"]: self.settings["panels"]["polygen"] = self.default_settings["panels"]["polygen"]
            if "settings" not in self.settings["panels"]: self.settings["panels"]["settings"] = self.default_settings["panels"]["settings"]
            if "shapes" not in self.settings["panels"]: self.settings["panels"]["shapes"] = self.default_settings["panels"]["shapes"]
            if "shortcuts" not in self.settings["panels"]: self.settings["panels"]["shortcuts"] = self.default_settings["panels"]["shortcuts"]

            if "printer" not in self.settings: self.settings["printer"] = self.default_settings["printer"]
            if "size" not in self.settings["printer"]: self.settings["printer"]["size"] = self.default_settings["printer"]["size"]
            if "shape" not in self.settings["printer"]: self.settings["printer"]["shape"] = self.default_settings["printer"]["shape"]
            if "centred" not in self.settings["printer"]: self.settings["printer"]["centred"] = self.default_settings["printer"]["centred"]
            if "heated" not in self.settings["printer"]: self.settings["printer"]["heated"] = self.default_settings["printer"]["heated"]
            if "nozzles" not in self.settings["printer"]: self.settings["printer"]["nozzles"] = self.default_settings["printer"]["nozzles"]

            if "scales" not in self.settings: self.settings["scales"] = self.default_settings["scales"]
            if "angle" not in self.settings["scales"]: self.settings["scales"]["angle"] = self.default_settings["scales"]["angle"]
            if "area" not in self.settings["scales"]: self.settings["scales"]["area"] = self.default_settings["scales"]["area"]
            if "data" not in self.settings["scales"]: self.settings["scales"]["data"] = self.default_settings["scales"]["data"]
            if "energy" not in self.settings["scales"]: self.settings["scales"]["energy"] = self.default_settings["scales"]["energy"]
            if "frequency" not in self.settings["scales"]: self.settings["scales"]["frequency"] = self.default_settings["scales"]["frequency"]
            if "length" not in self.settings["scales"]: self.settings["scales"]["length"] = self.default_settings["scales"]["length"]
            if "mass" not in self.settings["scales"]: self.settings["scales"]["mass"] = self.default_settings["scales"]["mass"]
            if "pressure" not in self.settings["scales"]: self.settings["scales"]["pressure"] = self.default_settings["scales"]["pressure"]
            if "speed" not in self.settings["scales"]: self.settings["scales"]["speed"] = self.default_settings["scales"]["speed"]
            if "temperature" not in self.settings["scales"]: self.settings["scales"]["temperature"] = self.default_settings["scales"]["temperature"]
            if "time" not in self.settings["scales"]: self.settings["scales"]["time"] = self.default_settings["scales"]["time"]
            if "volume" not in self.settings["scales"]: self.settings["scales"]["volume"] = self.default_settings["scales"]["volume"]

            if "slicing" not in self.settings: self.settings["slicing"] = self.default_settings["slicing"]
            if "gcode" not in self.settings["slicing"]: self.settings["slicing"]["gcode"] = self.default_settings["slicing"]["gcode"]
            if "adhesion" not in self.settings["slicing"]: self.settings["slicing"]["adhesion"] = self.default_settings["slicing"]["adhesion"]
            if "support" not in self.settings["slicing"]: self.settings["slicing"]["support"] = self.default_settings["slicing"]["support"]
            if "layer" not in self.settings["slicing"]: self.settings["slicing"]["layer"] = self.default_settings["slicing"]["layer"]
            if "infill" not in self.settings["slicing"]: self.settings["slicing"]["infill"] = self.default_settings["slicing"]["infill"]

            if "tooltips" not in self.settings: self.settings["tooltips"] = self.default_settings["tooltips"]
            if "bounding" not in self.settings["tooltips"]: self.settings["tooltips"]["bounding"] = self.default_settings["tooltips"]["bounding"]
            if "rotation" not in self.settings["tooltips"]: self.settings["tooltips"]["rotation"] = self.default_settings["tooltips"]["rotation"]
            if "guidelines" not in self.settings["tooltips"]: self.settings["tooltips"]["guidelines"] = self.default_settings["tooltips"]["guidelines"]
            if "measurements" not in self.settings["tooltips"]: self.settings["tooltips"]["measurements"] = self.default_settings["tooltips"]["measurements"]
            if "grid" not in self.settings["tooltips"]: self.settings["tooltips"]["grid"] = self.default_settings["tooltips"]["grid"]

            if "ui" not in self.settings: self.settings["ui"] = self.default_settings["ui"]
            if "title" not in self.settings["ui"]: self.settings["ui"]["title"] = self.default_settings["ui"]["title"]
            if "theme" not in self.settings["ui"]: self.settings["ui"]["theme"] = self.default_settings["ui"]["theme"]
            if "navbar" not in self.settings["ui"]: self.settings["ui"]["navbar"] = self.default_settings["ui"]["navbar"]
            if "forkme" not in self.settings["ui"]: self.settings["ui"]["forkme"] = self.default_settings["ui"]["forkme"]
            if "metabox" not in self.settings["ui"]: self.settings["ui"]["metabox"] = self.default_settings["ui"]["metabox"]
            if "help" not in self.settings["ui"]: self.settings["ui"]["help"] = self.default_settings["ui"]["help"]

        else:

            self.settings = self.default_settings

    def update_settings(self, path, value):

        pydash.set_(self.settings, path, value)

        return self

    def refresh_id(self):

        self.id = os.urandom(42).hex()

        return self
