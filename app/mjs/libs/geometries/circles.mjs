// Link: https://threejs.org/docs/#api/en/geometries/CircleGeometry

import {addMesh} from "../../panels/mesh.mjs"
import {meshMaterial} from "../materials/mesh.mjs"

export function newCircle(radius=10, radialSegments=42, position=[0, 0, 0], material="normal", color=blackThree) {

  let geometry = new THREE.CircleGeometry(radius, radialSegments)
  let circle = new THREE.Mesh(geometry, meshMaterial(material, color))

  circle.position.set(position[0], position[1], position[2])

  circle.class = "circle"
  circle.name = "Circle"

  return circle

}

export function addCircle(radius=10, radialSegments=42, position=[0, 0, 0], material="normal", color=blackThree) {

  return addMesh(newCircle(radius, radialSegments, position, material, color))

}