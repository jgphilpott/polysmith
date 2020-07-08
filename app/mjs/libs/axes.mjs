import {addLine} from "./lines.mjs"
import {black, white, red, yellow, green, blue} from "./colors.mjs"

export function addAxes(size=100) {

  let min = -size
  let max = size

  addAxisX(min, max)
  addAxisY(min, max)
  addAxisZ(min, max)

}

export function addAxisX(min, max) {

  addLine([[max, 0, 0], [min, 0, 0]], red)

}

export function addAxisY(min, max) {

  addLine([[0, max, 0], [0, min, 0]], green)

}

export function addAxisZ(min, max) {

  addLine([[0, 0, max], [0, 0, min]], blue)

}
