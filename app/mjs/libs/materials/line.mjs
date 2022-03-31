import {black} from "../colors/three/grayscale.mjs"

export function lineMaterial(type="basic", color=black, linewidth=1, dashSize=5, gapSize=3) {

  let material = null

  switch (type) {

    case "basic":
      material = new THREE.LineBasicMaterial({color: color, linewidth: linewidth})
      break

    case "dashed":
      material = new THREE.LineDashedMaterial({color: color, linewidth: linewidth, dashSize: dashSize, gapSize: gapSize})
      break

  }

  if (material) material.transparent = true

  return material

}