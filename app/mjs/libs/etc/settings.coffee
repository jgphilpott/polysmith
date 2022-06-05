getSettings = () ->

    localSettings = localRead "settings"

    if client and client.settings

        data.settings = client.settings

    else if localSettings

        data.settings = localSettings

    else

        data.settings =

            ui:

                title = "POLYMORPH"
                navbar: true
                forkme: true
                help: true
                shortcuts: ["box", "cylinder", "sphere"]

            panels:

                camera: true
                lights: false
                menu: false
                meshes: true
                settings: false
                shapes: false
                shortcuts: true

            axes:

                axesCaps: true
                xAxis: true
                yAxis: true
                zAxis: true
                xyPlane: false
                xzPlane: false
                yzPlane: false
                xyPlaneStep: 10
                xzPlaneStep: 10
                yzPlaneStep: 10
                gridSnap: 1

            camera:

                position: {x: 135, y: 135, z: 55}
                target: {x: 0, y: 0, z: 0}
                open: "speed"

            controls:

                dragSpeed: 50
                flySpeed: 50
                zoomSpeed: 50
                zoomMax: 500
                zoomMin: 1

    socket.on "update_settings_success", (update) -> updateSuccess update
    socket.on "update_settings_failed", (update) -> updateFailed update

    localWrite "settings", data.settings

    return data.settings

updateSettings = (category, setting, value) ->

    try

        if data.settings[category][setting] != undefined

            if client

                socket.emit "update_settings", id: readCookie("id"), category: category, setting: setting, value: value

            else

                return updateSuccess category: category, setting: setting, value: value

        else

            return updateFailed category: category, setting: setting, value: value

    catch error

        return updateFailed category: category, setting: setting, value: value

    return

updateSuccess = (update) ->

    category = update.category
    setting = update.setting
    value = update.value

    data.settings[category][setting] = value

    switch category

        when "panels"

            panel = $ "#" + setting + ".panel"
            checkbox = $ "#panels-panel #" + setting + ""

            if value

                checkbox.prop "checked", true
                panel.css "visibility", "visible"

                if setting == "shapes" then $("#shortcuts.panel #toggle").attr "src", "/app/imgs/panels/nav/x.png"

            else

                checkbox.prop "checked", false
                panel.css "visibility", "hidden"

                if setting == "shapes" then $("#shortcuts.panel #toggle").attr "src", "/app/imgs/panels/nav/+.png"

            break

        when "camera"

            cameraPanel = $ "#camera.panel"

            if setting == "position"

                position = cameraPanel.find "#position .body"

                position.find("#position-x input").val value.x.toFixed 2
                position.find("#position-y input").val value.y.toFixed 2
                position.find("#position-z input").val value.z.toFixed 2

            else if setting == "target"

                target = cameraPanel.find "#target .body"

                target.find("#target-x input").val value.x.toFixed 2
                target.find("#target-y input").val value.y.toFixed 2
                target.find("#target-z input").val value.z.toFixed 2

            break

    localWrite "settings", data.settings

    return true

updateFailed = (update) ->

    category = update.category
    setting = update.setting
    value = update.value

    console.warn "Update of " + category + " setting " + setting + " failed!"

    return false
