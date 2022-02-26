// Link: https://threejs.org/docs/#api/en/geometries/CircleGeometry

import {black} from "../colors/three/grayscale.mjs"
import {meshMaterial} from "../materials/mesh.mjs"

export function newCircle(radius=10, radialSegments=42, position=[0, 0, 0], material="normal", color=black) {

  let geometry = new THREE.CircleGeometry(radius, radialSegments)
  let circle = new THREE.Mesh(geometry, meshMaterial(material, color))

  circle.position.set(position[0], position[1], position[2])

  return circle

}

export function addCircle(radius=10, radialSegments=42, position=[0, 0, 0], material="normal", color=black) {

  let circle = newCircle(radius, radialSegments, position, material, color)

  data.scene.add(circle)

  return circle

}