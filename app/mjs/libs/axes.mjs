import {focus} from "./controls.mjs"
import {addLine} from "./geometries/lines.mjs"
import {addSphere} from "./geometries/spheres.mjs"

import {black, white, grayscale} from "./colors/grayscale.mjs"
import {red, orange, yellow, green, blue, purple, pink, rainbow} from "./colors/rainbow.mjs"

function addFocusEvent(obj) {
  data.events.addEventListener(obj, "dblclick", function(event) {
    focus(event.target.position)
  }, false)
}

export function addAxes(size=data.scale) {

  data.axes = []

  let min = -size
  let max = size

  let centroid = addSphere(max / 100, [0, 0, 0], black)
  data.axes.push(centroid)
  addFocusEvent(centroid)

  addAxisX(min, max)
  addAxisY(min, max)
  addAxisZ(min, max)

}

export function addAxisX(min, max) {

  let maxCap = addSphere(max / 100, [max, 0, 0], green)
  let axis = addLine([[max, 0, 0], [min, 0, 0]], red)
  let minCap = addSphere(max / 100, [min, 0, 0], red)

  data.axes.push(maxCap)
  data.axes.push(axis)
  data.axes.push(minCap)

  addFocusEvent(maxCap)
  addFocusEvent(minCap)

}

export function addAxisY(min, max) {

  let maxCap = addSphere(max / 100, [0, max, 0], green)
  let axis = addLine([[0, max, 0], [0, min, 0]], green)
  let minCap = addSphere(max / 100, [0, min, 0], red)

  data.axes.push(maxCap)
  data.axes.push(axis)
  data.axes.push(minCap)

  addFocusEvent(maxCap)
  addFocusEvent(minCap)

}

export function addAxisZ(min, max) {

  let maxCap = addSphere(max / 100, [0, 0, max], green)
  let axis = addLine([[0, 0, max], [0, 0, min]], blue)
  let minCap = addSphere(max / 100, [0, 0, min], red)

  data.axes.push(maxCap)
  data.axes.push(axis)
  data.axes.push(minCap)

  addFocusEvent(maxCap)
  addFocusEvent(minCap)

}

export function removeAxes() {

  for (let i = 0; i < data.axes.length; i++) {

    data.scene.remove(data.axes[i])

  }

}
