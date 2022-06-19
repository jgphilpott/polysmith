# Link: https://threejs.org/docs/#api/en/lights/SpotLight

addSpotLight = (color = whiteThree, intensity = 1, position = x: scale, y: scale, z: scale) ->

  spotLight = new THREE.SpotLight color, intensity

  spotLight.position.set position.x, position.y, position.z

  scene.add spotLight

  return spotLight
