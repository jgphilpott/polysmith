class ScalesSettings

    constructor: (settings) ->

        if _.isObject settings

            for setting in Object.keys settings

                @[setting] = settings[setting]

    defaults: ->

        angle:

            detail: 2
            snap: true
            unit: "degree"

        area:

            detail: 2
            snap: true
            unit:

                imperial: "inchSq"
                metric: "millimeterSq"

        data:

            detail: 2
            snap: true
            unit: "byte"


        density:

            detail: 2
            snap: true
            unit:

                imperial: "ounceInchCu"
                metric: "gramCentimeterCu"

        energy:

            detail: 2
            snap: true
            unit: "watt"

        frequency:

            detail: 2
            snap: true
            unit: "hertz"

        length:

            detail: 2
            snap: true
            unit:

                imperial: "inch"
                metric: "millimeter"

        mass:

            detail: 2
            snap: true
            unit:

                imperial: "ounce"
                metric: "gram"

        pressure:

            detail: 2
            snap: true
            unit: "psi"

        speed:

            detail: 2
            snap: true
            unit:

                imperial: "inchSecond"
                metric: "millimeterSecond"

        temperature:

            detail: 2
            snap: true
            unit: "celsius"

        time:

            detail: 2
            snap: true
            unit: "millisecond"

        volume:

            detail: 2
            snap: true
            unit:

                imperial: "inchCu"
                metric: "millimeterCu"

    update: (path, value) ->

        null
