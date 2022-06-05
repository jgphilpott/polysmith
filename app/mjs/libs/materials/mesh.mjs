export function meshMaterial(type="normal", color=blackThree, side=THREE.DoubleSide) {

  let material = null

  switch (type) {

    case "basic":
      material = new THREE.MeshBasicMaterial({color: color, side: side})
      break

    case "depth":
      material = new THREE.MeshDepthMaterial({side: side})
      break

    case "distance":
      material = new THREE.MeshDistanceMaterial({side: side})
      break

    case "lambert":
      material = new THREE.MeshLambertMaterial({color: color, side: side})
      break

    case "matcap":
      material = new THREE.MeshMatcapMaterial({color: color, side: side})
      break

    case "normal":
      material = new THREE.MeshNormalMaterial({side: side})
      break

    case "phong":
      material = new THREE.MeshPhongMaterial({color: color, side: side})
      break

    case "physical":
      material = new THREE.MeshPhysicalMaterial({color: color, side: side})
      break

    case "standard":
      material = new THREE.MeshStandardMaterial({color: color, side: side})
      break

    case "toon":
      material = new THREE.MeshToonMaterial({color: color, side: side})
      break

  }

  if (material) {

    material.transparent = true

    if (color == blackThree) {
      material.metalness = -25
      material.roughness = 0.75
    } else {
      material.metalness = 0.5
      material.roughness = 0.5
    }

  }

  return material

}