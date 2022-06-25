# Link: https://threejs.org/docs/#api/en/cameras/PerspectiveCamera

addPerspectiveCamera = (near = scale / 1000, far = scale * 10, fov = 75, aspect = window.innerWidth / window.innerHeight) ->

    perspectiveCamera = new THREE.PerspectiveCamera fov, aspect, near, far

    perspectiveCamera.up.set 0, 0, 1

    position = settings.camera.position
    target = settings.camera.target

    perspectiveCamera.position.set position.x, position.y, position.z
    perspectiveCamera.lookAt target.x, target.y, target.z
    perspectiveCamera.target = target

    scene.add perspectiveCamera

    return perspectiveCamera
