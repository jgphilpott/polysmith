export function addDragControls() {

  let radius3 = null
  let startX, startY = null
  let horizontalAngle, verticalAngle = null
  let dragSpeed = settings.controls.dragSpeed

  let target = camera.target
  let position = camera.position

  function start(event) {

    event.preventDefault()
    event.stopPropagation()

    camera.dragged = null

    startX = event.pageX
    startY = event.pageY

    let deltaX = Math.abs(position.x - target.x)
    let deltaY = Math.abs(position.y - target.y)
    let deltaZ = Math.abs(position.z - target.z)

    radius3 = position.distanceTo(target)
    let radius2 = side4sides(deltaZ, null, radius3)

    horizontalAngle = angle4sides(radius2, deltaX)
    if (position.x < target.x) { horizontalAngle = 180 - horizontalAngle }
    if (position.y < target.y) { horizontalAngle = -horizontalAngle }

    verticalAngle = angle4sides(radius3, deltaZ)
    if (position.z < target.z) { verticalAngle = 180 - verticalAngle }

    dragSpeed = settings.controls.dragSpeed / 500

    document.onmousemove = drag
    document.onmouseup = stop

  }

  function drag(event) {

    event.preventDefault()
    event.stopPropagation()

    camera.dragged = true

    let radius2 = side4sides(Math.abs(position.z - target.z), null, radius3)

    let newHorizontalAngle = horizontalAngle + ((startX - event.pageX) * dragSpeed)
    if (newHorizontalAngle >= 180) { newHorizontalAngle = newHorizontalAngle - 360 }

    let newVerticalAngle = verticalAngle + ((startY - event.pageY) * dragSpeed)
    if (newVerticalAngle <= 0) { newVerticalAngle = 0.000001 } else if (newVerticalAngle >= 180) { newVerticalAngle = -180 - 0.000001 }

    let newX = side4angle(newHorizontalAngle, radius2, true, null) + target.x
    let newY = side4angle(newHorizontalAngle, radius2, null, true) + target.y
    let newZ = side4angle(newVerticalAngle, radius3, true, null) + target.z

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