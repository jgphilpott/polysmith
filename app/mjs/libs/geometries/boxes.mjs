// Link: https://threejs.org/docs/#api/en/geometries/BoxGeometry

import {black} from "../colors/grayscale.mjs"
import {meshMaterial} from "../materials/mesh.mjs"

export function newBox(width=10, height=10, depth=10, position=[0, 0, 0], color=black, material="basic") {

  let geometry = new THREE.BoxGeometry(width, height, depth)
  let box = new THREE.Mesh(geometry, meshMaterial(material, color))

  box.position.set(position[0], position[1], position[2])

  return box

}

export function addBox(width=10, height=10, depth=10, position=[0, 0, 0], color=black, material="basic") {

  let box = newBox(width, height, depth, position, color, material)

  data.scene.add(box)

  return box

}
