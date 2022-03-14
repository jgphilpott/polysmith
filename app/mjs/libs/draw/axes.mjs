import {focus} from "../controls/focus.mjs"
import {contextMenu} from "../../panels/context.mjs"

import {newLine} from "../geometries/lines.mjs"
import {newTube} from "../geometries/tubes.mjs"
import {newSphere} from "../geometries/spheres.mjs"

import {black, white} from "../colors/three/grayscale.mjs"
import {red, orange, yellow, green, blue, purple, pink} from "../colors/three/rainbow.mjs"

let segments = 42
let axisWidth = 0.3

export function addAxes() {

  data.axes = axes

  let centroid = newSphere(scale / 100, segments, segments, [0, 0, 0], "standard", black)

  axes.push(centroid)
  scene.add(centroid)

  addAxesEvents(centroid)

  addAxisX()
  addAxisY()
  addAxisZ()

}

export function addAxisX(min=(-scale), max=scale) {

  let maxCap = newSphere(scale / 100, segments, segments, [max, 0, 0], "standard", green)
  let axis = newTube([[max, 0, 0], [min, 0, 0]], axisWidth, segments, 1, false, "standard", red)
  let minCap = newSphere(scale / 100, segments, segments, [min, 0, 0], "standard", red)

  axes.push(maxCap, axis, minCap)
  scene.add(maxCap, axis, minCap)

  addAxesEvents(maxCap)
  addAxesEvents(minCap)

}

export function addAxisY(min=(-scale), max=scale) {

  let maxCap = newSphere(scale / 100, segments, segments, [0, max, 0], "standard", green)
  let axis = newTube([[0, max, 0], [0, min, 0]], axisWidth, segments, 1, false, "standard", green)
  let minCap = newSphere(scale / 100, segments, segments, [0, min, 0], "standard", red)

  axes.push(maxCap, axis, minCap)
  scene.add(maxCap, axis, minCap)

  addAxesEvents(maxCap)
  addAxesEvents(minCap)

}

export function addAxisZ(min=(-scale), max=scale) {

  let maxCap = newSphere(scale / 100, segments, segments, [0, 0, max], "standard", green)
  let axis = newTube([[0, 0, max], [0, 0, min]], axisWidth, segments, 1, false, "standard", blue)
  let minCap = newSphere(scale / 100, segments, segments, [0, 0, min], "standard", red)

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

  events.addEventListener(mesh, "mouseover", function(event) { $("body").css("cursor", "url('app/imgs/icons/cursors/pointer.png'), pointer") })
  events.addEventListener(mesh, "mouseout", function(event) { $("body").css("cursor", "") })

  events.addEventListener(mesh, "dblclick", function(event) { if (focus(event.target.position)) $("body").css("cursor", "") })
  events.addEventListener(mesh, "contextmenu", function(event) { contextMenu("axisCap", mesh, event.origDomEvent) })

}

export function removeAxes() {

  for (let i = 0; i < axes.length; i++) {

    if (axes[i].type == "Mesh") {

      events.removeEventListener(axes[i], "mouseover")
      events.removeEventListener(axes[i], "mouseout")

      events.removeEventListener(axes[i], "dblclick")
      events.removeEventListener(axes[i], "contextmenu")

    }

    scene.remove(axes[i])

  }

}