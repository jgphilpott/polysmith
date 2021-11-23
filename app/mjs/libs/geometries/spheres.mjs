// Link: https://threejs.org/docs/#api/en/geometries/SphereGeometry

import {black, white, grayscale} from "../colors/grayscale.mjs"
import {red, orange, yellow, green, blue, purple, pink, rainbow} from "../colors/rainbow.mjs"

import {standardMaterial} from "../materials/materials.mjs"

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
