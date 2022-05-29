export function addDragControls() {

  let radius3, startX, startY = null
  let target, position, dragSpeed = null
  let horizontalAngle, verticalAngle = null

  function start(event) {

    camera.dragged = null

    event.preventDefault()
    event.stopPropagation()

    startX = event.pageX
    startY = event.pageY

    target = camera.target
    position = camera.position

    dragSpeed = settings.controls.dragSpeed / 500

    let deltaX = Math.abs(position.x - target.x)
    let deltaZ = Math.abs(position.z - target.z)

    radius3 = position.distanceTo(target)
    let radius2 = side4sides(deltaZ, null, radius3)

    horizontalAngle = angle4sides(radius2, deltaX)
    if (position.x < target.x) horizontalAngle = 180 - horizontalAngle
    if (position.y < target.y) horizontalAngle = - horizontalAngle

    verticalAngle = angle4sides(radius3, deltaZ)
    if (position.z < target.z) verticalAngle = 180 - verticalAngle

    document.onmousemove = drag
    document.onmouseup = stop

  }

  function drag(event) {

    camera.dragged = true

    event.preventDefault()
    event.stopPropagation()

    let satoshi = 0.000001
    let panel = $("#camera.panel")

    let radius2 = side4sides(Math.abs(position.z - target.z), null, radius3)

    let newHorizontalAngle = horizontalAngle + ((startX - event.pageX) * dragSpeed)
    if (newHorizontalAngle >= 180) newHorizontalAngle = newHorizontalAngle - 360

    let newVerticalAngle = verticalAngle + ((startY - event.pageY) * dragSpeed)
    if (newVerticalAngle <= 0) { newVerticalAngle = satoshi } else if (newVerticalAngle >= 180) { newVerticalAngle = - 180 - satoshi }

    let newX = side4angle(newHorizontalAngle, radius2, true, null) + target.x
    let newY = side4angle(newHorizontalAngle, radius2, null, true) + target.y
    let newZ = side4angle(newVerticalAngle, radius3, true, null) + target.z

    panel.find("#position-x input").val(newX.toFixed(2))
    panel.find("#position-y input").val(newY.toFixed(2))
    panel.find("#position-z input").val(newZ.toFixed(2))

    position.set(newX, newY, newZ)
    camera.lookAt(target.x, target.y, target.z)

  }

  function stop(event) {

    event.preventDefault()
    event.stopPropagation()

    document.onmouseup = null
    document.onmousemove = null

    updateSettings("camera", "position", position)

  }

  $("#canvas").mousedown(start)

}