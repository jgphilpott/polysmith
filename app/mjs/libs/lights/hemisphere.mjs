// Link: https://threejs.org/docs/#api/en/lights/HemisphereLight

export function addHemisphereLight(sky=whiteThree, ground=blackThree, intensity=1, position={x: 0, y: 0, z: 0}) {

  let hemisphereLight = new THREE.HemisphereLight(sky, ground, intensity)

  hemisphereLight.position.set(position.x, position.y, position.z)

  scene.add(hemisphereLight)

  return hemisphereLight

}