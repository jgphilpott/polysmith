import {focus} from "../controls/focus.mjs"
import {addLine} from "../geometries/lines.mjs"
import {addSphere} from "../geometries/spheres.mjs"

import {black, white} from "../colors/grayscale.mjs"
import {red, orange, yellow, green, blue, purple, pink} from "../colors/rainbow.mjs"

function addFocusEvent(obj) {
  data.events.addEventListener(obj, "dblclick", function(event) {
    focus(event.target.position)
  }, false)
}

export function addAxes(size=data.scale) {

  data.axes = []

  let min = -size
  let max = size

  let centroid = addSphere(max / 100, 42, 42, [0, 0, 0], "basic", black)
  data.axes.push(centroid)
  addFocusEvent(centroid)

  addAxisX(min, max)
  addAxisY(min, max)
  addAxisZ(min, max)

}

export function addAxisX(min, max) {

  let maxCap = addSphere(max / 100, 42, 42, [max, 0, 0], "basic", green)
  let axis = addLine([[max, 0, 0], [min, 0, 0]], "basic", red)
  let minCap = addSphere(max / 100, 42, 42, [min, 0, 0], "basic", red)

  data.axes.push(maxCap)
  data.axes.push(axis)
  data.axes.push(minCap)

  addFocusEvent(maxCap)
  addFocusEvent(minCap)

}

export function addAxisY(min, max) {

  let maxCap = addSphere(max / 100, 42, 42, [0, max, 0], "basic", green)
  let axis = addLine([[0, max, 0], [0, min, 0]], "basic", green)
  let minCap = addSphere(max / 100, 42, 42, [0, min, 0], "basic", red)

  data.axes.push(maxCap)
  data.axes.push(axis)
  data.axes.push(minCap)

  addFocusEvent(maxCap)
  addFocusEvent(minCap)

}

export function addAxisZ(min, max) {

  let maxCap = addSphere(max / 100, 42, 42, [0, 0, max], "basic", green)
  let axis = addLine([[0, 0, max], [0, 0, min]], "basic", blue)
  let minCap = addSphere(max / 100, 42, 42, [0, 0, min], "basic", red)

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
