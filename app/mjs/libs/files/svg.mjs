import {meshMaterial} from "../materials/mesh.mjs"

export function importSVG(path, depth=10, bevelEnabled=false) {

  $.get(path, function(svg) {

    let shapes = []
    let paths = new THREE.SVGLoader().parse(svg).paths
    let extrusionSettings = {depth: depth, bevelEnabled: bevelEnabled}

    for (let i = 0; i < paths.length; i ++) {
      Array.prototype.push.apply(shapes, paths[i].toShapes())
    }

    let material = meshMaterial()
    let geometry = new THREE.ExtrudeBufferGeometry(shapes, extrusionSettings)
    let mesh = new THREE.Mesh(geometry, material)

    data.meshes.push(mesh)

    return mesh

  })

}

export function exportSVG() {}
