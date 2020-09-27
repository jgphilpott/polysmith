import {black, white} from "../colors.mjs"

export function importOBJ(path) {

  let loader = new THREE.OBJLoader()

  loader.load(path, function(obj) {

    let mesh = obj
    data.meshes.push(mesh)
    data.scene.add(mesh)

  })

}

export function exportOBJ() {

  let exporter = new THREE.OBJExporter()

  let blob = new Blob([exporter.parse(data.scene)], {"type": "text/plain"})

  saveAs(blob, data.name + ".obj")

}
