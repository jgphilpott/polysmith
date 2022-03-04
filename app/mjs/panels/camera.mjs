import {addPanelEvents} from "../libs/etc/events.mjs"

export function addCameraPanel() {

  $("body").append("<div id='camera' class='panel'><img class='close' src='/app/imgs/panels/nav/close.png'></div>")

  let panel = $("#camera.panel")

  panel.append("<img class='camera' src='/app/imgs/panels/main/camera.png'>")

  panel.append("<h4>Drag Speed</h4>")
  panel.append("<input type='range' id='drag' class='range' min='1' max='100' value='50'>")
  panel.append("<h4>Fly Speed</h4>")
  panel.append("<input type='range' id='fly' class='range' min='1' max='100' value='50'>")
  panel.append("<h4>Spin Speed</h4>")
  panel.append("<input type='range' id='spin' class='range' min='1' max='100' value='50'>")

  $(".range").mousedown(function(event) {

    event.stopPropagation()

    $(this).css("cursor", "url('app/imgs/icons/cursors/grabbing.png'), grabbing")

  })

  $(".range").mouseup(function(event) {

    event.stopPropagation()

    $(this).css("cursor", "url('app/imgs/icons/cursors/grab.png'), grab")

  })

  addPanelEvents(panel)

}