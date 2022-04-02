import {addPanelEvents} from "../libs/etc/events.mjs"

export function addCameraPanel() {

  $("body").append("<div id='camera' class='panel'><img class='close' src='/app/imgs/panels/nav/close.png'></div>")

  let panel = $("#camera.panel")

  panel.append("<img class='camera' src='/app/imgs/panels/main/camera.png'>")

  panel.append("<div id='position' class='controls'><div class='head'><img class='fold' src='/app/imgs/panels/nav/fold.png'><h4>Position</h4></div><div class='body'></div></div>")
  panel.append("<div id='target' class='controls'><div class='head'><img class='fold' src='/app/imgs/panels/nav/fold.png'><h4>Target</h4></div><div class='body'></div></div>")
  panel.append("<div id='speed' class='controls'><div class='head'><img class='fold' src='/app/imgs/panels/nav/fold.png'><h4>Speed</h4></div><div class='body'></div></div>")

  let position = $("#camera.panel #position .body")
  let target = $("#camera.panel #target .body")
  let speed = $("#camera.panel #speed .body")

  let dragSpeed = settings.controls.dragSpeed
  let flySpeed = settings.controls.flySpeed
  let spinSpeed = settings.controls.spinSpeed

  position.append("<span id='position-x'><label id='x'>X</label> <input type=number step=1 min=" + -(scale * 5) + " max=" + scale * 5 + "><button id='plus'>+</button><button id='minus'>-</button></span>")
  position.append("<span id='position-y'><label id='y'>Y</label> <input type=number step=1 min=" + -(scale * 5) + " max=" + scale * 5 + "><button id='plus'>+</button><button id='minus'>-</button></span>")
  position.append("<span id='position-z'><label id='z'>Z</label> <input type=number step=1 min=" + -(scale * 5) + " max=" + scale * 5 + "><button id='plus'>+</button><button id='minus'>-</button></span>")

  target.append("<span id='position-x'><label id='x'>X</label> <input type=number step=1 min=" + -(scale * 5) + " max=" + scale * 5 + "><button id='plus'>+</button><button id='minus'>-</button></span>")
  target.append("<span id='position-y'><label id='y'>Y</label> <input type=number step=1 min=" + -(scale * 5) + " max=" + scale * 5 + "><button id='plus'>+</button><button id='minus'>-</button></span>")
  target.append("<span id='position-z'><label id='z'>Z</label> <input type=number step=1 min=" + -(scale * 5) + " max=" + scale * 5 + "><button id='plus'>+</button><button id='minus'>-</button></span>")

  speed.append("<p>Drag Speed</p><div id='drag' class='slider'></div>")
  speed.append("<p>Fly Speed</p><div id='fly' class='slider'></div>")
  speed.append("<p>Spin Speed</p><div id='spin' class='slider'></div>")

  $("#drag.slider").slider({min: 1, max: dragSpeed * 3, value: dragSpeed, start: sliderStart, slide: sliderSlide, stop: sliderStop})
  $("#fly.slider").slider({min: 1, max: flySpeed * 3, value: flySpeed, start: sliderStart, slide: sliderSlide, stop: sliderStop})
  $("#spin.slider").slider({min: 1, max: spinSpeed * 3, value: spinSpeed, start: sliderStart, slide: sliderSlide, stop: sliderStop})

  $("#camera.panel .fold, #camera.panel h4").click(function(event) { fold(this) })

  rotate($("#camera.panel #speed .fold"), 90, 0)

  sliderStyle($("#camera.panel .slider"))

  addPanelEvents(panel)

}