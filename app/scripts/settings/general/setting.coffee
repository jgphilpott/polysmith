class GeneralSettings

    constructor: (settings) ->

        if _.isObject settings

            for setting in Object.keys settings

                @[setting] = settings[setting]

    defaults: ->

        language: "en-US"
        currency: "USD"
        scale: "metric"
        snap: true

    update: (path, value) ->

        setting = path[1]

        if setting is "scale" or setting is "unit"

            $(".settings-category #general-" + setting + "").val value
