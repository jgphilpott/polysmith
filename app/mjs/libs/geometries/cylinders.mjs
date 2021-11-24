// Link: https://threejs.org/docs/#api/en/geometries/CylinderGeometry

import {black} from "../colors/grayscale.mjs"
import {meshMaterial} from "../materials/mesh.mjs"

export function newCylinder(length=10, positiveRadius=5, negativeRadius=5, radialSegments=42, position=[0, 0, 0], material="normal", color=black) {

  let geometry = new THREE.CylinderGeometry(positiveRadius, negativeRadius, length, radialSegments)
  let cylinder = new THREE.Mesh(geometry, meshMaterial(material, color))

  cylinder.position.set(position[0], position[1], position[2])

  return cylinder

}

export function addCylinder(length=10, positiveRadius=5, negativeRadius=5, radialSegments=42, position=[0, 0, 0], material="normal", color=black) {

  let cylinder = newCylinder(length, positiveRadius, negativeRadius, radialSegments, position, material, color)

  data.scene.add(cylinder)

  return cylinder

}
