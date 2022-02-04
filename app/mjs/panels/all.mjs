import {addContextPanel} from "./context.mjs"
import {addMenuPanel} from "./menu.mjs"
import {addShapesPanel} from "./shapes.mjs"

export function addPanels() {

  addMenuPanel()
  addShapesPanel()

  addContextPanel()

}
