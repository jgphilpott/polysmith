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

        this.material.getTransparent = this.getTransparent
        this.material.setTransparent = this.setTransparent

        this.material.getOpacity = this.getOpacity
        this.material.setOpacity = this.setOpacity

        this.material.getLinewidth = this.getLinewidth
        this.material.setLinewidth = this.setLinewidth

        this.material.getDashed = this.getDashed
        this.material.setDashed = this.setDashed

        this.material.getDashSize = this.getDashSize
        this.material.setDashSize = this.setDashSize

        this.material.getGapSize = this.getGapSize
        this.material.setGapSize = this.setGapSize

        return this.material

    getColor: ->

        return clone this.color

    setColor: (color = blackThree) ->

        if color instanceof THREE.Color

            this.color = color

        else

            this.color = new THREE.Color color

    getTransparent: ->

        return clone this.transparent

    setTransparent: (transparent = true) ->

        this.transparent = Boolean transparent

    getOpacity: ->

        return clone this.opacity * 100

    setOpacity: (opacity = 100) ->

        this.opacity = Number opacity / 100

    getLinewidth: ->

        return clone this.linewidth

    setLinewidth: (linewidth = 1) ->

        this.linewidth = Number linewidth

    getDashed: ->

        return clone this.dashed

    setDashed: (dashed = false) ->

        this.dashed = Boolean dashed

    getDashSize: ->

        return adaptor "convert", "length", clone this.dashSize

    setDashSize: (dashSize = adaptor "convert", "length", 3) ->

        this.dashSize = adaptor "invert", "length", Number dashSize

    getGapSize: ->

        return adaptor "convert", "length", clone this.gapSize

    setGapSize: (gapSize = adaptor "convert", "length", 2) ->

        this.gapSize = adaptor "invert", "length", Number gapSize
