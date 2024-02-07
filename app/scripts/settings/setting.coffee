class Settings

    constructor: ->

        defaultSettings = this.defaults()
        localSettings = localRead "settings"

        if client or localSettings

            if client

                settings = client.settings

            else if localSettings

                settings = localSettings

            this.verifySettings settings, defaultSettings

        else

            settings = defaultSettings

        @camera = new CameraSettings(settings.camera)
        @controls = new ControlsSettings(settings.controls)
        @filaments = new FilamentsSettings(settings.filaments)
        @general = new GeneralSettings(settings.general)
        @panels = new PanelsSettings(settings.panels)
        @printer = new PrinterSettings(settings.printer)
        @scales = new ScalesSettings(settings.scales)
        @slicing = new SlicingSettings(settings.slicing)
        @tooltips = new TooltipsSettings(settings.tooltips)
        @ui = new UISettings(settings.ui)

        localStore.write "settings", this

    defaults: ->

        camera: new CameraSettings().defaults()
        controls: new ControlsSettings().defaults()
        filaments: new FilamentsSettings().defaults()
        general: new GeneralSettings().defaults()
        panels: new PanelsSettings().defaults()
        printer: new PrinterSettings().defaults()
        scales: new ScalesSettings().defaults()
        slicing: new SlicingSettings().defaults()
        tooltips: new TooltipsSettings().defaults()
        ui: new UISettings().defaults()

    get: (path) ->

        _.get this, path

    set: (path, value) ->

        _.set this, path, value

        if typeof path is "string"

            path = path.split "."

        if client

            update =

                path: path
                value: value
                id: readCookie "id"

            socket.emit "update_settings", update

        else

            localStore.write "settings", this

        this[path[0]].update path, value

    verifySettings: (settings, defaults) ->

        for setting in Object.keys defaults

            if setting not in Object.keys settings

                settings[setting] = defaults[setting]

            if _.isObject defaults[setting]

                if not _.isObject settings[setting]

                    settings[setting] = {}

                this.verifySettings settings[setting], defaults[setting]
