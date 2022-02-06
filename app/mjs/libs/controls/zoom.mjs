export function addZoomControls() {

  $("#canvas").on("wheel", function(event) {

    let zoomMax = data.settings.controls.zoomMax
    let zoomMin = data.settings.controls.zoomMin
    let zoomSpeed = data.settings.controls.zoomSpeed
    let zoomDelta = event.originalEvent.wheelDelta / zoomSpeed

    let camera = data.camera
    let target = camera.target
    let position = camera.position

    let stepX = position.x - target.x
    let stepY = position.y - target.y
    let stepZ = position.z - target.z

    // Zoom In
    if (zoomDelta > 0) {
      if (position.distanceTo(target) >= zoomMin) { zoom() }
    }

    // Zoom Out
    else if (zoomDelta < 0) {
      if (position.distanceTo(target) <= zoomMax) { zoom() }
    }

    function zoom() {

      position.x -= stepX * zoomDelta
      position.y -= stepY * zoomDelta
      position.z -= stepZ * zoomDelta

    }

  })

}
