# Link: https://gist.github.com/jgphilpott/9e1cf7758b8d7cf02537bb15aacdba6a

class StrokeLineMaterial extends LineMaterial

    constructor: (params = {}) ->

        super "stroke", params

class POLY.StrokeLineMaterial extends LineThickMaterial

    constructor: (params = {}) ->

        params.color ?= blackThree
        params.transparent ?= true
        params.opacity ?= 100
        params.linewidth ?= 1
        params.dashed ?= false

        params.dashSize ?= adaptor "convert", "length", 3
        params.gapSize ?= adaptor "convert", "length", 2

        $params = clone params
        $params.opacity /= 100

        $params.dashSize = adaptor "invert", "length", $params.dashSize
        $params.gapSize = adaptor "invert", "length", $params.gapSize

        super $params

        this.setResolution()

    getResolution: ->

        return clone this.resolution

    setResolution: (width = window.innerWidth, height = window.innerHeight) ->

        this.resolution.set width, height
