class GeneralSettings

    constructor: (settings) ->

        if _.isObject settings

            for setting in Object.keys settings

                @[setting] = settings[setting]

    defaults: ->

        language: "en-US"
        currency: "USD"

    update: (path, value) ->

        null
