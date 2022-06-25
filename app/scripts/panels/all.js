function addPanels() {

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