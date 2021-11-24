import {black} from "../colors/grayscale.mjs"

export function meshMaterial(type="normal", color=black, side=THREE.DoubleSide) {

  switch (type) {

    case "basic":
      return new THREE.MeshBasicMaterial({color: color, side: side})
      break

    case "depth":
      return new THREE.MeshDepthMaterial({side: side})
      break

    case "distance":
      return new THREE.MeshDistanceMaterial({side: side})
      break

    case "lambert":
      return new THREE.MeshLambertMaterial({color: color, side: side})
      break

    case "matcap":
      return new THREE.MeshMatcapMaterial({color: color, side: side})
      break

    case "normal":
      return new THREE.MeshNormalMaterial({side: side})
      break

    case "phong":
      return new THREE.MeshPhongMaterial({color: color, side: side})
      break

    case "physical":
      return new THREE.MeshPhysicalMaterial({color: color, side: side})
      break

    case "standard":
      return new THREE.MeshStandardMaterial({color: color, side: side})
      break

    case "toon":
      return new THREE.MeshToonMaterial({color: color, side: side})
      break

  }

}
