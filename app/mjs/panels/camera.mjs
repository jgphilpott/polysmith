import {dragable} from "../libs/etc/events.mjs"

export function addCameraPanel() {

  $("body").append("<div id='camera' class='panel'><h3>Camera</h3></div>")

  let panel = $("#camera.panel")

  dragable(panel)

}
