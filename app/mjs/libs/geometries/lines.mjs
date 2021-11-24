// Link: https://threejs.org/docs/#api/en/objects/Line

import {black} from "../colors/grayscale.mjs"
import {lineMaterial} from "../materials/line.mjs"

export function newVector(vertices=[]) {

  let vector = new THREE.Geometry()

  for (let i = 0; i < vertices.length; i++) {

    vector.vertices.push(new THREE.Vector3(vertices[i][0], vertices[i][1], vertices[i][2]))

  }

  return vector

}

export function newLine(vertices=[], color=black, material="basic", linewidth=1) {

  return new THREE.Line(newVector(vertices), lineMaterial(material, color, linewidth))

}

export function addLine(vertices=[], color=black, material="basic", linewidth=1) {

  let line = newLine(vertices, color, material, linewidth)

  data.scene.add(line)

  return line

}
