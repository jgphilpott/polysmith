import {addLine} from "./lines.mjs"
import {black, white, red, green, blue} from "./colors.mjs"

export function addAxes(size=100) {

  let min = -size
  let max = size

  addLine([[max, 0, 0], [min, 0, 0]], red)
  addLine([[0, max, 0], [0, min, 0]], green)
  addLine([[0, 0, max], [0, 0, min]], blue)

}
