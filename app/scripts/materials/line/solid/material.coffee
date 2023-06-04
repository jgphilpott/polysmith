# Link: https://threejs.org/docs/#api/en/materials/LineBasicMaterial

class SolidLineMaterial extends LineMaterial

    constructor: (params = {}) ->

        super "solid", params

class POLY.SolidLineMaterial extends THREE.LineBasicMaterial

    constructor: (params = {}) ->

        params.opacity = if params.opacity then params.opacity / 100 else 1
        params.color ?= blackThree
        params.linewidth ?= 1

        super params

        @dashed = false
