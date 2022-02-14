// Link: https://threejs.org/docs/#api/en/geometries/TorusGeometry

import {black} from "../colors/three/grayscale.mjs"
import {meshMaterial} from "../materials/mesh.mjs"

export function newTorus(radius=10, thickness=3, radialSegments=42, tubularSegments=42, position=[0, 0, 0], material="normal", color=black) {

  let geometry = new THREE.TorusGeometry(radius, thickness, radialSegments, tubularSegments)
  let torus = new THREE.Mesh(geometry, meshMaterial(material, color))

  torus.position.set(position[0], position[1], position[2])

  return torus

}

export function addTorus(radius=10, thickness=3, radialSegments=42, tubularSegments=42, position=[0, 0, 0], material="normal", color=black) {

  let torus = newTorus(radius, thickness, radialSegments, tubularSegments, position, material, color)

  data.scene.add(torus)

  return torus

}
