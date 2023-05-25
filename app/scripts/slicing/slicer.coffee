class Slicer

    constructor: ->

        @gcode = settings.get "slicing.gcode"
        @adhesion = settings.get "slicing.adhesion"
        @support = settings.get "slicing.support"
        @layer = settings.get "slicing.layer"
        @infill = settings.get "slicing.infill"

    getGcode: ->

        return clone this.gcode

    setGcode: (gcode, save = true) ->

        this.gcode = gcode

        if save then settings.set "slicing.gcode", this.gcode

    getAdhesion: ->

        return clone this.adhesion

    setAdhesion: (adhesion, save = true) ->

        this.adhesion = adhesion

        if save then settings.set "slicing.adhesion", this.adhesion

    getSupport: ->

        return clone this.support

    setSupport: (support, save = true) ->

        this.support = support

        if save then settings.set "slicing.support", this.support

    getLayer: ->

        return adaptor "convert", "length", clone this.layer

    setLayer: (layer, save = true) ->

        this.layer = adaptor "invert", "length", layer

        if save then settings.set "slicing.layer", this.layer

    getInfillDensity: ->

        return clone this.infill.density

    setInfillDensity: (density, save = true) ->

        this.infill.density = density

        if save then settings.set "slicing.infill.density", this.infill.density

    getInfillPattern: ->

        return clone this.infill.pattern

    setInfillPattern: (pattern, save = true) ->

        this.infill.pattern = pattern

        if save then settings.set "slicing.infill.pattern", this.infill.pattern
