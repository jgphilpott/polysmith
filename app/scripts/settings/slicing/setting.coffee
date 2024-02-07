class SlicingSettings

    constructor: (settings) ->

        if _.isObject settings

            for setting in Object.keys settings

                @[setting] = settings[setting]

    defaults: ->

        gcode: "marlin"
        adhesion: false
        support: false
        layer: 0.1
        infill:

            density: 10
            pattern: "honeycomb"

    update: (path, value) ->

        null
