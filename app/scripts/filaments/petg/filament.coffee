class PETGFilament

    constructor: (PETGSettings = settings.get "filaments.petg") ->

        for setting in Object.keys PETGSettings

            @[setting] = PETGSettings[setting]
