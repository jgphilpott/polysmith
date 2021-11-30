import {black, white} from "../colors/grayscale.mjs"
import {meshMaterial} from "../materials/mesh.mjs"
import {addAxes, removeAxes} from "../draw/axes.mjs"

export function importSTL(path) {

  let loader = new THREE.STLLoader()

  loader.load(path, function(stl) {

    let material = meshMaterial()
    let geometry = new THREE.Geometry().fromBufferGeometry(stl)
    let mesh = new THREE.Mesh(geometry, material)

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
