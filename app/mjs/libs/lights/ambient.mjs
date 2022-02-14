// Link: https://threejs.org/docs/#api/en/lights/AmbientLight

import {white} from "../colors/three/grayscale.mjs"

export function addAmbientLight(position=data.scale) {

  let ambientLight = new THREE.AmbientLight(white, 1)

  ambientLight.position.set(0, 0, 0)
  data.scene.add(ambientLight)

  return ambientLight

}
