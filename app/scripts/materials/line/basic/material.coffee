# Link: https://threejs.org/docs/#api/en/materials/LineBasicMaterial

class BasicLineMaterial extends LineMaterial

    constructor : (params = {}) ->

        super "basic", params

class POLY.BasicLineMaterial extends THREE.LineBasicMaterial

    constructor : (params) ->

        color = params.color ?= blackThree
        linewidth = params.linewidth ?= 1

        super

            color: color
            linewidth: linewidth
