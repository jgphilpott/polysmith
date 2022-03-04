import {addPanelEvents} from "../libs/etc/events.mjs"

export function addMeshesPanel() {

  $("body").append("<div id='meshes' class='panel'><img class='close' src='/app/imgs/panels/nav/close.png'></div>")

  let panel = $("#meshes.panel")

  panel.append("<h3>Meshes</h3>")

  addPanelEvents(panel)

}