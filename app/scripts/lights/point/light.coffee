# Link: https://threejs.org/docs/#api/en/lights/PointLight

class PointLight extends Light

    constructor: (params = {}) ->

        super "point", params

class POLY.PointLight extends THREE.PointLight

    constructor: (params = {}) ->

        lock = params.lock ?= false
        intensity = params.intensity ?= 1
        color = params.color ?= whiteThree
        position = params.position ?= printer.getSize()

        super color, intensity

        this.lock = Boolean lock

        this.position.set position.x, position.y, position.z
