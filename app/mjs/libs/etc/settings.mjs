export function addSettings() {

  /// Core ///

  data.settings = settings

  /// UI ///

  settings.ui = {}

  let ui = settings.ui

  ui.nav = "black"
  ui.forkme = true

  /// Panels ///

  settings.panels = {}

  let panels = settings.panels

  panels.camera = true
  panels.geometries = false
  panels.menu = false
  panels.meshes = true
  panels.shapes = true

  /// Axes ///

  settings.axes = {}

  let axes = settings.axes

  axes.axesCaps = true

  axes.xyPlane = false
  axes.xzPlane = false
  axes.yzPlane = false

  axes.xyPlaneStep = 10
  axes.xzPlaneStep = 10
  axes.yzPlaneStep = 10

  axes.gridSnap = 1

  /// Controls ///

  settings.controls = {}

  let controls = settings.controls

  controls.flySpeed = 50
  controls.spinSpeed = 50
  controls.dragSpeed = 50
  controls.zoomSpeed = 1000

  controls.zoomMax = 500
  controls.zoomMin = 1

}