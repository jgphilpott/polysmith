import {addPanelEvents} from "../libs/etc/events.mjs"

export function addCameraPanel() {

  $("body").append("<div id='camera' class='panel'><h3>Camera</h3></div>")

  let panel = $("#camera.panel")

  panel.append("<img class='close' src='/app/imgs/panels/close.png'>")

  addPanelEvents(panel)

}
