import {black, white, grayscale} from "../colors/grayscale.mjs"
import {red, orange, yellow, green, blue, purple, pink, rainbow} from "../colors/rainbow.mjs"

import {standardMaterial} from "../materials/materials.mjs"

export function newTriangle(v1=[10, 0, 0], v2=[0, 10, 0], v3=[0, 0, 10], color=black) {

  let geometry = new THREE.Geometry()

  geometry.vertices.push(new THREE.Vector3(v1[0], v1[1], v1[2]))
  geometry.vertices.push(new THREE.Vector3(v2[0], v2[1], v2[2]))
  geometry.vertices.push(new THREE.Vector3(v3[0], v3[1], v3[2]))

  geometry.faces.push(new THREE.Face3(0, 1, 2))

  let triangle = new THREE.Mesh(geometry, standardMaterial(color))

  return triangle

}

export function addTriangle(v1=[10, 0, 0], v2=[0, 10, 0], v3=[0, 0, 10], color=black) {

  let triangle = newTriangle(v1, v2, v3, color)

  data.scene.add(triangle)

  return triangle

}
