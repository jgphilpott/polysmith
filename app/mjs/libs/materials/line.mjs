import {black} from "../colors/grayscale.mjs"

export function lineMaterial(type="basic", color=black, linewidth=1, dashSize=3, gapSize=1, scale=1) {

  switch (type) {

    case "basic":
      return new THREE.LineBasicMaterial({color: color, linewidth: linewidth})
      break

    case "dashed":
      return new THREE.LineDashedMaterial({color: color, linewidth: linewidth, dashSize: dashSize, gapSize: gapSize, scale: scale})
      break

  }

}
