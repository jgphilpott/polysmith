// Link: https://threejs.org/docs/#api/en/lights/HemisphereLight

import {black, white} from "../colors/grayscale.mjs"

export function addHemisphereLight(position=data.scale) {

  let hemisphereLight = new THREE.HemisphereLight(white, black, 1)

  hemisphereLight.position.set(0, 0, 0)
  data.scene.add(hemisphereLight)

  return hemisphereLight

}
