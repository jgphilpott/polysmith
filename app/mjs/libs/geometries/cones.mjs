// Link: https://threejs.org/docs/#api/en/geometries/ConeGeometry

import {black} from "../colors/three/grayscale.mjs"
import {addMesh} from "../../panels/mesh.mjs"
import {meshMaterial} from "../materials/mesh.mjs"

export function newCone(radius=5, height=10, radialSegments=42, position=[0, 0, 0], material="normal", color=black) {

  let geometry = new THREE.ConeGeometry(radius, height, radialSegments)
  let cone = new THREE.Mesh(geometry, meshMaterial(material, color))

  cone.position.set(position[0], position[1], position[2])
  cone.rotation.x = degree2radian(90)
  cone.class = "cone"

  return cone

}

export function addCone(radius=5, height=10, radialSegments=42, position=[0, 0, 0], material="normal", color=black) {

  return addMesh(newCone(radius, height, radialSegments, position, material, color))

}