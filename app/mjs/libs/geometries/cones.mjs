// Link: https://threejs.org/docs/#api/en/geometries/ConeGeometry

import {black} from "../colors/three/grayscale.mjs"
import {meshMaterial} from "../materials/mesh.mjs"

export function newCone(radius=5, height=10, radialSegments=42, position=[0, 0, 0], material="normal", color=black) {

  let geometry = new THREE.ConeGeometry(radius, height, radialSegments)
  let cone = new THREE.Mesh(geometry, meshMaterial(material, color))

  cone.position.set(position[0], position[1], position[2])

  return cone

}

export function addCone(radius=5, height=10, radialSegments=42, position=[0, 0, 0], material="normal", color=black) {

  let cone = newCone(radius, height, radialSegments, position, material, color)

  data.scene.add(cone)

  return cone

}
