// Link: https://threejs.org/docs/#api/en/geometries/PlaneGeometry

import {black} from "../colors/three/grayscale.js"
import {addMesh} from "../../panels/mesh.mjs"
import {meshMaterial} from "../materials/mesh.mjs"

export function newPlane(width=10, height=10, position=[0, 0, 0], material="normal", color=black) {

  let geometry = new THREE.PlaneGeometry(width, height)
  let plane = new THREE.Mesh(geometry, meshMaterial(material, color))

  plane.position.set(position[0], position[1], position[2])
  plane.class = "plane"

  return plane

}

export function addPlane(width=10, height=10, position=[0, 0, 0], material="normal", color=black) {

  return addMesh(newPlane(width, height, position, material, color))

}