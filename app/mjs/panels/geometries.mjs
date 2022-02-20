import {addPanelEvents} from "../libs/etc/events.mjs"

export function addGeometriesPanel() {

  $("body").append("<div id='geometries' class='panel'><h3>Geometries</h3></div>")

  let panel = $("#geometries.panel")

  panel.append("<img class='close' src='/app/imgs/panels/close.png'>")

  addPanelEvents(panel)

}
