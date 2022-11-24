# Link: https://threejs.org/docs/#api/en/materials/LineBasicMaterial

class SolidLineMaterial extends LineMaterial

    constructor : (params = {}) ->

        super "solid", params

class POLY.SolidLineMaterial extends THREE.LineBasicMaterial

    constructor : (params = {}) ->

        color = params.color ?= blackThree
        linewidth = params.linewidth ?= 1

        super

            color: color
            linewidth: linewidth
