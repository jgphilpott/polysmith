// Link: https://threejs.org/docs/#api/en/lights/DirectionalLight

import {white} from "../colors/three/grayscale.js"

export function addDirectionalLight(color=white, intensity=1, position={x: scale, y: scale, z: scale}) {

  let directionalLight = new THREE.DirectionalLight(color, intensity)

  directionalLight.position.set(position.x, position.y, position.z)

  scene.add(directionalLight)

  return directionalLight

}