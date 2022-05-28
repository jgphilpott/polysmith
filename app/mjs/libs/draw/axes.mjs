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

  if (settings.axes.axesCaps) {

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

  if (settings.axes.axesCaps && settings.axes.xAxis) {

    let minCapX = newSphere(radius, segments, segments, [min, 0, 0], "basic", red)
    let maxCapX = newSphere(radius, segments, segments, [max, 0, 0], "basic", green)

    minCapX.name = "min-cap-x"
    maxCapX.name = "max-cap-x"

    addAxisCapEvents(minCapX)
    addAxisCapEvents(maxCapX)

    axes.push(minCapX, maxCapX)
    scene.add(minCapX, maxCapX)

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

  if (settings.axes.xAxis) {

    let axisX = newLine2([[min, 0, 0], [max, 0, 0]], "fat", red, 3)

    axisX.name = "axis-x"

    axes.push(axisX)
    scene.add(axisX)

  }

}

export function removeAxisX() {

  axes.forEach(axis => {

    if (axis.name.includes("axis") && axis.name.includes("-x")) scene.remove(axis)

  })

}

export function addAxisCapsY(min=(-scale), max=scale) {

  if (settings.axes.axesCaps && settings.axes.yAxis) {

    let minCapY = newSphere(radius, segments, segments, [0, min, 0], "basic", red)
    let maxCapY = newSphere(radius, segments, segments, [0, max, 0], "basic", green)

    minCapY.name = "min-cap-y"
    maxCapY.name = "max-cap-y"

    addAxisCapEvents(minCapY)
    addAxisCapEvents(maxCapY)

    axes.push(minCapY, maxCapY)
    scene.add(minCapY, maxCapY)

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

  if (settings.axes.yAxis) {

    let axisY = newLine2([[0, min, 0], [0, max, 0]], "fat", green, 3)

    axisY.name = "axis-y"

    axes.push(axisY)
    scene.add(axisY)

  }

}

export function removeAxisY() {

  axes.forEach(axis => {

    if (axis.name.includes("axis") && axis.name.includes("-y")) scene.remove(axis)

  })

}

export function addAxisCapsZ(min=(-scale), max=scale) {

  if (settings.axes.axesCaps && settings.axes.zAxis) {

    let minCapZ = newSphere(radius, segments, segments, [0, 0, min], "basic", red)
    let maxCapZ = newSphere(radius, segments, segments, [0, 0, max], "basic", green)

    minCapZ.name = "min-cap-z"
    maxCapZ.name = "max-cap-z"

    addAxisCapEvents(minCapZ)
    addAxisCapEvents(maxCapZ)

    axes.push(minCapZ, maxCapZ)
    scene.add(minCapZ, maxCapZ)

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

  if (settings.axes.zAxis) {

    let axisZ = newLine2([[0, 0, min], [0, 0, max]], "fat", blue, 3)

    axisZ.name = "axis-z"

    axes.push(axisZ)
    scene.add(axisZ)

  }

}

export function removeAxisZ() {

  axes.forEach(axis => {

    if (axis.name.includes("axis") && axis.name.includes("-z")) scene.remove(axis)

  })

}

export function addPlaneXY(min=(-scale), max=scale) {

  if (settings.axes.xyPlane) {

      let setp = settings.axes.xyPlaneStep

      for (let i = setp; i < max; i += setp) {

        let xTickPositive = newLine([[max, i, 0], [min, i, 0]], "basic", black)
        let xTickNegative = newLine([[max, -i, 0], [min, -i, 0]], "basic", black)
        let yTickPositive = newLine([[i, max, 0], [i, min, 0]], "basic", black)
        let yTickNegative = newLine([[-i, max, 0], [-i, min, 0]], "basic", black)

        xTickPositive.name = "plane-xy-x-+-" + setp + ""
        xTickNegative.name = "plane-xy-x---" + setp + ""
        yTickPositive.name = "plane-xy-y-+-" + setp + ""
        yTickNegative.name = "plane-xy-y---" + setp + ""

        axes.push(xTickPositive, xTickNegative, yTickPositive, yTickNegative)
        scene.add(xTickPositive, xTickNegative, yTickPositive, yTickNegative)

      }

      let xTick = newLine([[max, 0, 0], [min, 0, 0]], "basic", black)
      let yTick = newLine([[0, max, 0], [0, min, 0]], "basic", black)

      xTick.name = "plane-xy-x-0"
      yTick.name = "plane-xy-y-0"

      axes.push(xTick, yTick)
      scene.add(xTick, yTick)

  }

}

export function removePlaneXY() {

  axes.forEach(axis => {

    if (axis.name.includes("plane") && axis.name.includes("-xy-")) scene.remove(axis)

  })

}

export function addPlaneXZ(min=(-scale), max=scale) {

  if (settings.axes.xzPlane) {

    let setp = settings.axes.xzPlaneStep

    for (let i = setp; i < max; i += setp) {

      let xTickPositive = newLine([[max, 0, i], [min, 0, i]], "basic", black)
      let xTickNegative = newLine([[max, 0, -i], [min, 0, -i]], "basic", black)
      let zTickPositive = newLine([[i, 0, max], [i, 0, min]], "basic", black)
      let zTickNegative = newLine([[-i, 0, max], [-i, 0, min]], "basic", black)

      xTickPositive.name = "plane-xz-x-+-" + setp + ""
      xTickNegative.name = "plane-xz-x---" + setp + ""
      zTickPositive.name = "plane-xz-y-+-" + setp + ""
      zTickNegative.name = "plane-xz-y---" + setp + ""

      axes.push(xTickPositive, xTickNegative, zTickPositive, zTickNegative)
      scene.add(xTickPositive, xTickNegative, zTickPositive, zTickNegative)

    }

    let xTick = newLine([[max, 0, 0], [min, 0, 0]], "basic", black)
    let zTick = newLine([[0, 0, max], [0, 0, min]], "basic", black)

    xTick.name = "plane-xz-x-0"
    zTick.name = "plane-xz-y-0"

    axes.push(xTick, zTick)
    scene.add(xTick, zTick)

  }

}

export function removePlaneXZ() {

  axes.forEach(axis => {

    if (axis.name.includes("plane") && axis.name.includes("-xz-")) scene.remove(axis)

  })

}

export function addPlaneYZ(min=(-scale), max=scale) {

  if (settings.axes.yzPlane) {

    let setp = settings.axes.yzPlaneStep

    for (let i = setp; i < max; i += setp) {

      let yTickPositive = newLine([[0, max, i], [0, min, i]], "basic", black)
      let yTickNegative = newLine([[0, max, -i], [0, min, -i]], "basic", black)
      let zTickPositive = newLine([[0, i, max], [0, i, min]], "basic", black)
      let zTickNegative = newLine([[0, -i, max], [0, -i, min]], "basic", black)

      yTickPositive.name = "plane-yz-x-+-" + setp + ""
      yTickNegative.name = "plane-yz-x---" + setp + ""
      zTickPositive.name = "plane-yz-y-+-" + setp + ""
      zTickNegative.name = "plane-yz-y---" + setp + ""

      axes.push(yTickPositive, yTickNegative, zTickPositive, zTickNegative)
      scene.add(yTickPositive, yTickNegative, zTickPositive, zTickNegative)

    }

    let yTick = newLine([[0, max, 0], [0, min, 0]], "basic", black)
    let zTick = newLine([[0, 0, max], [0, 0, min]], "basic", black)

    yTick.name = "plane-yz-x-0"
    zTick.name = "plane-yz-y-0"

    axes.push(yTick, zTick)
    scene.add(yTick, zTick)

  }

}

export function removePlaneYZ() {

  axes.forEach(axis => {

    if (axis.name.includes("plane") && axis.name.includes("-yz-")) scene.remove(axis)

  })

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