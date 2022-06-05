// Link: https://threejs.org/docs/#api/en/lights/AmbientLight

export function addAmbientLight(color=whiteThree, intensity=1, position={x: 0, y: 0, z: 0}) {

  let ambientLight = new THREE.AmbientLight(color, intensity)

  ambientLight.position.set(position.x, position.y, position.z)

  scene.add(ambientLight)

  return ambientLight

}