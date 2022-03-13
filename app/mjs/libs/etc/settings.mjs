export function addSettings() {

  /// Core ///

  data.settings = settings

  /// Panels ///

  settings.panels = {}

  let panels = settings.panels

  panels.camera = false
  panels.geometries = false
  panels.menu = false
  panels.meshes = false
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

  controls.flySpeed = 1
  controls.spinSpeed = 1
  controls.dragSpeed = 10
  controls.zoomSpeed = 1000

  controls.zoomMax = 500
  controls.zoomMin = 1

}