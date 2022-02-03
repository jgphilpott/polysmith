import {dragable} from "../libs/etc/events.mjs"

export function addMeshPanel(mesh) {

  $("body").append("<div id='mesh' class='panel'></div>")

  let panel = $("#mesh.panel")

  dragable(panel)

}
