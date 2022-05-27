import {focus} from "../controls/focus.mjs"
import {contextMenu} from "../../panels/context.mjs"

import {newLine} from "../geometries/lines.mjs"
import {newLine2} from "../geometries/lines2.mjs"
import {newSphere} from "../geometries/spheres.mjs"

import {black, white} from "../colors/three/grayscale.js"
import {red, orange, yellow, green, blue, purple, pink} from "../colors/three/rainbow.js"

let segments = 25
let radius = scale / 100

export function addAxes() {

  data.axes = axes

  let centroid = newSphere(radius, segments, segments, [0, 0, 0], "basic", black)

  axes.push(centroid)
  scene.add(centroid)

  addAxesEvents(centroid)

  addAxisX()
  addAxisY()
  addAxisZ()

}

export function addAxisX(min=(-scale), max=scale) {

  let maxCap = newSphere(radius, segments, segments, [max, 0, 0], "basic", green)
  let axis = newLine2([[max, 0, 0], [min, 0, 0]], "fat", red, 3)
  let minCap = newSphere(radius, segments, segments, [min, 0, 0], "basic", red)

  axes.push(maxCap, axis, minCap)
  scene.add(maxCap, axis, minCap)

  addAxesEvents(maxCap)
  addAxesEvents(minCap)

}

export function addAxisY(min=(-scale), max=scale) {

  let maxCap = newSphere(radius, segments, segments, [0, max, 0], "basic", green)
  let axis = newLine2([[0, max, 0], [0, min, 0]], "fat", green, 3)
  let minCap = newSphere(radius, segments, segments, [0, min, 0], "basic", red)

  axes.push(maxCap, axis, minCap)
  scene.add(maxCap, axis, minCap)

  addAxesEvents(maxCap)
  addAxesEvents(minCap)

}

export function addAxisZ(min=(-scale), max=scale) {

  let maxCap = newSphere(radius, segments, segments, [0, 0, max], "basic", green)
  let axis = newLine2([[0, 0, max], [0, 0, min]], "fat", blue, 3)
  let minCap = newSphere(radius, segments, segments, [0, 0, min], "basic", red)

  axes.push(maxCap, axis, minCap)
  scene.add(maxCap, axis, minCap)

  addAxesEvents(maxCap)
  addAxesEvents(minCap)

}

export function addPlaneXY(min=(-scale), max=scale) {

  let setp = settings.axes.xyPlaneStep

  scene.add(newLine([[max, 0, 0], [min, 0, 0]], "basic", black))
  scene.add(newLine([[0, max, 0], [0, min, 0]], "basic", black))

  for (let i = setp; i <= max; i += setp) {

    scene.add(newLine([[max, i, 0], [min, i, 0]], "basic", black))
    scene.add(newLine([[max, -i, 0], [min, -i, 0]], "basic", black))

    scene.add(newLine([[i, max, 0], [i, min, 0]], "basic", black))
    scene.add(newLine([[-i, max, 0], [-i, min, 0]], "basic", black))

  }

}

export function addPlaneXZ(min=(-scale), max=scale) {

  let setp = settings.axes.xzPlaneStep

  scene.add(newLine([[max, 0, 0], [min, 0, 0]], "basic", black))
  scene.add(newLine([[0, 0, max], [0, 0, min]], "basic", black))

  for (let i = setp; i <= max; i += setp) {

    scene.add(newLine([[max, 0, i], [min, 0, i]], "basic", black))
    scene.add(newLine([[max, 0, -i], [min, 0, -i]], "basic", black))

    scene.add(newLine([[i, 0, max], [i, 0, min]], "basic", black))
    scene.add(newLine([[-i, 0, max], [-i, 0, min]], "basic", black))

  }

}

export function addPlaneYZ(min=(-scale), max=scale) {

  let setp = settings.axes.yzPlaneStep

  scene.add(newLine([[0, max, 0], [0, min, 0]], "basic", black))
  scene.add(newLine([[0, 0, max], [0, 0, min]], "basic", black))

  for (let i = setp; i <= max; i += setp) {

    scene.add(newLine([[0, max, i], [0, min, i]], "basic", black))
    scene.add(newLine([[0, max, -i], [0, min, -i]], "basic", black))

    scene.add(newLine([[0, i, max], [0, i, min]], "basic", black))
    scene.add(newLine([[0, -i, max], [0, -i, min]], "basic", black))

  }

}

function addAxesEvents(mesh) {

  events.addEventListener(mesh, "mousemove", function(event) { if (!events.operation.key) $("#canvas").css("cursor", "pointer") })
  events.addEventListener(mesh, "mouseout", function(event) { if (!events.operation.key) $("#canvas").css("cursor", "") })

  events.addEventListener(mesh, "mousedown", function(event) { event.stopPropagation() })
  events.addEventListener(mesh, "dblclick", function(event) { if (focus(event.target.position)) $("#canvas").css("cursor", "") })
  events.addEventListener(mesh, "contextmenu", function(event) { contextMenu("axisCap", mesh, event.origDomEvent) })

}

export function removeAxes() {

  for (let i = 0; i < axes.length; i++) {

    if (axes[i].type == "Mesh") {

      events.removeEventListener(axes[i], "mousemove")
      events.removeEventListener(axes[i], "mouseout")

      events.removeEventListener(axes[i], "mousedown")
      events.removeEventListener(axes[i], "dblclick")
      events.removeEventListener(axes[i], "contextmenu")

    }

    scene.remove(axes[i])

  }

}