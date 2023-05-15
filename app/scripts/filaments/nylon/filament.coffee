class NylonFilament

    constructor: (nylonSettings = settings.get "filaments.nylon") ->

        for setting in Object.keys nylonSettings

            @[setting] = nylonSettings[setting]
