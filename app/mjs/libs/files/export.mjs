import {addAxes, removeAxes} from "../draw/axes.mjs"

export function exportFile(type) {

  removeAxes()

  let exporter = null
  let extension = null

  switch (type) {

    case "collada":

      exporter = new THREE.ColladaExporter()
      extension = ".dae"

      break

    case "draco":

      exporter = new THREE.DRACOExporter()
      extension = ".drc"

      break

    case "gltf":

      exporter = new THREE.GLTFExporter()
      extension = ".gltf"

      break

    case "mmd":

      exporter = new THREE.MMDExporter()
      extension = ".mmd"

      break

    case "obj":

      exporter = new THREE.OBJExporter()
      extension = ".obj"

      break

    case "ply":

      exporter = new THREE.PLYExporter()
      extension = ".ply"

      break

    case "stl":

      exporter = new THREE.STLExporter()
      extension = ".stl"

      break

  }

  let blob = new Blob([exporter.parse(scene)], {type: "text/plain"})

  saveAs(blob, data.title.toLowerCase() + extension)

  addAxes()

}

export function exportFiles(type) {}