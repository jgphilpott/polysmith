# Link: https://threejs.org/docs/#api/en/materials/LineDashedMaterial

class DashedLineMaterial extends LineMaterial

    constructor : (params = {}) ->

        super "dashed", params

class POLY.DashedLineMaterial extends THREE.LineDashedMaterial

    constructor : (params) ->

        color = params.color ?= blackThree
        linewidth = params.linewidth ?= 1
        dashSize = params.dashSize ?= 3
        gapSize = params.gapSize ?= 2

        super

            color: color
            linewidth: linewidth
            dashSize: dashSize
            gapSize: gapSize
