// Link: https://threejs.org/docs/#api/en/geometries/SphereGeometry

import {black} from "../colors/grayscale.mjs"
import {meshMaterial} from "../materials/mesh.mjs"

export function newSphere(radius=1, position=[0, 0, 0], color=black, material="basic") {

  let geometry = new THREE.SphereGeometry(radius, 42, 42)
  let sphere = new THREE.Mesh(geometry, meshMaterial("basic", color))

  sphere.position.set(position[0], position[1], position[2])

  return sphere

}

export function addSphere(radius=1, position=[0, 0, 0], color=black, material="basic") {

  let sphere = newSphere(radius, position, color, material)

  data.scene.add(sphere)

  return sphere

}
