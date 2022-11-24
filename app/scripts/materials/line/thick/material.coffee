# Link: N/A

class ThickLineMaterial extends LineMaterial

    constructor : (params = {}) ->

        super "thick", params

class POLY.ThickLineMaterial extends LineThickMaterial

    constructor : (params) ->

        color = params.color ?= blackThree
        linewidth = params.linewidth ?= 1
        dashed = params.dashed ?= false
        vertexColors = params.vertexColors ?= false
        alphaToCoverage = params.alphaToCoverage ?= false

        super

            color: color
            linewidth: linewidth
            dashed: dashed
            vertexColors: vertexColors
            alphaToCoverage: alphaToCoverage
