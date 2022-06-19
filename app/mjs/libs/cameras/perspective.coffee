# Link: https://threejs.org/docs/#api/en/cameras/PerspectiveCamera

addPerspectiveCamera = () ->

    perspectiveCamera = new THREE.PerspectiveCamera 75, window.innerWidth / window.innerHeight, scale / 1000, scale * 10

    perspectiveCamera.up.set 0, 0, 1

    position = settings.camera.position
    target = settings.camera.target

    perspectiveCamera.position.set position.x, position.y, position.z
    perspectiveCamera.lookAt target.x, target.y, target.z
    perspectiveCamera.target = target

    scene.add perspectiveCamera

    return perspectiveCamera
