export function addEvents() {

  $("body").keypress(function(event) {

    if (event.ctrlKey && event.keyCode == 10) {

      let exporter = new THREE.STLExporter()

      let blob = new Blob([exporter.parse(data.scene)], {"type": "text/plain"})

      saveAs(blob, "shape.stl")

    }

  })

}
