class Printer

    constructor: ->

        @size = settings.get "printer.size"
        @shape = settings.get "printer.shape"
        @centred = settings.get "printer.centred"
        @heated = settings.get "printer.heated"
        @nozzles = settings.get "printer.nozzles"

    getSize: ->

        return vectorAdaptor "convert", "length", clone this.size

    setSize: (size, save = true) ->

        this.size = vectorAdaptor "invert", "length", size

        if save then settings.set "printer.size", this.size

    getSizeX: ->

        return adaptor "convert", "length", clone this.size.x

    setSizeX: (size, save = true) ->

        this.size.x = adaptor "invert", "length", size

        if save then settings.set "printer.size", this.size

    getSizeY: ->

        return adaptor "convert", "length", clone this.size.y

    setSizeY: (size, save = true) ->

        this.size.y = adaptor "invert", "length", size

        if save then settings.set "printer.size", this.size

    getSizeZ: ->

        return adaptor "convert", "length", clone this.size.z

    setSizeZ: (size, save = true) ->

        this.size.z = adaptor "invert", "length", size

        if save then settings.set "printer.size", this.size

    getShape: ->

        return clone this.shape

    setShape: (shape, save = true) ->

        this.shape = shape

        if save then settings.set "printer.shape", this.shape

    getCentred: ->

        return clone this.centred

    setCentred: (centred, save = true) ->

        this.centred = centred

        if save then settings.set "printer.centred", this.centred

    getHeated: (component = "bed") ->

        return clone this.heated[component]

    setHeated: (heated, component = "bed", save = true) ->

        this.heated[component] = heated

        if save then settings.set "printer.heated", this.heated

    getNozzles: ->

        nozzles = clone this.nozzles

        for nozzle in nozzles

            nozzle.filament = adaptor "convert", "length", nozzle.filament
            nozzle.diameter = adaptor "convert", "length", nozzle.diameter
            nozzle.gantry = adaptor "convert", "length", nozzle.gantry

        return nozzles

    setNozzles: (nozzles, save = true)->

        for nozzle in nozzles

            nozzle.filament = adaptor "invert", "length", nozzle.filament
            nozzle.diameter = adaptor "invert", "length", nozzle.diameter
            nozzle.gantry = adaptor "invert", "length", nozzle.gantry

        this.nozzles = nozzles

        if save then settings.set "printer.nozzles", this.nozzles

    getNozzle: (index = 0) ->

        nozzle = clone this.nozzles[index]

        nozzle.filament = adaptor "convert", "length", nozzle.filament
        nozzle.diameter = adaptor "convert", "length", nozzle.diameter
        nozzle.gantry = adaptor "convert", "length", nozzle.gantry

        return nozzle

    setNozzle: (nozzle, index = 0, save = true)->

        nozzle.filament = adaptor "invert", "length", nozzle.filament
        nozzle.diameter = adaptor "invert", "length", nozzle.diameter
        nozzle.gantry = adaptor "invert", "length", nozzle.gantry

        this.nozzles[index] = nozzle

        if save then settings.set "printer.nozzles", this.nozzles

    getNozzleFilament: (index = 0) ->

        return adaptor "convert", "length", clone this.nozzles[index].filament

    setNozzleFilament: (filament, index = 0, save = true)->

        this.nozzles[index].filament = adaptor "invert", "length", filament

        if save then settings.set "printer.nozzles", this.nozzles

    getNozzleDiameter: (index = 0) ->

        return adaptor "convert", "length", clone this.nozzles[index].diameter

    setNozzleDiameter: (diameter, index = 0, save = true)->

        this.nozzles[index].diameter = adaptor "invert", "length", diameter

        if save then settings.set "printer.nozzles", this.nozzles

    getNozzleGantry: (index = 0) ->

        return adaptor "convert", "length", clone this.nozzles[index].gantry

    setNozzleGantry: (gantry, index = 0, save = true)->

        this.nozzles[index].gantry = adaptor "invert", "length", gantry

        if save then settings.set "printer.nozzles", this.nozzles

    reset: ->

        defaults = settings.printer.defaults()

        this.setSize vectorAdaptor "convert", "length", defaults.size
        this.setShape defaults.shape
        this.setCentred defaults.centred
        this.setHeated defaults.heated.bed, "bed"
        this.setHeated defaults.heated.volume, "volume"

        for nozzle in defaults.nozzles

            nozzle.filament = adaptor "convert", "length", nozzle.filament
            nozzle.diameter = adaptor "convert", "length", nozzle.diameter
            nozzle.gantry = adaptor "convert", "length", nozzle.gantry

        this.setNozzles defaults.nozzles
