import {meshMaterial} from "../materials/mesh.mjs"
import {addAxes, removeAxes} from "../draw/axes.mjs"

export function importOBJ(path) {

  let loader = new THREE.OBJLoader()

  loader.load(path, function(obj) {

    data.meshes.push(obj)

    return obj

  })

}

export function exportOBJ() {

  removeAxes()

  let exporter = new THREE.OBJExporter()

  let blob = new Blob([exporter.parse(data.scene)], {type: "text/plain"})

  saveAs(blob, data.name + ".obj")

  addAxes()

}
