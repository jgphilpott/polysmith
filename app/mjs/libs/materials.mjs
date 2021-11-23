// Link: https://github.com/mrdoob/three.js/tree/dev/src/materials

import {black, white, grayscale} from "./colors/grayscale.mjs"
import {red, orange, yellow, green, blue, purple, pink, rainbow} from "./colors/rainbow.mjs"

export function standardMaterial(color=black, doubleSided=THREE.DoubleSide) {

  return new THREE.MeshStandardMaterial({"color": color, "side": doubleSided})

}

export function lineMaterial(color=black, linewidth=1) {

  return new THREE.LineBasicMaterial({"color": color, "linewidth": linewidth})

}
