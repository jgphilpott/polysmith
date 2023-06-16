# Link: https://threejs.org/docs/#api/en/lights/HemisphereLight

class HemisphereLight extends Light

    constructor: (params = {}) ->

        super "hemisphere", params

class POLY.HemisphereLight extends THREE.HemisphereLight

    constructor: (params = {}) ->

        intensity = params.intensity ?= 1
        skyColor = params.skyColor ?= whiteThree
        groundColor = params.groundColor ?= blackThree
        position = params.position ?= x: 0, y: 0, z: 0

        super skyColor, groundColor, intensity

        this.position.set position.x, position.y, position.z
