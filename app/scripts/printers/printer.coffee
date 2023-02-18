class Printer

    constructor: ->

        @size = settings.get "printer.size"
        @shape = settings.get "printer.shape"
        @centred = settings.get "printer.centred"
        @heated = settings.get "printer.heated"
        @nozzles = settings.get "printer.nozzles"

    reset: ->

        defaults = settings.printer.defaults()

        this.setSize vectorAdaptor "convert", "length", defaults.size
        this.setShape defaults.shape
        this.setCentred defaults.centred
        this.setHeated defaults.heated
        this.setNozzles defaults.nozzles

    getSize: ->

        return vectorAdaptor "convert", "length", clone this.size

    getSizeX: ->

        return adaptor "convert", "length", clone this.size.x

    getSizeY: ->

        return adaptor "convert", "length", clone this.size.y

    getSizeZ: ->

        return adaptor "convert", "length", clone this.size.z

    setSize: (size, save = true) ->

        this.size = vectorAdaptor "invert", "length", size

        if save then settings.set "printer.size", this.size

        grid.reset()

    setSizeX: (size, save = true) ->

        this.size.x = adaptor "invert", "length", size

        if save then settings.set "printer.size", this.size

        grid.reset()

    setSizeY: (size, save = true) ->

        this.size.y = adaptor "invert", "length", size

        if save then settings.set "printer.size", this.size

        grid.reset()

    setSizeZ: (size, save = true) ->

        this.size.z = adaptor "invert", "length", size

        if save then settings.set "printer.size", this.size

        grid.reset()

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

        return clone this.nozzles

    setNozzles: (nozzles, save = true)->

        this.nozzles = nozzles

        if save then settings.set "printer.nozzles", this.nozzles

    getNozzle: (index = 0) ->

        return clone this.nozzles[index]

    setNozzle: (nozzle, index = 0, save = true)->

        this.nozzles[index] = nozzle

        if save then settings.set "printer.nozzles", this.nozzles
