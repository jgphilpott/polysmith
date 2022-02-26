// Link: https://threejs.org/docs/#api/en/lights/DirectionalLight

import {white} from "../colors/three/grayscale.mjs"

export function addDirectionalLight(position=data.scale) {

  let directionalLight = new THREE.DirectionalLight(white, 1)

  directionalLight.position.set(position, position, position)
  data.scene.add(directionalLight)

  return directionalLight

}