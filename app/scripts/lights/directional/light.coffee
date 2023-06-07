# Link: https://threejs.org/docs/#api/en/lights/DirectionalLight

class DirectionalLight extends Light

    constructor: (intensity = 1, color = whiteThree) ->

        super "directional", intensity, color

class POLY.DirectionalLight extends THREE.DirectionalLight

    constructor: (intensity = 1, color = whiteThree) ->

        super color, intensity
