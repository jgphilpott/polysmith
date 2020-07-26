import {black, white, red, orange, yellow, green, blue} from "./colors.mjs"

export let standardMaterial = new THREE.MeshStandardMaterial({"color": black})

export function lineMaterial(color=black, linewidth=1) {

  return new THREE.LineBasicMaterial({"color": color, "linewidth": linewidth})

}
