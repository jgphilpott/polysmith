// Link: https://threejs.org/docs/#api/en/geometries/BoxGeometry

import {black} from "../colors/three/grayscale.mjs"
import {addMesh} from "../../panels/mesh.mjs"
import {meshMaterial} from "../materials/mesh.mjs"

export function newBox(width=10, height=10, depth=10, position=[0, 0, 0], material="normal", color=black) {

  let geometry = new THREE.BoxGeometry(width, height, depth)
  let box = new THREE.Mesh(geometry, meshMaterial(material, color))

  box.position.set(position[0], position[1], position[2])
  box.class = "box"

  return box

}

export function addBox(width=10, height=10, depth=10, position=[0, 0, 0], material="normal", color=black) {

  return addMesh(newBox(width, height, depth, position, material, color))

}