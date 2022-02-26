import {addCameraPanel} from "./camera.mjs"
import {addContextPanel} from "./context.mjs"
import {addGeometriesPanel} from "./geometries.mjs"
import {addMenuPanel} from "./menu.mjs"
import {addMeshesPanel} from "./meshes.mjs"
import {addShapesPanel} from "./shapes.mjs"

export function addPanels() {

  addCameraPanel()
  addGeometriesPanel()
  addMenuPanel()
  addMeshesPanel()
  addShapesPanel()

  addContextPanel()

}