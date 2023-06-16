# Link: https://threejs.org/docs/#api/en/lights/SpotLight

class SpotLight extends Light

    constructor: (params = {}) ->

        super "spot", params

class POLY.SpotLight extends THREE.SpotLight

    constructor: (params = {}) ->

        intensity = params.intensity ?= 1
        color = params.color ?= whiteThree
        position = params.position ?= printer.getSize()

        super color, intensity

        this.position.set position.x, position.y, position.z
