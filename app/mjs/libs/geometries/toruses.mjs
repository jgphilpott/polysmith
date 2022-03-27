// Link: https://threejs.org/docs/#api/en/geometries/TorusGeometry

import {black} from "../colors/three/grayscale.mjs"
import {addMesh} from "../../panels/mesh.mjs"
import {meshMaterial} from "../materials/mesh.mjs"

export function newTorus(radius=5, thickness=1, radialSegments=42, tubularSegments=42, position=[0, 0, 0], material="normal", color=black) {

  let geometry = new THREE.TorusGeometry(radius, thickness, radialSegments, tubularSegments)
  let torus = new THREE.Mesh(geometry, meshMaterial(material, color))

  torus.position.set(position[0], position[1], position[2])
  torus.rotation.y = degree2radian(90)
  torus.class = "torus"

  return torus

}

export function addTorus(radius=5, thickness=1, radialSegments=42, tubularSegments=42, position=[0, 0, 0], material="normal", color=black) {

  return addMesh(newTorus(radius, thickness, radialSegments, tubularSegments, position, material, color))

}