class FilamentsSettings

    constructor: (settings) ->

        if _.isObject settings

            for setting in Object.keys settings

                @[setting] = settings[setting]

    defaults: ->

        abs:

            type: "abs"
            name: "Generic ABS"
            description: ""
            brand: "Generic"
            color: "#000000"
            diameter: 1.75
            density: 1.10
            weight: 1000
            cost: 0
            fan: 0
            temperature:

                bed: 80
                nozzle: 240
                standby: 200

            retraction:

                speed: 45
                distance: 5

        nylon:

            type: "nylon"
            name: "Generic Nylon"
            description: ""
            brand: "Generic"
            color: "#000000"
            diameter: 1.75
            density: 1.14
            weight: 1000
            cost: 0
            fan: 100
            temperature:

                bed: 60
                nozzle: 245
                standby: 175

            retraction:

                speed: 25
                distance: 8

        petg:

            type: "petg"
            name: "Generic PETG"
            description: ""
            brand: "Generic"
            color: "#000000"
            diameter: 1.75
            density: 1.27
            weight: 1000
            cost: 0
            fan: 50
            temperature:

                bed: 70
                nozzle: 240
                standby: 200

            retraction:

                speed: 45
                distance: 5

        pla:

            type: "pla"
            name: "Generic PLA"
            description: ""
            brand: "Generic"
            color: "#000000"
            diameter: 1.75
            density: 1.24
            weight: 1000
            cost: 0
            fan: 100
            temperature:

                bed: 50
                nozzle: 200
                standby: 180

            retraction:

                speed: 45
                distance: 5

    update: (path, value) ->

        null
