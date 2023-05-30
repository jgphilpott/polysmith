class TooltipsSettings

    constructor: (settings) ->

        if _.isObject settings

            for setting in Object.keys settings

                @[setting] = settings[setting]

    defaults: ->

        bounding: true
        rotation: true
        guidelines: true
        measurements: false
        grid:

            volume: false
            caps: true
            axes:

                x: true
                y: true
                z: true

            ticks:

                xy: true
                xz: false
                yz: false

                step:

                    xy: 10
                    xz: 10
                    yz: 10

    update: (path, value) ->

        null
