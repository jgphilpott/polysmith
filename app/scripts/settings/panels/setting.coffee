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

        null
