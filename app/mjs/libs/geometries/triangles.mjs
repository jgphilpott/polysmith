import {black} from "../colors/three/grayscale.mjs"
import {meshMaterial} from "../materials/mesh.mjs"

export function newTriangle(v1=[0, 0, 0], v2=[0, 10, 0], v3=[0, 0, 10], material="normal", color=black) {

  let geometry = new THREE.Geometry()

  geometry.vertices.push(new THREE.Vector3(v1[0], v1[1], v1[2]))
  geometry.vertices.push(new THREE.Vector3(v2[0], v2[1], v2[2]))
  geometry.vertices.push(new THREE.Vector3(v3[0], v3[1], v3[2]))

  geometry.faces.push(new THREE.Face3(0, 1, 2))

  let triangle = new THREE.Mesh(geometry, meshMaterial(material, color))

  return triangle

}

export function addTriangle(v1=[0, 0, 0], v2=[0, 10, 0], v3=[0, 0, 10], material="normal", color=black) {

  let triangle = newTriangle(v1, v2, v3, material, color)

  data.scene.add(triangle)

  return triangle

}
