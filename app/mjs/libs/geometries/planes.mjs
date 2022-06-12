// Link: https://threejs.org/docs/#api/en/geometries/PlaneGeometry

import {addMesh} from "../../panels/mesh.mjs"

export function newPlane(width=10, height=10, position=[0, 0, 0], material="normal", color=blackThree) {

  let geometry = new THREE.PlaneGeometry(width, height)
  let plane = new THREE.Mesh(geometry, meshMaterial(material, color))

  plane.position.set(position[0], position[1], position[2])

  plane.class = "plane"
  plane.name = "Plane"

  return plane

}

export function addPlane(width=10, height=10, position=[0, 0, 0], material="normal", color=blackThree) {

  return addMesh(newPlane(width, height, position, material, color))

}