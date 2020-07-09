import {black, white, red, yellow, green, blue} from "./colors.mjs"

export function newSphere(radius=1, color=black) {

  let geometry = new THREE.SphereGeometry(radius, 42, 42)
  let material = new THREE.MeshStandardMaterial({"color": color})
  let sphere = new THREE.Mesh(geometry, material)

  return sphere

}

export function addSphere(position=[0, 0, 0], radius=1, color=black) {

  let sphere = newSphere(radius, color)
  sphere.position.set(position[0], position[1], position[2])
  data.scene.add(sphere)

}
