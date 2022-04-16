import {black} from "../colors/three/grayscale.mjs"
import {LineMaterial} from "../../../libs/js/LineMaterial.mjs"

export function lineMaterial(type="basic", color=black, linewidth=1, dashed=false, dashSize=3, gapSize=2, vertexColors=false, alphaToCoverage=false) {

  let material = null

  switch (type) {

    case "basic":
      material = new THREE.LineBasicMaterial({color: color, linewidth: linewidth})
      break

    case "dashed":
      material = new THREE.LineDashedMaterial({color: color, linewidth: linewidth, dashSize: dashSize, gapSize: gapSize})
      break

    case "fat":
      material = new LineMaterial({color: color, linewidth: linewidth, dashed: dashed, vertexColors: vertexColors, alphaToCoverage: alphaToCoverage})
      break

  }

  if (material) {

    material.transparent = true

    if (type == "fat") material.resolution.set(window.innerWidth, window.innerHeight)

  }

  return material

}