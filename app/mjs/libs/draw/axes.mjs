import {contextMenu} from "../../panels/context.mjs"

const radius = scale / 100
const segments = 25

export function addAxes(min=(-scale), max=scale) {

  if (settings.axes.axesCaps) addAxesCaps(min, max)

  if (settings.axes.xyPlane) addPlaneXY(min, max)
  if (settings.axes.xzPlane) addPlaneXZ(min, max)
  if (settings.axes.yzPlane) addPlaneYZ(min, max)

  if (settings.axes.xAxis) addAxisX(min, max)
  if (settings.axes.yAxis) addAxisY(min, max)
  if (settings.axes.zAxis) addAxisZ(min, max)

  return axes

}

export function removeAxes() {

  for (let i = axes.length - 1; i >= 0; i--) {

    if (axes[i].name.includes("cap")) removeAxisCapEvents(axes[i])

    scene.remove(axes[i])
    axes.splice(i, 1)

  }

}

export function addAxesCaps(min=(-scale), max=scale) {

  if (settings.axes.axesCaps) {

    if (settings.axes.xAxis || settings.axes.yAxis || settings.axes.zAxis) {

      let centroid = newSphere(radius, segments, segments, [0, 0, 0], "basic", blackThree)

      centroid.name = "centroid-cap"

      addAxisCapEvents(centroid)

      axes.push(centroid)
      scene.add(centroid)

    }

    if (settings.axes.xAxis) addAxisCapsX(min, max)
    if (settings.axes.yAxis) addAxisCapsY(min, max)
    if (settings.axes.zAxis) addAxisCapsZ(min, max)

  }

}

export function removeAxesCaps() {

  for (let i = axes.length - 1; i >= 0; i--) {

    if (axes[i].name.includes("cap")) {

      removeAxisCapEvents(axes[i])

      scene.remove(axes[i])
      axes.splice(i, 1)

    }

  }

}

export function addAxisCapsX(min=(-scale), max=scale) {

  if (settings.axes.axesCaps && settings.axes.xAxis) {

    let minCapX = newSphere(radius, segments, segments, [min, 0, 0], "basic", redThree)
    let maxCapX = newSphere(radius, segments, segments, [max, 0, 0], "basic", greenThree)

    minCapX.name = "min-cap-x"
    maxCapX.name = "max-cap-x"

    addAxisCapEvents(minCapX)
    addAxisCapEvents(maxCapX)

    axes.push(minCapX, maxCapX)
    scene.add(minCapX, maxCapX)

  }

}

export function removeAxisCapsX() {

  for (let i = axes.length - 1; i >= 0; i--) {

    if (axes[i].name.includes("cap") && axes[i].name.includes("-x")) {

      removeAxisCapEvents(axes[i])

      scene.remove(axes[i])
      axes.splice(i, 1)

    }

  }

}

export function addAxisX(min=(-scale), max=scale) {

  if (settings.axes.xAxis) {

    let axisX = newLine2([[min, 0, 0], [max, 0, 0]], "thick", redThree, 3)

    axisX.name = "axis-x"

    axes.push(axisX)
    scene.add(axisX)

  }

}

export function removeAxisX() {

  for (let i = axes.length - 1; i >= 0; i--) {

    if (axes[i].name.includes("axis") && axes[i].name.includes("-x")) {

      scene.remove(axes[i])
      axes.splice(i, 1)

    }

  }

}

export function addAxisCapsY(min=(-scale), max=scale) {

  if (settings.axes.axesCaps && settings.axes.yAxis) {

    let minCapY = newSphere(radius, segments, segments, [0, min, 0], "basic", redThree)
    let maxCapY = newSphere(radius, segments, segments, [0, max, 0], "basic", greenThree)

    minCapY.name = "min-cap-y"
    maxCapY.name = "max-cap-y"

    addAxisCapEvents(minCapY)
    addAxisCapEvents(maxCapY)

    axes.push(minCapY, maxCapY)
    scene.add(minCapY, maxCapY)

  }

}

export function removeAxisCapsY() {

  for (let i = axes.length - 1; i >= 0; i--) {

    if (axes[i].name.includes("cap") && axes[i].name.includes("-y")) {

      removeAxisCapEvents(axes[i])

      scene.remove(axes[i])
      axes.splice(i, 1)

    }

  }

}

export function addAxisY(min=(-scale), max=scale) {

  if (settings.axes.yAxis) {

    let axisY = newLine2([[0, min, 0], [0, max, 0]], "thick", greenThree, 3)

    axisY.name = "axis-y"

    axes.push(axisY)
    scene.add(axisY)

  }

}

export function removeAxisY() {

  for (let i = axes.length - 1; i >= 0; i--) {

    if (axes[i].name.includes("axis") && axes[i].name.includes("-y")) {

      scene.remove(axes[i])
      axes.splice(i, 1)

    }

  }

}

export function addAxisCapsZ(min=(-scale), max=scale) {

  if (settings.axes.axesCaps && settings.axes.zAxis) {

    let minCapZ = newSphere(radius, segments, segments, [0, 0, min], "basic", redThree)
    let maxCapZ = newSphere(radius, segments, segments, [0, 0, max], "basic", greenThree)

    minCapZ.name = "min-cap-z"
    maxCapZ.name = "max-cap-z"

    addAxisCapEvents(minCapZ)
    addAxisCapEvents(maxCapZ)

    axes.push(minCapZ, maxCapZ)
    scene.add(minCapZ, maxCapZ)

  }

}

export function removeAxisCapsZ() {

  for (let i = axes.length - 1; i >= 0; i--) {

    if (axes[i].name.includes("cap") && axes[i].name.includes("-z")) {

      removeAxisCapEvents(axes[i])

      scene.remove(axes[i])
      axes.splice(i, 1)

    }

  }

}

export function addAxisZ(min=(-scale), max=scale) {

  if (settings.axes.zAxis) {

    let axisZ = newLine2([[0, 0, min], [0, 0, max]], "thick", blueThree, 3)

    axisZ.name = "axis-z"

    axes.push(axisZ)
    scene.add(axisZ)

  }

}

export function removeAxisZ() {

  for (let i = axes.length - 1; i >= 0; i--) {

    if (axes[i].name.includes("axis") && axes[i].name.includes("-z")) {

      scene.remove(axes[i])
      axes.splice(i, 1)

    }

  }

}

export function addPlaneXY(min=(-scale), max=scale) {

  if (settings.axes.xyPlane) {

      let setp = settings.axes.xyPlaneStep

      for (let i = setp; i < max; i += setp) {

        let xTickPositive = newLine([[max, i, 0], [min, i, 0]], "basic", blackThree)
        let xTickNegative = newLine([[max, -i, 0], [min, -i, 0]], "basic", blackThree)
        let yTickPositive = newLine([[i, max, 0], [i, min, 0]], "basic", blackThree)
        let yTickNegative = newLine([[-i, max, 0], [-i, min, 0]], "basic", blackThree)

        xTickPositive.name = "tick-xy-x-+-" + setp + ""
        xTickNegative.name = "tick-xy-x---" + setp + ""
        yTickPositive.name = "tick-xy-y-+-" + setp + ""
        yTickNegative.name = "tick-xy-y---" + setp + ""

        axes.push(xTickPositive, xTickNegative, yTickPositive, yTickNegative)
        scene.add(xTickPositive, xTickNegative, yTickPositive, yTickNegative)

      }

      let xTick = newLine([[max, 0, 0], [min, 0, 0]], "basic", blackThree)
      let yTick = newLine([[0, max, 0], [0, min, 0]], "basic", blackThree)

      xTick.name = "tick-xy-x-0"
      yTick.name = "tick-xy-y-0"

      axes.push(xTick, yTick)
      scene.add(xTick, yTick)

  }

}

export function removePlaneXY() {

  for (let i = axes.length - 1; i >= 0; i--) {

    if (axes[i].name.includes("tick") && axes[i].name.includes("-xy-")) {

      scene.remove(axes[i])
      axes.splice(i, 1)

    }

  }

}

export function addPlaneXZ(min=(-scale), max=scale) {

  if (settings.axes.xzPlane) {

    let setp = settings.axes.xzPlaneStep

    for (let i = setp; i < max; i += setp) {

      let xTickPositive = newLine([[max, 0, i], [min, 0, i]], "basic", blackThree)
      let xTickNegative = newLine([[max, 0, -i], [min, 0, -i]], "basic", blackThree)
      let zTickPositive = newLine([[i, 0, max], [i, 0, min]], "basic", blackThree)
      let zTickNegative = newLine([[-i, 0, max], [-i, 0, min]], "basic", blackThree)

      xTickPositive.name = "tick-xz-x-+-" + setp + ""
      xTickNegative.name = "tick-xz-x---" + setp + ""
      zTickPositive.name = "tick-xz-y-+-" + setp + ""
      zTickNegative.name = "tick-xz-y---" + setp + ""

      axes.push(xTickPositive, xTickNegative, zTickPositive, zTickNegative)
      scene.add(xTickPositive, xTickNegative, zTickPositive, zTickNegative)

    }

    let xTick = newLine([[max, 0, 0], [min, 0, 0]], "basic", blackThree)
    let zTick = newLine([[0, 0, max], [0, 0, min]], "basic", blackThree)

    xTick.name = "tick-xz-x-0"
    zTick.name = "tick-xz-y-0"

    axes.push(xTick, zTick)
    scene.add(xTick, zTick)

  }

}

export function removePlaneXZ() {

  for (let i = axes.length - 1; i >= 0; i--) {

    if (axes[i].name.includes("tick") && axes[i].name.includes("-xz-")) {

      scene.remove(axes[i])
      axes.splice(i, 1)

    }

  }

}

export function addPlaneYZ(min=(-scale), max=scale) {

  if (settings.axes.yzPlane) {

    let setp = settings.axes.yzPlaneStep

    for (let i = setp; i < max; i += setp) {

      let yTickPositive = newLine([[0, max, i], [0, min, i]], "basic", blackThree)
      let yTickNegative = newLine([[0, max, -i], [0, min, -i]], "basic", blackThree)
      let zTickPositive = newLine([[0, i, max], [0, i, min]], "basic", blackThree)
      let zTickNegative = newLine([[0, -i, max], [0, -i, min]], "basic", blackThree)

      yTickPositive.name = "tick-yz-x-+-" + setp + ""
      yTickNegative.name = "tick-yz-x---" + setp + ""
      zTickPositive.name = "tick-yz-y-+-" + setp + ""
      zTickNegative.name = "tick-yz-y---" + setp + ""

      axes.push(yTickPositive, yTickNegative, zTickPositive, zTickNegative)
      scene.add(yTickPositive, yTickNegative, zTickPositive, zTickNegative)

    }

    let yTick = newLine([[0, max, 0], [0, min, 0]], "basic", blackThree)
    let zTick = newLine([[0, 0, max], [0, 0, min]], "basic", blackThree)

    yTick.name = "tick-yz-x-0"
    zTick.name = "tick-yz-y-0"

    axes.push(yTick, zTick)
    scene.add(yTick, zTick)

  }

}

export function removePlaneYZ() {

  for (let i = axes.length - 1; i >= 0; i--) {

    if (axes[i].name.includes("tick") && axes[i].name.includes("-yz-")) {

      scene.remove(axes[i])
      axes.splice(i, 1)

    }

  }

}

function addAxisCapEvents(cap) {

  events.addEventListener(cap, "mousemove", function(event) { if (!events.operation.key) $("#canvas").css("cursor", "pointer") })
  events.addEventListener(cap, "mouseout", function(event) { if (!events.operation.key) $("#canvas").css("cursor", "") })

  events.addEventListener(cap, "mousedown", function(event) { event.stopPropagation() })
  events.addEventListener(cap, "mouseup", function(event) { event.stopPropagation() })

  events.addEventListener(cap, "dblclick", function(event) { if (focus(event.target.position)) $("#canvas").css("cursor", "") })
  events.addEventListener(cap, "contextmenu", function(event) { contextMenu("axisCap", cap, event.origDomEvent) })

}

function removeAxisCapEvents(cap) {

  events.removeEventListener(cap, "mousemove")
  events.removeEventListener(cap, "mouseout")

  events.removeEventListener(cap, "mousedown")
  events.removeEventListener(cap, "mouseup")

  events.removeEventListener(cap, "dblclick")
  events.removeEventListener(cap, "contextmenu")

}