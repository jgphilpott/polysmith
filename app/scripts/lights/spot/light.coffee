# Link: https://threejs.org/docs/#api/en/lights/SpotLight

class SpotLight extends Light

    constructor: (intensity = 1, color = whiteThree) ->

        super "spot", intensity, color

class POLY.SpotLight extends THREE.SpotLight

    constructor: (intensity = 1, color = whiteThree) ->

        super color, intensity
