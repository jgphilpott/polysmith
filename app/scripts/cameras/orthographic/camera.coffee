# Link: https://threejs.org/docs/#api/en/cameras/OrthographicCamera

class OrthographicCamera extends THREE.OrthographicCamera

    constructor: (left = window.innerWidth / -2, right = window.innerWidth / 2, top = window.innerHeight / 2, bottom = window.innerHeight / -2, near = 0.1, far = 1000) ->

        super left, right, top, bottom, near, far
