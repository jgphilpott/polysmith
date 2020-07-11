import {addLine} from "./lines.mjs"
import {addSphere} from "./spheres.mjs"

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

  data.axes.push(addSphere([max, 0, 0], max / 100, yellow))
  data.axes.push(addLine([[max, 0, 0], [min, 0, 0]], red))
  data.axes.push(addSphere([min, 0, 0], max / 100, black))

}

export function addAxisY(min, max) {

  data.axes.push(addSphere([0, max, 0], max / 100, yellow))
  data.axes.push(addLine([[0, max, 0], [0, min, 0]], green))
  data.axes.push(addSphere([0, min, 0], max / 100, black))

}

export function addAxisZ(min, max) {

  data.axes.push(addSphere([0, 0, max], max / 100, yellow))
  data.axes.push(addLine([[0, 0, max], [0, 0, min]], blue))
  data.axes.push(addSphere([0, 0, min], max / 100, black))

}

export function removeAxes() {

  for (let i = 0; i < data.axes.length; i++) {

    data.scene.remove(data.axes[i])

  }

}
