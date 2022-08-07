# Link: https://threejs.org/docs/#api/en/lights/HemisphereLight

class HemisphereLight extends THREE.HemisphereLight

    constructor : (intensity = 1, colorOne = whiteThree, colorTwo = blackThree) ->

        super colorOne, colorTwo, intensity
