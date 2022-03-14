// Link: https://threejs.org/docs/#api/en/lights/PointLight

import {white} from "../colors/three/grayscale.mjs"

export function addPointLight(position=scale) {

  let pointLight = new THREE.PointLight(white, 1)

  pointLight.position.set(position, position, position)
  scene.add(pointLight)

  return pointLight

}