import {black} from "../colors/three/grayscale.mjs"

export function lineMaterial(type="basic", color=black, linewidth=1, dashSize=5, gapSize=3) {

  switch (type) {

    case "basic":
      return new THREE.LineBasicMaterial({color: color, linewidth: linewidth})
      break

    case "dashed":
      return new THREE.LineDashedMaterial({color: color, linewidth: linewidth, dashSize: dashSize, gapSize: gapSize})
      break

  }

}
