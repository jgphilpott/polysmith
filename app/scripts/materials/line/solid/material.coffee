# Link: https://threejs.org/docs/#api/en/materials/LineBasicMaterial

class SolidLineMaterial extends LineMaterial

    constructor: (params = {}) ->

        super "solid", params

class POLY.SolidLineMaterial extends THREE.LineBasicMaterial

    constructor: (params = {}) ->

        params.color ?= blackThree
        params.linewidth ?= 1

        super params

        @dashed = false
