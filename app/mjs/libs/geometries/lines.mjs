// Linl: https://threejs.org/docs/#api/en/objects/Line

import {black, white, red, yellow, green, blue} from "../colors.mjs"

import {lineMaterial} from "../materials.mjs"

export function newVector(vertices=[]) {

  let vector = new THREE.Geometry()

  for (let i = 0; i < vertices.length; i++) {

    vector.vertices.push(new THREE.Vector3(vertices[i][0], vertices[i][1], vertices[i][2]))

  }

  return vector

}

export function newLine(vertices=[], color=black, linewidth=1) {

  return new THREE.Line(newVector(vertices), lineMaterial(color, linewidth))

}

export function addLine(vertices=[], color=black, linewidth=1) {

  let line = newLine(vertices, color, linewidth)

  data.scene.add(line)

  return line

}
