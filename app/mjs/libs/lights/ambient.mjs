// Link: https://threejs.org/docs/#api/en/lights/AmbientLight

import {white} from "../colors/three/grayscale.js"

export function addAmbientLight(color=white, intensity=1, position={x: 0, y: 0, z: 0}) {

  let ambientLight = new THREE.AmbientLight(color, intensity)

  ambientLight.position.set(position.x, position.y, position.z)

  scene.add(ambientLight)

  return ambientLight

}