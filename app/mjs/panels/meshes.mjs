import {addPanelEvents} from "../libs/etc/events.mjs"

export function addMeshesPanel() {

  $("body").append("<div id='meshes' class='panel'><h3>Meshes</h3></div>")

  let panel = $("#meshes.panel")

  panel.append("<img class='close' src='/app/imgs/panels/close.png'>")

  addPanelEvents(panel)

}
