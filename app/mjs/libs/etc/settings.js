function getSettings() {

  let localSettings = localRead("settings")

  if (client && client.settings) {

    settings = client.settings

  } else if (localSettings) {

    settings = localSettings

  } else {

    settings = {
                  ui: {
                    nav: "black",
                    forkme: true
                  },
                  panels: {
                    camera: true,
                    lights: false,
                    menu: false,
                    meshes: true,
                    settings: false,
                    shapes: false,
                    shortcut: true
                  },
                  axes: {
                    axesCaps: true,
                    xyPlane: false,
                    xzPlane: false,
                    yzPlane: false,
                    xyPlaneStep: 10,
                    xzPlaneStep: 10,
                    yzPlaneStep: 10,
                    gridSnap: 1
                  },
                  camera: {
                    position: {x: 135, y: 135, z: 55},
                    target: {x: 0, y: 0, z: 0},
                    open: "speed"
                  },
                  controls: {
                    dragSpeed: 25,
                    flySpeed: 25,
                    zoomSpeed: 25,
                    zoomMax: 500,
                    zoomMin: 1
                  }
               }

  }

  socket.on("update_settings_success", function(update) { updateSuccess(update) })
  socket.on("update_settings_failed", function(update) { updateFailed(update) })

  localWrite("settings", settings)

  return settings

}

function updateSettings(category, setting, value) {

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

function updateSuccess(update) {

  let category = update["category"]
  let setting = update["setting"]
  let value = update["value"]

  settings[category][setting] = value

  switch (category) {

    case "panels":

      let panel = $("#" + setting + ".panel")
      let checkbox = $("#panels-panel #" + setting + "")

      if (value) {

        panel.css("visibility", "visible")
        checkbox.prop("checked", true)

      } else {

        panel.css("visibility", "hidden")
        checkbox.prop("checked", false)

      }

      break

    case "camera":

      let cameraPanel = $("#camera.panel")

      if (setting == "position") {

        let position = cameraPanel.find("#position .body")

        position.find("#position-x input").val(value.x.toFixed(2))
        position.find("#position-y input").val(value.y.toFixed(2))
        position.find("#position-z input").val(value.z.toFixed(2))

      } else if (setting == "target") {

        let target = cameraPanel.find("#target .body")

        target.find("#target-x input").val(value.x.toFixed(2))
        target.find("#target-y input").val(value.y.toFixed(2))
        target.find("#target-z input").val(value.z.toFixed(2))

      }

      break

  }

  localWrite("settings", settings)

  return true

}

function updateFailed(update) {

  let category = update["category"]
  let setting = update["setting"]

  console.warn("Update of " + category + " setting " + setting + " failed!")

  return false

}