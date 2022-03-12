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

  data.axes = []

  let centroid = newSphere(data.scale / 100, segments, segments, [0, 0, 0], "standard", black)

  data.axes.push(centroid)
  data.scene.add(centroid)

  addAxesEvents(centroid)

  addAxisX()
  addAxisY()
  addAxisZ()

}

export function addAxisX(min=(-data.scale), max=data.scale) {

  let maxCap = newSphere(data.scale / 100, segments, segments, [max, 0, 0], "standard", green)
  let axis = newTube([[max, 0, 0], [min, 0, 0]], axisWidth, segments, 1, false, "standard", red)
  let minCap = newSphere(data.scale / 100, segments, segments, [min, 0, 0], "standard", red)

  data.axes.push(maxCap, axis, minCap)
  data.scene.add(maxCap, axis, minCap)

  addAxesEvents(maxCap)
  addAxesEvents(minCap)

}

export function addAxisY(min=(-data.scale), max=data.scale) {

  let maxCap = newSphere(data.scale / 100, segments, segments, [0, max, 0], "standard", green)
  let axis = newTube([[0, max, 0], [0, min, 0]], axisWidth, segments, 1, false, "standard", green)
  let minCap = newSphere(data.scale / 100, segments, segments, [0, min, 0], "standard", red)

  data.axes.push(maxCap, axis, minCap)
  data.scene.add(maxCap, axis, minCap)

  addAxesEvents(maxCap)
  addAxesEvents(minCap)

}

export function addAxisZ(min=(-data.scale), max=data.scale) {

  let maxCap = newSphere(data.scale / 100, segments, segments, [0, 0, max], "standard", green)
  let axis = newTube([[0, 0, max], [0, 0, min]], axisWidth, segments, 1, false, "standard", blue)
  let minCap = newSphere(data.scale / 100, segments, segments, [0, 0, min], "standard", red)

  data.axes.push(maxCap, axis, minCap)
  data.scene.add(maxCap, axis, minCap)

  addAxesEvents(maxCap)
  addAxesEvents(minCap)

}

export function addPlaneXY(min=(-data.scale), max=data.scale) {

  let setp = data.settings.axes.xyPlaneStep

  data.scene.add(newLine([[max, 0, 0], [min, 0, 0]], "basic", black))
  data.scene.add(newLine([[0, max, 0], [0, min, 0]], "basic", black))

  for (let i = setp; i <= max; i += setp) {

    data.scene.add(newLine([[max, i, 0], [min, i, 0]], "basic", black))
    data.scene.add(newLine([[max, -i, 0], [min, -i, 0]], "basic", black))

    data.scene.add(newLine([[i, max, 0], [i, min, 0]], "basic", black))
    data.scene.add(newLine([[-i, max, 0], [-i, min, 0]], "basic", black))

  }

}

export function addPlaneXZ(min=(-data.scale), max=data.scale) {

  let setp = data.settings.axes.xzPlaneStep

  data.scene.add(newLine([[max, 0, 0], [min, 0, 0]], "basic", black))
  data.scene.add(newLine([[0, 0, max], [0, 0, min]], "basic", black))

  for (let i = setp; i <= max; i += setp) {

    data.scene.add(newLine([[max, 0, i], [min, 0, i]], "basic", black))
    data.scene.add(newLine([[max, 0, -i], [min, 0, -i]], "basic", black))

    data.scene.add(newLine([[i, 0, max], [i, 0, min]], "basic", black))
    data.scene.add(newLine([[-i, 0, max], [-i, 0, min]], "basic", black))

  }

}

export function addPlaneYZ(min=(-data.scale), max=data.scale) {

  let setp = data.settings.axes.yzPlaneStep

  data.scene.add(newLine([[0, max, 0], [0, min, 0]], "basic", black))
  data.scene.add(newLine([[0, 0, max], [0, 0, min]], "basic", black))

  for (let i = setp; i <= max; i += setp) {

    data.scene.add(newLine([[0, max, i], [0, min, i]], "basic", black))
    data.scene.add(newLine([[0, max, -i], [0, min, -i]], "basic", black))

    data.scene.add(newLine([[0, i, max], [0, i, min]], "basic", black))
    data.scene.add(newLine([[0, -i, max], [0, -i, min]], "basic", black))

  }

}

function addAxesEvents(mesh) {

  data.events.addEventListener(mesh, "mouseover", function(event) { $("body").css("cursor", "url('app/imgs/icons/cursors/pointer.png'), pointer") })
  data.events.addEventListener(mesh, "mouseout", function(event) { $("body").css("cursor", "") })

  data.events.addEventListener(mesh, "dblclick", function(event) { if (focus(event.target.position)) $("body").css("cursor", "") })
  data.events.addEventListener(mesh, "contextmenu", function(event) { contextMenu("axisCap", mesh, event.origDomEvent) })

}

export function removeAxes() {

  for (let i = 0; i < data.axes.length; i++) {

    if (data.axes[i].type == "Mesh") {

      data.events.removeEventListener(data.axes[i], "mouseover")
      data.events.removeEventListener(data.axes[i], "mouseout")

      data.events.removeEventListener(data.axes[i], "dblclick")
      data.events.removeEventListener(data.axes[i], "contextmenu")

    }

    data.scene.remove(data.axes[i])

  }

}