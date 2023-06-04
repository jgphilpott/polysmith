# Link: https://threejs.org/docs/#api/en/materials/LineDashedMaterial

class DashedLineMaterial extends LineMaterial

    constructor: (params = {}) ->

        super "dashed", params

class POLY.DashedLineMaterial extends THREE.LineDashedMaterial

    constructor: (params = {}) ->

        params.opacity = if params.opacity then params.opacity / 100 else 1
        params.color ?= blackThree
        params.linewidth ?= 1

        params.dashSize ?= 3
        params.gapSize ?= 2

        super params

        @dashed = true
