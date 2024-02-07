# Link: https://threejs.org/docs/#api/en/materials/LineDashedMaterial

class DashedLineMaterial extends LineMaterial

    constructor: (params = {}) ->

        super "dashed", params

class POLY.DashedLineMaterial extends THREE.LineDashedMaterial

    constructor: (params = {}) ->

        params.color ?= blackThree
        params.transparent ?= true
        params.opacity ?= 100
        params.linewidth ?= 1
        params.dashed = true

        params.dashSize ?= adaptor "convert", "length", 3
        params.gapSize ?= adaptor "convert", "length", 2

        $params = clone params
        $params.opacity /= 100

        $params.dashSize = adaptor "invert", "length", $params.dashSize
        $params.gapSize = adaptor "invert", "length", $params.gapSize

        super $params

        @dashed = $params.dashed
