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

  panels.push(addPanelEvents(addCameraPanel()))
  panels.push(addPanelEvents(addLightsPanel()))
  panels.push(addPanelEvents(addMenuPanel()))
  panels.push(addPanelEvents(addMeshesPanel()))
  panels.push(addPanelEvents(addSettingsPanel()))
  panels.push(addPanelEvents(addShapesPanel()))
  panels.push(addPanelEvents(addShortcutsPanel()))

  addContextPanel()

  return panels

}