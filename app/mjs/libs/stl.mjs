export function importSTL() {}

export function exportSTL() {

  let exporter = new THREE.STLExporter()

  let blob = new Blob([exporter.parse(data.scene)], {"type": "text/plain"})

  saveAs(blob, "shape.stl")

}
