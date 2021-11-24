// Link: https://threejs.org/docs/#api/en/geometries/TorusKnotGeometry

import {black} from "../colors/grayscale.mjs"
import {meshMaterial} from "../materials/mesh.mjs"

export function newKnot(size=10, thickness=3, radialSegments=42, tubularSegments=64, position=[0, 0, 0], material="normal", color=black) {

  let geometry = new THREE.TorusKnotGeometry(size, thickness, tubularSegments, radialSegments)
  let knot = new THREE.Mesh(geometry, meshMaterial(material, color))

  knot.position.set(position[0], position[1], position[2])

  return knot

}

export function addKnot(size=10, thickness=3, radialSegments=42, tubularSegments=64, position=[0, 0, 0], material="normal", color=black) {

  let knot = newKnot(size, thickness, radialSegments, tubularSegments, position, material, color)

  data.scene.add(knot)

  return knot

}
