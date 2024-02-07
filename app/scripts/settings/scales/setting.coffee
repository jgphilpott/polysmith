class ScalesSettings

    constructor: (settings) ->

        if _.isObject settings

            for setting in Object.keys settings

                @[setting] = settings[setting]

    defaults: ->

        scale: "metric"
        angle:

            detail: 2
            snap: false
            unit: "degree"

        area:

            detail: 2
            snap: false
            unit:

                imperial: "inchSq"
                metric: "millimeterSq"

        data:

            detail: 2
            snap: false
            unit: "byte"

        density:

            detail: 2
            snap: false
            unit:

                imperial: "ounceInchCu"
                metric: "gramCentimeterCu"

        length:

            detail: 2
            snap: false
            unit:

                imperial: "inch"
                metric: "millimeter"

        mass:

            detail: 2
            snap: false
            unit:

                imperial: "ounce"
                metric: "gram"

        speed:

            detail: 2
            snap: false
            unit:

                imperial: "inchSecond"
                metric: "millimeterSecond"

        temperature:

            detail: 2
            snap: false
            unit: "celsius"

        time:

            detail: 2
            snap: false
            unit: "millisecond"

        volume:

            detail: 2
            snap: false
            unit:

                imperial: "inchCu"
                metric: "millimeterCu"

    update: (path, value) ->

        setting = path[1]

        if setting is "scale"

            $(".settings-category #scales-" + setting + "").val value

            $("select.metric").css "display", if value is "metric" then "block" else "none"
            $("select.imperial").css "display", if value is "imperial" then "block" else "none"

        else

            $(".settings-category #scales-" + setting + "." + path.last() + "").val value
