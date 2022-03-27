// Link: https://threejs.org/docs/#api/en/geometries/RingGeometry

import {black} from "../colors/three/grayscale.mjs"
import {addMesh} from "../../panels/mesh.mjs"
import {meshMaterial} from "../materials/mesh.mjs"

export function newRing(innerRadius=5, outerRadius=10, radialSegments=42, position=[0, 0, 0], material="normal", color=black) {

  let geometry = new THREE.RingGeometry(innerRadius, outerRadius, radialSegments)
  let ring = new THREE.Mesh(geometry, meshMaterial(material, color))

  ring.position.set(position[0], position[1], position[2])
  ring.class = "ring"

  return ring

}

export function addRing(innerRadius=5, outerRadius=10, radialSegments=42, position=[0, 0, 0], material="normal", color=black) {

  return addMesh(newRing(innerRadius, outerRadius, radialSegments, position, material, color))

}