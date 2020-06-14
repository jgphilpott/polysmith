export function importOBJ() {}

export function exportOBJ() {

  let exporter = new THREE.OBJExporter()

  let blob = new Blob([exporter.parse(data.scene)], {"type": "text/plain"})

  saveAs(blob, "shape.obj")

}
