import {addPanelEvents} from "../libs/etc/events.mjs"

export function addCameraPanel() {

  $("body").append("<div id='camera' class='panel'><img class='close' src='/app/imgs/panels/nav/close.png'></div>")

  let panel = $("#camera.panel")

  panel.append("<img class='camera' src='/app/imgs/panels/main/camera.png'>")

  panel.append("<div id='position'><div class='head'><img class='fold' src='/app/imgs/panels/nav/fold.png'><h4>Position</h4></div><div class='body'></div></div>")
  panel.append("<div id='target'><div class='head'><img class='fold' src='/app/imgs/panels/nav/fold.png'><h4>Target</h4></div><div class='body'></div></div>")
  panel.append("<div id='speed'><div class='head'><img class='fold' src='/app/imgs/panels/nav/fold.png'><h4>Speed</h4></div><div class='body'></div></div>")

  let position = $("#camera.panel #position .body")
  let target = $("#camera.panel #target .body")
  let speed = $("#camera.panel #speed .body")

  let dragSpeed = settings.controls.dragSpeed
  let flySpeed = settings.controls.flySpeed
  let spinSpeed = settings.controls.spinSpeed

  position.append("<span id='position-x'><label><b>X</b> <input type=number step=1 min=" + -(scale * 5) + " max=" + scale * 5 + "><button id='plus'>+</button><button id='minus'>-</button></label></span>")
  position.append("<span id='position-y'><label><b>Y</b> <input type=number step=1 min=" + -(scale * 5) + " max=" + scale * 5 + "><button id='plus'>+</button><button id='minus'>-</button></label></span>")
  position.append("<span id='position-z'><label><b>Z</b> <input type=number step=1 min=" + -(scale * 5) + " max=" + scale * 5 + "><button id='plus'>+</button><button id='minus'>-</button></label></span>")

  target.append("<span id='position-x'><label><b>X</b> <input type=number step=1 min=" + -(scale * 5) + " max=" + scale * 5 + "><button id='plus'>+</button><button id='minus'>-</button></label></span>")
  target.append("<span id='position-y'><label><b>Y</b> <input type=number step=1 min=" + -(scale * 5) + " max=" + scale * 5 + "><button id='plus'>+</button><button id='minus'>-</button></label></span>")
  target.append("<span id='position-z'><label><b>Z</b> <input type=number step=1 min=" + -(scale * 5) + " max=" + scale * 5 + "><button id='plus'>+</button><button id='minus'>-</button></label></span>")

  speed.append("<p>Drag Speed</p>")
  speed.append("<input type='range' id='drag' class='range' min='1' max=" + (dragSpeed * 3) + " value=" + dragSpeed + ">")
  speed.append("<p>Fly Speed</p>")
  speed.append("<input type='range' id='fly' class='range' min='1' max=" + (flySpeed * 3) + " value=" + flySpeed + ">")
  speed.append("<p>Spin Speed</p>")
  speed.append("<input type='range' id='spin' class='range' min='1' max=" + (spinSpeed * 3) + " value=" + spinSpeed + ">")

  $("#camera.panel .fold, #camera.panel h4").click(function(event) {

    let degree = 90
    let duration = 1000

    let id = $(this).parent().parent().attr("id")

    let tool = $("#camera.panel #" + id + "")
    let fold = $("#camera.panel #" + id + " .fold")
    let head = $("#camera.panel #" + id + " .head")
    let body = $("#camera.panel #" + id + " .body")

    if (body.css("display") == "none") {

      body.css("display", "block")
      let height = body.height()
      body.css("display", "none")

      tool.animate({height: height + head.height()}, {duration: duration, queue: false})
      body.css("display", "block")

      rotate(fold, degree, duration)

    } else {

      tool.animate({height: head.height()}, {duration: duration, queue: false})
      body.css("display", "none")

      rotate(fold, 0, duration)

    }

  })

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

  rotate($("#camera.panel #speed .fold"), 90, 0)

  addPanelEvents(panel)

}