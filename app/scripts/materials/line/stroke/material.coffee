# Link: N/A

class StrokeLineMaterial extends LineMaterial

    constructor : (params = {}) ->

        super "stroke", params

class POLY.StrokeLineMaterial extends LineThickMaterial

    constructor : (params = {}) ->

        color = params.color ?= blackThree
        linewidth = params.linewidth ?= 1

        dashed = params.dashed ?= false
        dashSize = params.dashSize ?= 3
        gapSize = params.gapSize ?= 2

        vertexColors = params.vertexColors ?= false
        alphaToCoverage = params.alphaToCoverage ?= false

        super

            color: color
            linewidth: linewidth

            dashed: dashed
            dashSize: dashSize
            gapSize: gapSize

            vertexColors: vertexColors
            alphaToCoverage: alphaToCoverage
