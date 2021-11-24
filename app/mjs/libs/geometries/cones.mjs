// Link: https://threejs.org/docs/#api/en/geometries/ConeGeometry

import {black} from "../colors/grayscale.mjs"
import {meshMaterial} from "../materials/mesh.mjs"

export function newCone(radius=5, height=10, radialSegments=42, position=[0, 0, 0], color=black, material="normal") {

  let geometry = new THREE.ConeGeometry(radius, height, radialSegments)
  let cone = new THREE.Mesh(geometry, meshMaterial(material, color))

  cone.position.set(position[0], position[1], position[2])

  return cone

}

export function addCone(radius=5, height=10, radialSegments=42, position=[0, 0, 0], color=black, material="normal") {

  let cone = newCone(radius, height, radialSegments, position, color, material)

  data.scene.add(cone)

  return cone

}
