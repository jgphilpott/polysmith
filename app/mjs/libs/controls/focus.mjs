export function focus(point, duration=1000, steps=100) {

  let target = camera.target
  let panel = $("#camera.panel")

  if (point.x != target.x || point.y != target.y || point.z != target.z) {

    let stepX = (point.x - target.x) / steps
    let stepY = (point.y - target.y) / steps
    let stepZ = (point.z - target.z) / steps

    for (let i = 1; i <= steps; i++) {

      setTimeout(updateCameraTarget, (duration / steps) * i)

    }

    function updateCameraTarget() {

      target.x += stepX
      target.y += stepY
      target.z += stepZ

      camera.lookAt(target.x, target.y, target.z)

      panel.find("#target-x input").val(target.x.toFixed(2))
      panel.find("#target-y input").val(target.y.toFixed(2))
      panel.find("#target-z input").val(target.z.toFixed(2))

    }

    updateSettings("camera", "target", {x: point.x, y: point.y, z: point.z})

    return true

  } else {

    return false

  }

}