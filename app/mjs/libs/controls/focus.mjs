export function focus(obj, duration=1000, steps=100) {

  let target = camera.target

  if (obj.x != target.x || obj.y != target.y || obj.z != target.z) {

    let stepX = (obj.x - target.x) / steps
    let stepY = (obj.y - target.y) / steps
    let stepZ = (obj.z - target.z) / steps

    for (let i = 1; i <= steps; i++) {

      setTimeout(updateCameraTarget, (duration / steps) * i)

    }

    function updateCameraTarget() {

      target.x += stepX
      target.y += stepY
      target.z += stepZ

      camera.lookAt(target.x, target.y, target.z)

      $("#camera.panel #target-x input").val(target.x.toFixed(2))
      $("#camera.panel #target-y input").val(target.y.toFixed(2))
      $("#camera.panel #target-z input").val(target.z.toFixed(2))

    }

    updateSettings("camera", "target", {x: obj.x, y: obj.y, z: obj.z})

    return true

  } else {

    return false

  }

}