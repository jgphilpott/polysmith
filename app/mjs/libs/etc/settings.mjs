export function getSettings() {

  let localSettings = localRead("settings")

  if (client && client.settings) {

    settings = client.settings

  } else if (localSettings) {

    settings = localSettings

  } else {

    settings = {
                  "ui": {
                    "nav": "black",
                    "forkme": true
                  },
                  "panels": {
                    "camera": true,
                    "geometries": false,
                    "menu": false,
                    "meshes": true,
                    "shapes": true
                  },
                  "axes": {
                    "axesCaps": true,
                    "xyPlane": false,
                    "xzPlane": false,
                    "yzPlane": false,
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

  }

  localWrite("settings", settings)

  return settings

}