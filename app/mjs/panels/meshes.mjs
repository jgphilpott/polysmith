import {dragable} from "../libs/etc/events.mjs"

export function addMeshesPanel() {

  $("body").append("<div id='meshes' class='panel'><h3>Meshes</h3></div>")

  let panel = $("#meshes.panel")

  dragable(panel)

}
