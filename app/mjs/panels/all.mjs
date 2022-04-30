import {addPanelEvents} from "../libs/etc/events.mjs"

import {addCameraPanel} from "./camera.mjs"
import {addContextPanel} from "./context.mjs"
import {addLightsPanel} from "./lights.mjs"
import {addMenuPanel} from "./menu.mjs"
import {addMeshesPanel} from "./meshes.mjs"
import {addSettingsPanel} from "./settings.mjs"
import {addShapesPanel} from "./shapes.mjs"
import {addShortcutsPanel} from "./shortcuts.mjs"

export function addPanels() {

  addPanelEvents(addCameraPanel())
  addPanelEvents(addLightsPanel())
  addPanelEvents(addMenuPanel())
  addPanelEvents(addMeshesPanel())
  addPanelEvents(addSettingsPanel())
  addPanelEvents(addShapesPanel())
  addPanelEvents(addShortcutsPanel())

  addContextPanel()

}