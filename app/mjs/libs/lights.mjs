import {black, white, red, yellow, green, blue} from "./colors.mjs"

export function addLights(position=data.scale) {

  let ambientLight = new THREE.AmbientLight(white, 1)

  ambientLight.position.set(0, 0, 0)
  data.scene.add(ambientLight)

  let pointLight = new THREE.PointLight(white, 10)

  pointLight.position.set(position, position, position)
  data.scene.add(pointLight)

  data.lights = [ambientLight, pointLight]

  return data.lights

}
