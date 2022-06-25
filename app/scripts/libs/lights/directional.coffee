# Link: https://threejs.org/docs/#api/en/lights/DirectionalLight

addDirectionalLight = (color = whiteThree, intensity = 1, position = x: scale, y: scale, z: scale) ->

    directionalLight = new THREE.DirectionalLight color, intensity

    directionalLight.position.set position.x, position.y, position.z

    scene.add directionalLight

    return directionalLight
