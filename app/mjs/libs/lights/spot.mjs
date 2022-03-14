// Link: https://threejs.org/docs/#api/en/lights/SpotLight

import {white} from "../colors/three/grayscale.mjs"

export function addSpotLight(position=scale) {

  let spotLight = new THREE.SpotLight(white, 1)

  spotLight.position.set(position, position, position)
  scene.add(spotLight)

  return spotLight

}