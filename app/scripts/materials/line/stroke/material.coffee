# Link: N/A

class StrokeLineMaterial extends LineMaterial

    constructor : (params = {}) ->

        super "stroke", params

class POLY.StrokeLineMaterial extends LineThickMaterial

    constructor : (params = {}) ->

        color = params.color ?= blackThree

        dashed = params.dashed ?= false
        linewidth = params.linewidth ?= 1

        vertexColors = params.vertexColors ?= false
        alphaToCoverage = params.alphaToCoverage ?= false

        super

            color: color

            dashed: dashed
            linewidth: linewidth

            vertexColors: vertexColors
            alphaToCoverage: alphaToCoverage
