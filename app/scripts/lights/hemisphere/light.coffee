# Link: https://threejs.org/docs/#api/en/lights/HemisphereLight

class HemisphereLight extends Light

    constructor: (intensity = 1, skyColor = whiteThree, groundColor = blackThree) ->

        super "hemisphere", intensity, skyColor, groundColor

class POLY.HemisphereLight extends THREE.HemisphereLight

    constructor: (intensity = 1, skyColor = whiteThree, groundColor = blackThree) ->

        super skyColor, groundColor, intensity
