import {black, white, grayscale} from "./colors/grayscale.mjs"
import {red, orange, yellow, green, blue, purple, pink, rainbow} from "./colors/rainbow.mjs"

export function addLights(position=data.scale) {

  let ambientLight = new THREE.AmbientLight(white, 1)

  ambientLight.position.set(0, 0, 0)
  data.scene.add(ambientLight)

  let pointLight = new THREE.PointLight(white, 1)

  pointLight.position.set(position, position, position)
  data.scene.add(pointLight)

  data.lights = [ambientLight, pointLight]

  return data.lights

}
