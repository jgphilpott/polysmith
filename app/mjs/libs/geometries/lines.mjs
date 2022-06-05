// Link: https://threejs.org/docs/#api/en/objects/Line

import {addMesh} from "../../panels/mesh.mjs"
import {lineMaterial} from "../materials/line.mjs"

export function lineGeometry(vertices=[[10, 10, 10], [-10, -10, -10]]) {

  let geometry = new THREE.Geometry()

  for (let i = 0; i < vertices.length; i++) {

    geometry.vertices.push(new THREE.Vector3(vertices[i][0], vertices[i][1], vertices[i][2]))

  }

  return geometry

}

export function newLine(vertices=[[10, 10, 10], [-10, -10, -10]], material="basic", color=blackThree, linewidth=1, dashed=false, dashSize=3, gapSize=2) {

  let line = new THREE.Line(lineGeometry(vertices), lineMaterial(material, color, linewidth, dashed, dashSize, gapSize)).computeLineDistances()

  line.class = "line"
  line.name = "Line"

  return line

}

export function addLine(vertices=[[10, 10, 10], [-10, -10, -10]], material="basic", color=blackThree, linewidth=1, dashed=false, dashSize=3, gapSize=2) {

  return addMesh(newLine(vertices, material, color, linewidth, dashed, dashSize, gapSize))

}