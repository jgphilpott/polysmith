// Link: https://threejs.org/docs/#api/en/geometries/PlaneGeometry

import {black} from "../colors/three/grayscale.mjs"
import {meshMaterial} from "../materials/mesh.mjs"

export function newPlane(width=10, height=10, position=[0, 0, 0], material="normal", color=black) {

  let geometry = new THREE.PlaneGeometry(width, height)
  let plane = new THREE.Mesh(geometry, meshMaterial(material, color))

  plane.position.set(position[0], position[1], position[2])

  return plane

}

export function addPlane(width=10, height=10, position=[0, 0, 0], material="normal", color=black) {

  let plane = newPlane(width, height, position, material, color)

  data.scene.add(plane)

  return plane

}