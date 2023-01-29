# Link: https://threejs.org/docs/#api/en/cameras/CubeCamera

class CubeCamera extends THREE.CubeCamera

    constructor: (near = 0.1, far = 1000, target = render) ->

        super near, far, target
