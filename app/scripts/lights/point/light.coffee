# Link: https://threejs.org/docs/#api/en/lights/PointLight

class PointLight extends Light

    constructor: (intensity = 1, color = whiteThree) ->

        super "point", intensity, color

class POLY.PointLight extends THREE.PointLight

    constructor: (intensity = 1, color = whiteThree) ->

        super color, intensity
