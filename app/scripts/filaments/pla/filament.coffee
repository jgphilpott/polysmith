class PLAFilament

    constructor: (PLASettings = settings.get "filaments.pla") ->

        for setting in Object.keys PLASettings

            @[setting] = PLASettings[setting]
