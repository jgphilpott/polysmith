import {black, white} from "../colors.mjs"

export function importSTL(path) {

  let loader = new THREE.STLLoader()

  loader.load(path, function(stl) {

    let mesh = new THREE.Mesh(stl, new THREE.MeshStandardMaterial({"color": black}))
    data.meshes.push(mesh)
    data.scene.add(mesh)

  })

}

export function exportSTL() {

  let exporter = new THREE.STLExporter()

  let blob = new Blob([exporter.parse(data.scene)], {"type": "text/plain"})

  saveAs(blob, data.name + ".stl")

}
