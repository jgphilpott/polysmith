// Link: https://github.com/mrdoob/three.js/tree/dev/src/materials

import {black, white, red, orange, yellow, green, blue} from "./colors.mjs"

export function standardMaterial(color=black) {

  return new THREE.MeshStandardMaterial({"color": color})

}

export function lineMaterial(color=black, linewidth=1) {

  return new THREE.LineBasicMaterial({"color": color, "linewidth": linewidth})

}
