class PanelsSettings

    constructor: (settings) ->

        if _.isObject settings

            for setting in Object.keys settings

                @[setting] = settings[setting]

    defaults: ->

        camera:

            open: true
            selected: "speed"

        lights:

            open: false
            selected: null

        menu:

            open: false
            selected: null

        meshes:

            open: true
            selected: null

        polygen:

            open: false
            selected: null

        settings:

            open: false
            selected: null

        shapes:

            open: false
            selected: ["basic", "prisms", "pyramids", "hedrons", "special"]

        shortcuts:

            open: true
            selected: ["box", "cylinder", "sphere", "text", "image"]

    update: (path, value) ->

        panel = panels[path[1]]

        if path.last() is "open"

            if value

                panel.show()

            else

                panel.hide()

            $("#panels-panel.sub-panel #" + path[1] + "").prop "checked", value

            if path[1] is "settings"

                $("#settings-panel.sub-panel img#gear").css "opacity", if value then 1 else 0.5

            else if path[1] is "shapes"

                $("#shortcuts.panel img#toggle").attr "src", "/app/imgs/panels/nav/" + (if value then "stop" else "plus") + "/regular.png"
