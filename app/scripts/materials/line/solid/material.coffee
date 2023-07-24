# Link: https://threejs.org/docs/#api/en/materials/LineBasicMaterial

class SolidLineMaterial extends LineMaterial

    constructor: (params = {}) ->

        super "solid", params

class POLY.SolidLineMaterial extends THREE.LineBasicMaterial

    constructor: (params = {}) ->

        params.color ?= blackThree
        params.opacity ?= 100
        params.linewidth ?= 1
        params.dashed = false

        $params = clone params
        $params.opacity /= 100

        super $params

        @dashed = $params.dashed
