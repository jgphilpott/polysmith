import {black, white} from "../colors.mjs"

export function importSVG(path, depth=10, bevelEnabled=false, center=true) {

  let shapes = []
  let paths = new THREE.SVGLoader().parse(path).paths

  let extrusionSettings = {depth: depth,
                           bevelEnabled: bevelEnabled}

  for (let i = 0; i < paths.length; i ++) {
    Array.prototype.push.apply(shapes, paths[i].toShapes())
  }

  let geometry = new THREE.ExtrudeBufferGeometry(shapes, extrusionSettings)

  if (center) {geometry.center()}

  let mesh = new THREE.Mesh(geometry, new THREE.MeshStandardMaterial({color: black}))

  data.meshes.push(mesh)

  return mesh

}
