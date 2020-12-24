import {addLine} from "./geometries/lines.mjs"
import {addSphere} from "./geometries/spheres.mjs"

import {black, white, red, orange, yellow, green, blue} from "./colors.mjs"

export function addAxes(size=data.scale) {

  data.axes = []

  let min = -size
  let max = size

  addAxisX(min, max)
  addAxisY(min, max)
  addAxisZ(min, max)

}

export function addAxisX(min, max) {

  data.axes.push(addSphere(max / 100, [max, 0, 0], green))
  data.axes.push(addLine([[max, 0, 0], [min, 0, 0]], red))
  data.axes.push(addSphere(max / 100, [min, 0, 0], red))

}

export function addAxisY(min, max) {

  data.axes.push(addSphere(max / 100, [0, max, 0], green))
  data.axes.push(addLine([[0, max, 0], [0, min, 0]], green))
  data.axes.push(addSphere(max / 100, [0, min, 0], red))

}

export function addAxisZ(min, max) {

  data.axes.push(addSphere(max / 100, [0, 0, max], green))
  data.axes.push(addLine([[0, 0, max], [0, 0, min]], blue))
  data.axes.push(addSphere(max / 100, [0, 0, min], red))

}

export function removeAxes() {

  for (let i = 0; i < data.axes.length; i++) {

    data.scene.remove(data.axes[i])

  }

}
