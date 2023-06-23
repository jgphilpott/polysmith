# Link: https://threejs.org/docs/#api/en/materials/Material

class LineMaterial

    constructor: (type, params = {}) ->

        switch lower type.trim()

            when "dashed"

                @material = new POLY.DashedLineMaterial params; break

            when "solid"

                @material = new POLY.SolidLineMaterial params; break

            when "stroke"

                @material = new POLY.StrokeLineMaterial params; break

            else

                @material = params.material

        this.material.getColor = this.getColor
        this.material.setColor = this.setColor

        this.material.getOpacity = this.getOpacity
        this.material.setOpacity = this.setOpacity

        this.material.getTransparent = this.getTransparent
        this.material.setTransparent = this.setTransparent

        this.material.getLinewidth = this.getLinewidth
        this.material.setLinewidth = this.setLinewidth

        this.material.getDashed = this.getDashed
        this.material.setDashed = this.setDashed

        this.material.getDashSize = this.getDashSize
        this.material.setDashSize = this.setDashSize

        this.material.getGapSize = this.getGapSize
        this.material.setGapSize = this.setGapSize

        this.material.setTransparent true

        return this.material

    getColor: ->

        return clone this.color

    setColor: (color) ->

        if color instanceof THREE.Color

            this.color = color

        else

            this.color = new THREE.Color color

    getOpacity: ->

        return clone this.opacity * 100

    setOpacity: (opacity) ->

        this.opacity = Number opacity / 100

    getTransparent: ->

        return clone this.transparent

    setTransparent: (transparent) ->

        this.transparent = Boolean transparent

    getLinewidth: ->

        return clone this.linewidth

    setLinewidth: (linewidth) ->

        this.linewidth = Number linewidth

    getDashed: ->

        return clone this.dashed

    setDashed: (dashed) ->

        this.dashed = Boolean dashed

    getDashSize: ->

        return adaptor "convert", "length", clone this.dashSize

    setDashSize: (dashSize) ->

        this.dashSize = adaptor "invert", "length", dashSize

    getGapSize: ->

        return adaptor "convert", "length", clone this.gapSize

    setGapSize: (gapSize) ->

        this.gapSize = adaptor "invert", "length", gapSize
