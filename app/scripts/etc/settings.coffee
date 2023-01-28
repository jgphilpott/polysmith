class Settings

    constructor : () ->

        localSettings = localRead "settings"

        @defaultSettings =

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

                guidelines: true
                measurements: false
                rotation: true
                bounding: true

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

        if client

            @settings = client.settings

        else if localSettings

            @settings = localSettings

        else

            @settings = this.defaultSettings

        socket.on "update_settings_success", (update) -> this.updateSuccess update
        socket.on "update_settings_failed", (update) -> this.updateFailed update

        localStore.write "settings", this.settings

    getSetting : (category, setting) ->

        try

            return this.settings[category][setting]

        catch error

            return undefined

    setSetting : (category, setting, value) ->

        try

            if this.getSetting(category, setting) isnt undefined

                if client

                    socket.emit "update_settings", id: readCookie("id"), category: category, setting: setting, value: value

                else

                    return this.updateSuccess category: category, setting: setting, value: value

            else

                return this.updateFailed category: category, setting: setting, value: value

        catch error

            return this.updateFailed category: category, setting: setting, value: value

    updateSuccess : (update) ->

        category = update.category
        setting = update.setting
        value = update.value

        this.settings[category][setting] = value

        switch category

            when "general"

                $(".settings-category #general-" + setting + "").val value

                break

            when "ui"

                $(".settings-category #ui-" + setting + "").prop "checked", value

                if setting is "navbar"

                    top = if value then 0 else -50

                    $("#navbar").animate {top: top}, {duration: 1000, queue: false}

                else

                    $("#" + setting + "").css "display", if value then "" else "none"

                break

            when "tooltips"

                if setting is "guidelines"

                    $(".settings-category #tooltips-measurements").prop "disabled", !value

                break

            when "panels"

                panel = $ "#" + setting + ".panel"
                checkbox = $ "#panels-panel #" + setting + ""

                if value

                    panel.css "z-index", events.zIndex += 1

                checkbox.prop "checked", if value then true else false
                panel.css "visibility", if value then "visible" else "hidden"

                if setting is "settings"

                    $("#settings-panel.sub-panel img.gear").css "opacity", if value then 1 else 0.5

                if setting is "shapes"

                    $("#shortcuts.panel #toggle").attr "src", "/app/imgs/panels/nav/" + (if value then "x" else "+") + ".png"

                break

            when "axes"

                $(".settings-category #axes-" + setting + "").prop "checked", value

                if setting is "xAxis" or setting is "yAxis" or setting is "zAxis"

                    if value then grid.caps.addCentroid()

                    switch setting

                        when "xAxis"

                            if value

                                grid.axes.addX()
                                grid.caps.addX()

                            else

                                grid.axes.removeX()
                                grid.caps.removeX()

                                if not settings.getSetting("axes", "yAxis") and not settings.getSetting("axes", "zAxis")

                                    grid.caps.removeCentroid()

                        when "yAxis"

                            if value

                                grid.axes.addY()
                                grid.caps.addY()

                            else

                                grid.axes.removeY()
                                grid.caps.removeY()

                                if not settings.getSetting("axes", "xAxis") and not settings.getSetting("axes", "zAxis")

                                    grid.caps.removeCentroid()

                        when "zAxis"

                            if value

                                grid.axes.addZ()
                                grid.caps.addZ()

                            else

                                grid.axes.removeZ()
                                grid.caps.removeZ()

                                if not settings.getSetting("axes", "xAxis") and not settings.getSetting("axes", "yAxis")

                                    grid.caps.removeCentroid()

                else if setting is "axesCaps"

                    if value

                        grid.caps.addCentroid()

                        grid.caps.addX()
                        grid.caps.addY()
                        grid.caps.addZ()

                    else

                        grid.caps.removeCentroid()

                        grid.caps.removeX()
                        grid.caps.removeY()
                        grid.caps.removeZ()

                else if setting is "xyPlane"

                    if value then grid.ticks.addXY() else grid.ticks.removeXY()

                else if setting is "xzPlane"

                    if value then grid.ticks.addXZ() else grid.ticks.removeXZ()

                else if setting is "yzPlane"

                    if value then grid.ticks.addYZ() else grid.ticks.removeYZ()

                break

            when "camera"

                cameraPanel = $ "#camera.panel"

                if setting is "position"

                    position = cameraPanel.find "#position .body"

                    position.find("#position-x input").val value.x.toFixed 2
                    position.find("#position-y input").val value.y.toFixed 2
                    position.find("#position-z input").val value.z.toFixed 2

                else if setting is "target"

                    target = cameraPanel.find "#target .body"

                    target.find("#target-x input").val value.x.toFixed 2
                    target.find("#target-y input").val value.y.toFixed 2
                    target.find("#target-z input").val value.z.toFixed 2

                break

        localStore.write "settings", this.settings

        return true

    updateFailed : (update) ->

        category = update.category
        setting = update.setting
        value = update.value

        console.warn "Update of " + category + " setting " + setting + " failed!"

        return false
