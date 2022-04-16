import {LineGeometry} from "../../../libs/js/LineGeometry.mjs"
import {lineMaterial} from "../materials/line.mjs"
import {LineMesh} from "../../../libs/js/LineMesh.mjs"

import {black} from "../colors/solid/grayscale.mjs"
import {addMesh} from "../../panels/mesh.mjs"

export function lineGeometry(vertices=[[10, 10, 10], [-10, -10, -10]]) {

  let positions = []

  for (let i = 0; i < vertices.length; i++) {

    positions.push(vertices[i][0], vertices[i][1], vertices[i][2])

  }

  return new LineGeometry().setPositions(positions)

}

export function newLine2(vertices=[[10, 10, 10], [-10, -10, -10]], material="fat", color=black, linewidth=1, dashed=false, dashSize=3, gapSize=2) {

  let line = new LineMesh(lineGeometry(vertices), lineMaterial(material, color, linewidth, dashed, dashSize, gapSize)).computeLineDistances()

  line.class = "line"

  return line

}

export function addLine2(vertices=[[10, 10, 10], [-10, -10, -10]], material="fat", color=black, linewidth=1, dashed=false, dashSize=3, gapSize=2) {

  return addMesh(newLine2(vertices, material, color, linewidth, dashed, dashSize, gapSize))

}