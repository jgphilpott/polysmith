import {addPanelEvents} from "../libs/etc/events.mjs"

export function addCameraPanel() {

  $("body").append("<div id='camera' class='panel'><img class='close' src='/app/imgs/panels/nav/close.png'></div>")

  let panel = $("#camera.panel")

  let dragSpeed = settings.controls.dragSpeed
  let flySpeed = settings.controls.flySpeed
  let spinSpeed = settings.controls.spinSpeed

  panel.append("<img class='camera' src='/app/imgs/panels/main/camera.png'>")

  panel.append("<h4>Drag Speed</h4>")
  panel.append("<input type='range' id='drag' class='range' min='1' max=" + (dragSpeed * 3) + " value=" + dragSpeed + ">")
  panel.append("<h4>Fly Speed</h4>")
  panel.append("<input type='range' id='fly' class='range' min='1' max=" + (flySpeed * 3) + " value=" + flySpeed + ">")
  panel.append("<h4>Spin Speed</h4>")
  panel.append("<input type='range' id='spin' class='range' min='1' max=" + (spinSpeed * 3) + " value=" + spinSpeed + ">")

  $(".range").mousedown(function(event) {

    event.stopPropagation()

    $(this).css("cursor", "url('app/imgs/icons/cursors/grabbing.png'), grabbing")

  })

  $(".range").mouseup(function(event) {

    $(this).blur()

    event.stopPropagation()

    settings.controls[this.id + "Speed"] = Number($(this).val())

    $(this).css("cursor", "url('app/imgs/icons/cursors/grab.png'), grab")

  })

  addPanelEvents(panel)

}