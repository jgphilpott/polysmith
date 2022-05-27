// Link: https://threejs.org/docs/#api/en/lights/SpotLight

import {white} from "../colors/three/grayscale.js"

export function addSpotLight(color=white, intensity=1, position={x: scale, y: scale, z: scale}) {

  let spotLight = new THREE.SpotLight(color, intensity)

  spotLight.position.set(position.x, position.y, position.z)

  scene.add(spotLight)

  return spotLight

}