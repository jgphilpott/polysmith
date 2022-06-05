// Link: https://threejs.org/docs/#api/en/geometries/BoxGeometry

import {addMesh} from "../../panels/mesh.mjs"
import {meshMaterial} from "../materials/mesh.mjs"

export function newBox(length=10, width=10, height=10, position=[0, 0, 0], material="normal", color=blackThree) {

  let geometry = new THREE.BoxGeometry(length, width, height)
  let box = new THREE.Mesh(geometry, meshMaterial(material, color))

  box.position.set(position[0], position[1], position[2])

  box.class = "box"
  box.name = "Box"

  return box

}

export function addBox(length=10, width=10, height=10, position=[0, 0, 0], material="normal", color=blackThree) {

  return addMesh(newBox(length, width, height, position, material, color))

}