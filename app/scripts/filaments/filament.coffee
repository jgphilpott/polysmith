class Filament

    constructor: (type = "pla") ->

        switch lower type.trim()

            when "abs"

                @filament = new ABSFilament(); break

            when "nylon"

                @filament = new NylonFilament(); break

            when "petg"

                @filament = new PETGFilament(); break

            when "pla"

                @filament = new PLAFilament(); break

        this.filament.getName = this.getName
        this.filament.setName = this.setName

        this.filament.getDescription = this.getDescription
        this.filament.setDescription = this.setDescription

        this.filament.getBrand = this.getBrand
        this.filament.setBrand = this.setBrand

        this.filament.getColor = this.getColor
        this.filament.setColor = this.setColor

        this.filament.getDiameter = this.getDiameter
        this.filament.setDiameter = this.setDiameter

        return this.filament

    getName: ->

        return clone this.name

    setName: (name, save = true) ->

        this.name = name

        if save then settings.set "filaments." + this.type + ".name", this.name

    getDescription: ->

        return clone this.description

    setDescription: (description, save = true) ->

        this.description = description

        if save then settings.set "filaments." + this.type + ".description", this.description

    getBrand: ->

        return clone this.brand

    setBrand: (brand, save = true) ->

        this.brand = brand

        if save then settings.set "filaments." + this.type + ".brand", this.brand

    getColor: ->

        return clone this.color

    setColor: (color, save = true) ->

        this.color = color

        if save then settings.set "filaments." + this.type + ".color", this.color

    getDiameter: ->

        return adaptor "convert", "length", clone this.diameter

    setDiameter: (diameter, save = true) ->

        this.diameter = adaptor "invert", "length", diameter

        if save then settings.set "filaments." + this.type + ".diameter", this.diameter
