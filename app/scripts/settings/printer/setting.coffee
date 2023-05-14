class PrinterSettings

    constructor: (settings) ->

        if _.isObject settings

            for setting in Object.keys settings

                @[setting] = settings[setting]

    defaults: ->

        size: x: 250, y: 250, z: 300
        shape: "rectangular"
        centred: false
        heated:

            volume: false
            bed: true

        nozzles: [

            filament: 1.75
            diameter: 0.4
            gantry: 25

        ]

    update: (path, value) ->

        if path[1] is "size"

            grid.reset()
