import {addCameraPanel} from "./camera.mjs"
import {addContextPanel} from "./context.mjs"
import {addLightsPanel} from "./lights.mjs"
import {addMenuPanel} from "./menu.mjs"
import {addMeshesPanel} from "./meshes.mjs"
import {addSettingsPanel} from "./settings.mjs"
import {addShapesPanel} from "./shapes.mjs"
import {addShortcutPanel} from "./shortcut.mjs"

export function addPanels() {

  addCameraPanel()
  addLightsPanel()
  addMenuPanel()
  addMeshesPanel()
  addSettingsPanel()
  addShapesPanel()
  addShortcutPanel()

  addContextPanel()

}