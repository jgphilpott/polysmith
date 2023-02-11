import os
import pydash

class Client():

    def __init__(self, client):

        self.id = client["id"] if "id" in client else os.urandom(42).hex()

        self.email = client["email"] if "email" in client else None
        self.password = client["password"] if "password" in client else None

        if "settings" in client:

            self.settings = client["settings"]

        else:

            self.settings = {
                                "general": {
                                    "language": "en-US",
                                    "currency": "USD",
                                    "scale": "metric",
                                    "snap": True
                                },
                                "ui": {
                                    "title": "POLYMORPH",
                                    "theme": "light",
                                    "navbar": True,
                                    "forkme": False,
                                    "metabox": True,
                                    "help": False
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
                                        "detail": 1,
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
                                "camera": {
                                    "type": "perspective",
                                    "position": {"x": 135, "y": 135, "z": 55},
                                    "target": {"x": 0, "y": 0, "z": 0},
                                    "near": 0.1,
                                    "far": 1000
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
                                },
                                "tooltips": {
                                    "bounding": True,
                                    "rotation": True,
                                    "guidelines": True,
                                    "measurements": False
                                }
                            }

    def update_settings(self, path, value):

        pydash.set_(self.settings, path, value)

        return self

    def refresh_id(self):

        self.id = os.urandom(42).hex()

        return self
