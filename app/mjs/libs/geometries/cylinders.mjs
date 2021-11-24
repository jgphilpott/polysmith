// Link: https://threejs.org/docs/#api/en/geometries/CylinderGeometry

import {black} from "../colors/grayscale.mjs"
import {meshMaterial} from "../materials/mesh.mjs"

export function newCylinder(length=10, positiveRadius=10, negativeRadius=10, position=[0, 0, 0], color=black, material="basic", radialSegments=42) {

  let geometry = new THREE.CylinderGeometry(positiveRadius, negativeRadius, length, radialSegments)
  let cylinder = new THREE.Mesh(geometry, meshMaterial("basic", color))

  cylinder.position.set(position[0], position[1], position[2])

  return cylinder

}

export function addCylinder(length=10, positiveRadius=10, negativeRadius=10, position=[0, 0, 0], color=black, material="basic", radialSegments=42) {

  let cylinder = newCylinder(length, positiveRadius, negativeRadius, position, color, material, radialSegments)

  data.scene.add(cylinder)

  return cylinder

}
