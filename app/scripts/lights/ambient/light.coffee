# Link: https://threejs.org/docs/#api/en/lights/AmbientLight

class AmbientLight extends Light

    constructor: (intensity = 1, color = whiteThree) ->

        super "ambient", intensity, color

class POLY.AmbientLight extends THREE.AmbientLight

    constructor: (intensity = 1, color = whiteThree) ->

        super color, intensity
