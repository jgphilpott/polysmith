// Link: https://threejs.org/docs/#api/en/geometries/ConeGeometry

import {addMesh} from "../../panels/mesh.mjs"
import {meshMaterial} from "../materials/mesh.mjs"

export function newCone(radius=5, height=10, radialSegments=42, position=[0, 0, 0], material="normal", color=blackThree) {

  let geometry = new THREE.ConeGeometry(radius, height, radialSegments)
  let cone = new THREE.Mesh(geometry, meshMaterial(material, color))

  cone.position.set(position[0], position[1], position[2])
  cone.rotation.x = degree2radian(90)

  cone.class = "cone"
  cone.name = "Cone"

  return cone

}

export function addCone(radius=5, height=10, radialSegments=42, position=[0, 0, 0], material="normal", color=blackThree) {

  return addMesh(newCone(radius, height, radialSegments, position, material, color))

}