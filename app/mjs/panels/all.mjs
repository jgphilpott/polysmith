import {addCameraPanel} from "./camera.mjs"
import {addContextPanel} from "./context.mjs"
import {addMenuPanel} from "./menu.mjs"
import {addMeshesPanel} from "./meshes.mjs"
import {addShapesPanel} from "./shapes.mjs"
import {addShortcutPanel} from "./shortcut.mjs"

export function addPanels() {

  addCameraPanel()
  addMenuPanel()
  addMeshesPanel()
  addShapesPanel()
  addShortcutPanel()

  addContextPanel()

}