import {black, white} from "./colors.mjs"

export function addLights() {

  let light = new THREE.PointLight(white, 100)
  light.position.set(100, 100, 100)
  data.lights = [light]
  data.scene.add(light)

}
