class ControlsSettings

    constructor: (settings) ->

        if _.isObject settings

            for setting in Object.keys settings

                @[setting] = settings[setting]

    defaults: ->

        speed:

            drag: 50
            fly: 50
            zoom: 50

        zoom:

            min: 5
            max: 500

    update: (path, value) ->

        null
