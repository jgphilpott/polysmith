// Link: https://threejs.org/docs/#api/en/geometries/TorusKnotGeometry

import {black} from "../colors/three/grayscale.js"
import {addMesh} from "../../panels/mesh.mjs"
import {meshMaterial} from "../materials/mesh.mjs"

export function newKnot(size=10, thickness=3, radialSegments=42, tubularSegments=42, position=[0, 0, 0], material="normal", color=black) {

  let geometry = new THREE.TorusKnotGeometry(size, thickness, tubularSegments, radialSegments)
  let knot = new THREE.Mesh(geometry, meshMaterial(material, color))

  knot.position.set(position[0], position[1], position[2])

  knot.class = "knot"
  knot.name = "Torus Knot"

  return knot

}

export function addKnot(size=10, thickness=3, radialSegments=42, tubularSegments=42, position=[0, 0, 0], material="normal", color=black) {

  return addMesh(newKnot(size, thickness, radialSegments, tubularSegments, position, material, color))

}