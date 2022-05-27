// Link: https://threejs.org/docs/#api/en/lights/PointLight

import {white} from "../colors/three/grayscale.js"

export function addPointLight(color=white, intensity=1, position={x: scale, y: scale, z: scale}) {

  let pointLight = new THREE.PointLight(color, intensity)

  pointLight.position.set(position.x, position.y, position.z)

  scene.add(pointLight)

  return pointLight

}