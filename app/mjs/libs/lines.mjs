import {black, white, red, green, blue} from "./colors.mjs"

export function newVector(vertices=[]) {

  let vector = new THREE.Geometry()

  for (let i = 0; i < vertices.length; i++) {

    vector.vertices.push(new THREE.Vector3(vertices[i][0], vertices[i][1], vertices[i][2]))

  }

  return vector

}

export function newLineMaterial(color=black, linewidth=1) {

  return new THREE.LineBasicMaterial({"color": color, "linewidth": linewidth})

}

export function newLine(vertices=[], color=black, linewidth=1) {

  return new THREE.Line(newVector(vertices), newLineMaterial(color, linewidth))

}

export function addLine(vertices=[], color=black, linewidth=1) {

  return data.scene.add(newLine(vertices, color, linewidth))

}
