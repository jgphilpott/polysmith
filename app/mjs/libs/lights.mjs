import {black, white, red, yellow, green, blue} from "./colors.mjs"

export function addLights(position=data.scale, intensity=100) {

  let light = new THREE.PointLight(white, intensity)
  light.position.set(position, position, position)
  data.lights = [light]
  data.scene.add(light)

}
