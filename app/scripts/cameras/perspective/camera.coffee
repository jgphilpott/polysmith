# Link: https://threejs.org/docs/#api/en/cameras/PerspectiveCamera

class PerspectiveCamera extends THREE.PerspectiveCamera

    constructor : (fov = 75, aspect = window.innerWidth / window.innerHeight, near = 0.1, far = 1000) ->

        super fov, aspect, near, far
