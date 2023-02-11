class Settings

    constructor: ->

        @camera = new CameraSettings()
        @controls = new ControlsSettings()
        @filaments = new FilamentsSettings()
        @general = new GeneralSettings()
        @panels = new PanelsSettings()
        @printer = new PrinterSettings()
        @scales = new ScalesSettings()
        @slicing = new SlicingSettings()
        @tooltips = new TooltipsSettings()
        @ui = new UISettings()

        localSettings = localRead "settings"

        if client

            @settings = client.settings

        else if localSettings

            @settings = localSettings

        else

            @settings = this.defaults()

        localStore.write "settings", this.settings

    defaults: ->

        camera: this.camera.defaults()
        controls: this.controls.defaults()
        filaments: this.filaments.defaults()
        general: this.general.defaults()
        panels: this.panels.defaults()
        printer: this.printer.defaults()
        scales: this.scales.defaults()
        slicing: this.slicing.defaults()
        tooltips: this.tooltips.defaults()
        ui: this.ui.defaults()

    get: (path) ->

        _.get this.settings, path, undefined

    set: (path, value) ->

        _.set this.settings, path, value

        if typeof path is "string"

            path = path.split "."

        this[path[0]].update path, value

        localStore.write "settings", this.settings

        if client then socket.emit "update_settings", id: readCookie("id"), path: path, value: value
