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
                    "lights": false,
                    "menu": false,
                    "meshes": true,
                    "shapes": false,
                    "shortcut": true
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

  socket.on("update_settings_success", function(update) { updateSuccess(update) })
  socket.on("update_settings_failed", function(update) { updateFailed(update) })

  localWrite("settings", settings)

  return settings

}

export function updateSettings(category, setting, value) {

  try {

    if (settings[category][setting] != undefined) {

      if (client) {

        socket.emit("update_settings", {id: readCookie("id"), category: category, setting: setting, value: value})

      } else {

        return updateSuccess({category: category, setting: setting, value: value})

      }

    } else {

      return updateFailed({category: category, setting: setting, value: value})

    }

  } catch (error) {

    return updateFailed({category: category, setting: setting, value: value})

  }

}

export function updateSuccess(update) {

  let category = update["category"]
  let setting = update["setting"]
  let value = update["value"]

  settings[category][setting] = value

  localWrite("settings", settings)

  return true

}

export function updateFailed(update) {

  let category = update["category"]
  let setting = update["setting"]

  console.warn("Update of " + category + " setting " + setting + " failed!")

  return false

}