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
            selected: ["box", "cylinder", "sphere"]

    update: (path, value) ->

        panel = $ "#" + path[1] + ".panel"
        checkbox = $ "#panels-panel #" + path[1] + ""

        if value then panel.css "z-index", events.zIndex += 1

        checkbox.prop "checked", if value then true else false
        panel.css "visibility", if value then "visible" else "hidden"

        if path[1] is "settings"

            $("#settings-panel.sub-panel img.gear").css "opacity", if value then 1 else 0.5

        else if path[1] is "shapes"

            $("#shortcuts.panel #toggle").attr "src", "/app/imgs/panels/nav/" + (if value then "x" else "+") + ".png"
