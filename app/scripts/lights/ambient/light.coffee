# Link: https://threejs.org/docs/#api/en/lights/AmbientLight

class AmbientLight extends Light

    constructor: (params = {}) ->

        super "ambient", params

class POLY.AmbientLight extends THREE.AmbientLight

    constructor: (params = {}) ->

        lock = params.lock ?= false
        intensity = params.intensity ?= 1
        color = params.color ?= whiteThree
        position = params.position ?= x: 0, y: 0, z: 0

        super color, intensity

        this.lock = Boolean lock

        position = vectorAdaptor "invert", "length", position

        this.position.set position.x, position.y, position.z
