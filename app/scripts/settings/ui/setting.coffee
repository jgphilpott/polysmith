class UISettings

    constructor: (settings) ->

        if _.isObject settings

            for setting in Object.keys settings

                @[setting] = settings[setting]

    defaults: ->

        title: "POLYMORPH"
        theme: "light"
        navbar: true
        forkme: true
        metabox: true
        help: true

    update: (path, value) ->

        null
