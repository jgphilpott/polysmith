class Settings

    constructor: ->

        localSettings = localRead "settings"

        if client

            settings = client.settings

        else if localSettings

            settings = localSettings

        else

            settings = this.defaults()

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

        _.get this, path, undefined

    set: (path, value) ->

        _.set this, path, value

        if typeof path is "string"

            path = path.split "."

        this[path[0]].update path, value

        localStore.write "settings", this

        if client then socket.emit "update_settings", id: readCookie("id"), path: path, value: value
