// Link: https://threejs.org/docs/#api/en/lights/HemisphereLight

import {white, black} from "../colors/three/grayscale.js"

export function addHemisphereLight(sky=white, ground=black, intensity=1, position={x: 0, y: 0, z: 0}) {

  let hemisphereLight = new THREE.HemisphereLight(sky, ground, intensity)

  hemisphereLight.position.set(position.x, position.y, position.z)

  scene.add(hemisphereLight)

  return hemisphereLight

}