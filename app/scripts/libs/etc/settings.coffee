getSettings = () ->

    localSettings = localRead "settings"

    if client and client.settings

        data.settings = client.settings

    else if localSettings

        data.settings = localSettings

    else

        data.settings =

            general:

                language: "en-US"
                scale: "metric"
                unit:

                    imperial: "inch"
                    metric: "millimeter"

                snap: false
                size: 100
                grid: 1

            ui:

                title: "POLYMORPH"
                navbar: true
                forkme: true
                metabox: true
                help: true
                shortcuts: ["box", "cylinder", "sphere"]

            tooltips:

                boundingBox: true
                guidelines: true
                measurements: false
                rotation: true

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

            camera:

                position: x: 135, y: 135, z: 55
                target: x: 0, y: 0, z: 0
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

        when "general"

            $(".settings-category #general-" + setting + "").val value

        when "ui"

            $(".settings-category #ui-" + setting + "").prop "checked", value

            if setting == "navbar"

                top = if value then 0 else -50

                $("#navbar").animate {top: top}, {duration: 1000, queue: false}

            else

                $("#" + setting + "").css "display", if value then "" else "none"

        when "tooltips"

            if setting == "guidelines"

                $(".settings-category #tooltips-measurements").prop("disabled", !value)

        when "panels"

            panel = $ "#" + setting + ".panel"
            checkbox = $ "#panels-panel #" + setting + ""

            if value

                panel.css "z-index", events.zIndex += 1

            checkbox.prop "checked", if value then true else false
            panel.css "visibility", if value then "visible" else "hidden"

            if setting == "settings"

                $("#settings-panel.sub-panel img.gear").css "opacity", if value then 1 else 0.5

            if setting == "shapes"

                $("#shortcuts.panel #toggle").attr "src", "/app/imgs/panels/nav/" + (if value then "x" else "+") + ".png"


            break

        when "axes"

            $(".settings-category #axes-" + setting + "").prop "checked", value

            if setting == "axesCaps"

                if value then addAxesCaps() else removeAxesCaps()

            if setting == "xAxis" or setting == "yAxis" or setting == "zAxis"

                if value

                    if setting == "xAxis"

                        addAxisX()

                        if settings.axes.axesCaps

                            addAxisCapsX()

                        if not settings.axes.yAxis and not settings.axes.zAxis

                            addCentroidCap()

                    if setting == "yAxis"

                        addAxisY()

                        if settings.axes.axesCaps

                            addAxisCapsY()

                        if not settings.axes.xAxis and not settings.axes.zAxis

                            addCentroidCap()

                    if setting == "zAxis"

                        addAxisZ()

                        if settings.axes.axesCaps

                            addAxisCapsZ()

                        if not settings.axes.xAxis and not settings.axes.yAxis

                            addCentroidCap()

                else

                    if setting == "xAxis"

                        removeAxisX()
                        removeAxisCapsX()

                        if not settings.axes.yAxis and not settings.axes.zAxis

                            removeCentroidCap()

                    if setting == "yAxis"

                        removeAxisY()
                        removeAxisCapsY()

                        if not settings.axes.xAxis and not settings.axes.zAxis

                            removeCentroidCap()

                    if setting == "zAxis"

                        removeAxisZ()
                        removeAxisCapsZ()

                        if not settings.axes.xAxis and not settings.axes.yAxis

                            removeCentroidCap()

            if setting == "xyPlane"

                if value then addPlaneXY() else removePlaneXY()

            if setting == "xzPlane"

                if value then addPlaneXZ() else removePlaneXZ()

            if setting == "yzPlane"

                if value then addPlaneYZ() else removePlaneYZ()

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
