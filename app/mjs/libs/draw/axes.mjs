import {focus} from "../controls/focus.mjs"
import {contextMenu} from "../../panels/context.mjs"

import {newLine} from "../geometries/lines.mjs"
import {newLine2} from "../geometries/lines2.mjs"
import {newSphere} from "../geometries/spheres.mjs"

import {black, white} from "../colors/three/grayscale.js"
import {red, orange, yellow, green, blue, purple, pink} from "../colors/three/rainbow.js"

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

  axes.forEach(axis => {

    if (axis.name.includes("cap")) removeAxisCapEvents(axis)

    scene.remove(axis)

  })

}

export function addAxesCaps(min=(-scale), max=scale) {

  if (settings.axes.xAxis || settings.axes.yAxis || settings.axes.zAxis) {

    let centroid = newSphere(radius, segments, segments, [0, 0, 0], "basic", black)

    centroid.name = "centroid-cap"

    addAxisCapEvents(centroid)

    axes.push(centroid)
    scene.add(centroid)

  }

  if (settings.axes.xAxis) addAxisCapsX(min, max)
  if (settings.axes.yAxis) addAxisCapsY(min, max)
  if (settings.axes.zAxis) addAxisCapsZ(min, max)

}

export function removeAxesCaps() {

  axes.forEach(axis => {

    if (axis.name.includes("cap")) {

      removeAxisCapEvents(axis)
      scene.remove(axis)

    }

  })

}

export function addAxisCapsX(min=(-scale), max=scale) {

  if (settings.axes.xAxis) {

    let minCapX = newSphere(radius, segments, segments, [min, 0, 0], "basic", red)
    let maxCapX = newSphere(radius, segments, segments, [max, 0, 0], "basic", green)

    minCapX.name = "min-cap-x"
    maxCapX.name = "max-cap-x"

    axes.push(minCapX, maxCapX)
    scene.add(minCapX, maxCapX)

    addAxisCapEvents(minCapX)
    addAxisCapEvents(maxCapX)

  }

}

export function removeAxisCapsX() {

  axes.forEach(axis => {

    if (axis.name.includes("cap") && axis.name.includes("-x")) {

      removeAxisCapEvents(axis)
      scene.remove(axis)

    }

  })

}

export function addAxisX(min=(-scale), max=scale) {

  let axisX = newLine2([[min, 0, 0], [max, 0, 0]], "fat", red, 3)

  axes.push(axisX)
  scene.add(axisX)

}

export function removeAxisX() {}

export function addAxisCapsY(min=(-scale), max=scale) {

  if (settings.axes.yAxis) {

    let minCapY = newSphere(radius, segments, segments, [0, min, 0], "basic", red)
    let maxCapY = newSphere(radius, segments, segments, [0, max, 0], "basic", green)

    minCapY.name = "min-cap-y"
    maxCapY.name = "max-cap-y"

    axes.push(minCapY, maxCapY)
    scene.add(minCapY, maxCapY)

    addAxisCapEvents(minCapY)
    addAxisCapEvents(maxCapY)

  }

}

export function removeAxisCapsY() {

  axes.forEach(axis => {

    if (axis.name.includes("cap") && axis.name.includes("-y")) {

      removeAxisCapEvents(axis)
      scene.remove(axis)

    }

  })

}

export function addAxisY(min=(-scale), max=scale) {

  let axisY = newLine2([[0, min, 0], [0, max, 0]], "fat", green, 3)

  axes.push(axisY)
  scene.add(axisY)

}

export function removeAxisY() {}

export function addAxisCapsZ(min=(-scale), max=scale) {

  if (settings.axes.zAxis) {

    let minCapZ = newSphere(radius, segments, segments, [0, 0, min], "basic", red)
    let maxCapZ = newSphere(radius, segments, segments, [0, 0, max], "basic", green)

    minCapZ.name = "min-cap-z"
    maxCapZ.name = "max-cap-z"

    axes.push(minCapZ, maxCapZ)
    scene.add(minCapZ, maxCapZ)

    addAxisCapEvents(minCapZ)
    addAxisCapEvents(maxCapZ)

  }

}

export function removeAxisCapsZ() {

  axes.forEach(axis => {

    if (axis.name.includes("cap") && axis.name.includes("-z")) {

      removeAxisCapEvents(axis)
      scene.remove(axis)

    }

  })

}

export function addAxisZ(min=(-scale), max=scale) {

  let axisZ = newLine2([[0, 0, min], [0, 0, max]], "fat", blue, 3)

  axes.push(axisZ)
  scene.add(axisZ)

}

export function removeAxisZ() {}

export function addPlaneXY(min=(-scale), max=scale) {

  let setp = settings.axes.xyPlaneStep

  let xTick = newLine([[max, 0, 0], [min, 0, 0]], "basic", black)
  let yTick = newLine([[0, max, 0], [0, min, 0]], "basic", black)

  for (let i = setp; i < max; i += setp) {

    let xTickPositive = newLine([[max, i, 0], [min, i, 0]], "basic", black)
    let xTickNegative = newLine([[max, -i, 0], [min, -i, 0]], "basic", black)

    let yTickPositive = newLine([[i, max, 0], [i, min, 0]], "basic", black)
    let yTickNegative = newLine([[-i, max, 0], [-i, min, 0]], "basic", black)

    axes.push(xTickPositive, xTickNegative, yTickPositive, yTickNegative)
    scene.add(xTickPositive, xTickNegative, yTickPositive, yTickNegative)

  }

  axes.push(xTick, yTick)
  scene.add(xTick, yTick)

}

export function removePlaneXY() {}

export function addPlaneXZ(min=(-scale), max=scale) {

  let setp = settings.axes.xzPlaneStep

  let xTick = newLine([[max, 0, 0], [min, 0, 0]], "basic", black)
  let zTick = newLine([[0, 0, max], [0, 0, min]], "basic", black)

  for (let i = setp; i < max; i += setp) {

    let xTickPositive = newLine([[max, 0, i], [min, 0, i]], "basic", black)
    let xTickNegative = newLine([[max, 0, -i], [min, 0, -i]], "basic", black)

    let zTickPositive = newLine([[i, 0, max], [i, 0, min]], "basic", black)
    let zTickNegative = newLine([[-i, 0, max], [-i, 0, min]], "basic", black)

    axes.push(xTickPositive, xTickNegative, zTickPositive, zTickNegative)
    scene.add(xTickPositive, xTickNegative, zTickPositive, zTickNegative)

  }

  axes.push(xTick, zTick)
  scene.add(xTick, zTick)

}

export function removePlaneXZ() {}

export function addPlaneYZ(min=(-scale), max=scale) {

  let setp = settings.axes.yzPlaneStep

  let yTick = newLine([[0, max, 0], [0, min, 0]], "basic", black)
  let zTick = newLine([[0, 0, max], [0, 0, min]], "basic", black)

  for (let i = setp; i < max; i += setp) {

    let yTickPositive = newLine([[0, max, i], [0, min, i]], "basic", black)
    let yTickNegative = newLine([[0, max, -i], [0, min, -i]], "basic", black)

    let zTickPositive = newLine([[0, i, max], [0, i, min]], "basic", black)
    let zTickNegative = newLine([[0, -i, max], [0, -i, min]], "basic", black)

    axes.push(yTickPositive, yTickNegative, zTickPositive, zTickNegative)
    scene.add(yTickPositive, yTickNegative, zTickPositive, zTickNegative)

  }

  axes.push(yTick, zTick)
  scene.add(yTick, zTick)

}

export function removePlaneYZ() {}

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