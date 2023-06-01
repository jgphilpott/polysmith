# Link: https://gist.github.com/jgphilpott/9e1cf7758b8d7cf02537bb15aacdba6a

class StrokeLineMaterial extends LineMaterial

    constructor: (params = {}) ->

        super "stroke", params

class POLY.StrokeLineMaterial extends LineThickMaterial

    constructor: (params = {}) ->

        params.color ?= blackThree
        params.linewidth ?= 1

        params.dashed ?= false
        params.dashSize ?= 3
        params.gapSize ?= 2

        super params
