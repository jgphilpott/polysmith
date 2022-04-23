import {addPanelEvents} from "../libs/etc/events.mjs"

export function addCameraPanel() {

  $("body").append("<div id='camera' class='panel'><img class='close' src='/app/imgs/panels/nav/close.png'></div>")

  let panel = $("#camera.panel")

  panel.append("<img class='camera' src='/app/imgs/panels/main/camera.png'>")
  panel.append("<img class='refresh' src='/app/imgs/panels/tools/refresh.png'>")

  panel.append("<div id='position' class='controls'><div class='head'><img class='fold' src='/app/imgs/panels/nav/fold.png'><h4>Position</h4></div><div class='body'></div></div>")
  panel.append("<div id='target' class='controls'><div class='head'><img class='fold' src='/app/imgs/panels/nav/fold.png'><h4>Target</h4></div><div class='body'></div></div>")
  panel.append("<div id='speed' class='controls'><div class='head'><img class='fold' src='/app/imgs/panels/nav/fold.png'><h4>Speed</h4></div><div class='body'></div></div>")

  panel.find(".fold, h4").click(function(event) { fold(this) })

  let position = panel.find("#position .body")
  let target = panel.find("#target .body")
  let speed = panel.find("#speed .body")

  let min = -scale * 5
  let max = scale * 5

  position.append("<span id='position-x'><label id='x'>X</label><input type=number step=1 min=" + min + " max=" + max + " value=" + camera.position.x.toFixed(2) + "><button id='plus'>+</button><button id='minus'>-</button></span>")
  position.append("<span id='position-y'><label id='y'>Y</label><input type=number step=1 min=" + min + " max=" + max + " value=" + camera.position.y.toFixed(2) + "><button id='plus'>+</button><button id='minus'>-</button></span>")
  position.append("<span id='position-z'><label id='z'>Z</label><input type=number step=1 min=" + min + " max=" + max + " value=" + camera.position.z.toFixed(2) + "><button id='plus'>+</button><button id='minus'>-</button></span>")

  target.append("<span id='target-x'><label id='x'>X</label><input type=number step=1 min=" + min + " max=" + max + " value=" + camera.target.x.toFixed(2) + "><button id='plus'>+</button><button id='minus'>-</button></span>")
  target.append("<span id='target-y'><label id='y'>Y</label><input type=number step=1 min=" + min + " max=" + max + " value=" + camera.target.y.toFixed(2) + "><button id='plus'>+</button><button id='minus'>-</button></span>")
  target.append("<span id='target-z'><label id='z'>Z</label><input type=number step=1 min=" + min + " max=" + max + " value=" + camera.target.z.toFixed(2) + "><button id='plus'>+</button><button id='minus'>-</button></span>")

  speed.append("<p>Drag Speed</p><div id='drag' class='slider'></div>")
  speed.append("<p>Fly Speed</p><div id='fly' class='slider'></div>")
  speed.append("<p>Zoom Speed</p><div id='zoom' class='slider'></div>")

  speed.find("#drag.slider").slider({min: 1, max: 100, value: settings.controls.dragSpeed, start: sliderStart, slide: sliderSlide, stop: sliderStop})
  speed.find("#fly.slider").slider({min: 1, max: 100, value: settings.controls.flySpeed, start: sliderStart, slide: sliderSlide, stop: sliderStop})
  speed.find("#zoom.slider").slider({min: 1, max: 100, value: settings.controls.zoomSpeed, start: sliderStart, slide: sliderSlide, stop: sliderStop})

  sliderStyle(speed.find("#drag.slider"))
  sliderStyle(speed.find("#fly.slider"))
  sliderStyle(speed.find("#zoom.slider"))

  rotate(panel.find("#speed .fold"), 90, 0)

  addPanelEvents(panel)

}