// Link: https://threejs.org/docs/#api/en/geometries/SphereGeometry

import {black, white, red, yellow, green, blue} from "../colors.mjs"

import {standardMaterial} from "../materials.mjs"

export function newSphere(radius=1, position=[0, 0, 0], color=black) {

  let geometry = new THREE.SphereGeometry(radius, 42, 42)
  let sphere = new THREE.Mesh(geometry, standardMaterial(color))

  sphere.position.set(position[0], position[1], position[2])

  return sphere

}

export function addSphere(radius=1, position=[0, 0, 0], color=black) {

  let sphere = newSphere(radius, position, color)

  data.scene.add(sphere)

  return sphere

}
