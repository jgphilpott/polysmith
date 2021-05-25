import {black, white} from "../colors.mjs"

import {addAxes, removeAxes} from "../axes.mjs"

export function importSTL(path, center=null) {

  let loader = new THREE.STLLoader()

  loader.load(path, function(stl) {

    let mesh = new THREE.Mesh(stl, new THREE.MeshStandardMaterial({color: black}))

    data.meshes.push(mesh)

    return mesh

  })

}

export function exportSTL() {

  removeAxes()

  let exporter = new THREE.STLExporter()

  let blob = new Blob([exporter.parse(data.scene)], {type: "text/plain"})

  saveAs(blob, data.name + ".stl")

  addAxes()

}
