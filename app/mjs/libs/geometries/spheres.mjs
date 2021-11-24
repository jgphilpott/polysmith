// Link: https://threejs.org/docs/#api/en/geometries/SphereGeometry

import {black} from "../colors/grayscale.mjs"
import {meshMaterial} from "../materials/mesh.mjs"

export function newSphere(radius=5, widthSegments=42, heightSegments=42, position=[0, 0, 0], color=black, material="normal") {

  let geometry = new THREE.SphereGeometry(radius, widthSegments, heightSegments)
  let sphere = new THREE.Mesh(geometry, meshMaterial(material, color))

  sphere.position.set(position[0], position[1], position[2])

  return sphere

}

export function addSphere(radius=5, widthSegments=42, heightSegments=42, position=[0, 0, 0], color=black, material="normal") {

  let sphere = newSphere(radius, widthSegments, heightSegments, position, color, material)

  data.scene.add(sphere)

  return sphere

}
