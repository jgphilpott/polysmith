# Docs: https://threejs.org/docs/#api/en/cameras/PerspectiveCamera

class PerspectiveCamera extends THREE.PerspectiveCamera

    constructor: (near = 0.1, far = 1000, fov = 75, aspect = window.innerWidth / window.innerHeight) ->

        super fov, aspect, near, far
