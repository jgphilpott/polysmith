export function lineMaterial(type="basic", color=blackThree, linewidth=1, dashed=false, dashSize=3, gapSize=2, vertexColors=false, alphaToCoverage=false) {

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