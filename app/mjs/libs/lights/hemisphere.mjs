// Link: https://threejs.org/docs/#api/en/lights/HemisphereLight

import {black, white} from "../colors/three/grayscale.js"

export function addHemisphereLight(position=scale) {

  let hemisphereLight = new THREE.HemisphereLight(white, black, 1)

  hemisphereLight.position.set(0, 0, 0)
  scene.add(hemisphereLight)

  return hemisphereLight

}