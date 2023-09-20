class UISettings

    constructor: (settings) ->

        if _.isObject settings

            for setting in Object.keys settings

                @[setting] = settings[setting]

    defaults: ->

        fullscreen: false
        title: "POLYMORPH"
        theme: "light"
        navbar: true
        forkme: true
        metabox: true
        help: true

    update: (path, value) ->

        setting = path[1]

        if setting isnt "title" and setting isnt "theme"

            $(".settings-category #ui-" + setting + "").prop "checked", value

            if setting is "fullscreen"

                if value then openFullScreen() else closeFullScreen()

            else if setting is "navbar"

                if value then navbar.show() else navbar.hide()

            else if setting is "forkme"

                if value then forkme.show() else forkme.hide()

            else if setting is "help"

                if value then help.show() else help.hide()
