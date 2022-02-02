import {addContextPanel} from "./context.mjs"
import {addMenuPanel} from "./menu.mjs"
import {addMeshPanel} from "./mesh.mjs"
import {addShapesPanel} from "./shapes.mjs"

export function addPanels() {

  addMenuPanel()
  addShapesPanel()

  addContextPanel()

}
