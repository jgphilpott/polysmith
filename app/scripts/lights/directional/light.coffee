# Link: https://threejs.org/docs/#api/en/lights/DirectionalLight

class DirectionalLight extends Light

    constructor: (params = {}) ->

        super "directional", params

class POLY.DirectionalLight extends THREE.DirectionalLight

    constructor: (params = {}) ->

        intensity = params.intensity ?= 1
        color = params.color ?= whiteThree
        position = params.position ?= printer.getSize()

        super color, intensity

        this.position.set position.x, position.y, position.z
