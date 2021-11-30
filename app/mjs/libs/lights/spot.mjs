// Link: https://threejs.org/docs/#api/en/lights/SpotLight

import {white} from "../colors/grayscale.mjs"

export function addSpotLight(position=data.scale) {

  let spotLight = new THREE.SpotLight(white, 1)

  spotLight.position.set(position, position, position)
  data.scene.add(spotLight)

  return spotLight

}
