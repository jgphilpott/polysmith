class ABSFilament

    constructor: (ABSSettings = settings.get "filaments.abs") ->

        for setting in Object.keys ABSSettings

            @[setting] = ABSSettings[setting]
