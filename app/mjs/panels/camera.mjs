export function addCameraPanel() {

  $("body").append("<div id='camera' class='panel'><img class='close' src='/app/imgs/panels/nav/close.png'></div>")

  let panel = $("#camera.panel")

  panel.append("<img class='camera' src='/app/imgs/panels/main/camera.png'>")
  panel.append("<img title='Reset Camera' class='reset' src='/app/imgs/panels/tools/reset.png'>")

  panel.append("<div id='position' class='controls'><div class='head'><img class='fold' src='/app/imgs/panels/nav/fold.png'><h4>Position</h4></div><div class='body'></div></div>")
  panel.append("<div id='target' class='controls'><div class='head'><img class='fold' src='/app/imgs/panels/nav/fold.png'><h4>Target</h4></div><div class='body'></div></div>")
  panel.append("<div id='speed' class='controls'><div class='head'><img class='fold' src='/app/imgs/panels/nav/fold.png'><h4>Speed</h4></div><div class='body'></div></div>")

  panel.find(".fold, h4").click(function(event) {

    event.stopPropagation()

    let controls = $(this).closest(".controls")
    let display = controls.find(".body").css("display")
    let id = controls.attr("id")

    display == "none" ? updateSettings("camera", "open", id) : updateSettings("camera", "open", false)

    fold(this)

  }).mousedown(function(event) { event.stopPropagation() }) .mouseup(function(event) { event.stopPropagation() })

  if (settings.camera.open) {

    let controls = panel.find("#" + settings.camera.open + ".controls")

    controls.find(".body").css("display", "block")

    rotate(controls.find(".fold"), 90, 0)

  }

  let position = panel.find("#position .body")
  let target = panel.find("#target .body")
  let speed = panel.find("#speed .body")

  let holdInterval = null
  let holdTimeout = null

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

  panel.find(".reset").click(function(event) {

    event.stopPropagation()

    speed.find(".slider").slider("value", 25)

    sliderStyle(speed.find("#drag.slider"))
    sliderStyle(speed.find("#fly.slider"))
    sliderStyle(speed.find("#zoom.slider"))

    camera.target = {x: 0, y: 0, z: 0}

    camera.position.set(135, 135, 55)
    camera.lookAt(0, 0, 0)

    updateSettings("camera", "position", camera.position)
    updateSettings("camera", "target", camera.target)

    updateSettings("controls", "dragSpeed", 50)
    updateSettings("controls", "flySpeed", 50)
    updateSettings("controls", "zoomSpeed", 50)

  }).mousedown(function(event) { event.stopPropagation() }).mouseup(function(event) { event.stopPropagation() })

  panel.find("input").keypress(function(event) { event.stopPropagation(); if (event.keyCode == 13) this.blur() })
  panel.find("input").keydown(function(event) { event.stopPropagation() })
  panel.find("input").keyup(function(event) { event.stopPropagation(); updateCamera(this, event) })
  panel.find("input").change(function(event) { event.stopPropagation(); updateCamera(this, event) })

  panel.find("input").dblclick(function(event) { event.stopPropagation(); document.execCommand("selectAll") })
  panel.find("input").mousedown(function(event) { event.stopPropagation() })
  panel.find("input").mouseup(function(event) { event.stopPropagation() })

  panel.find("input").blur(function(event) {

    event.stopPropagation()

    let selection = $(this).parent().attr("id").split("-")[0]

    updateSettings("camera", selection, camera[selection])

  })

  panel.find("button").mousedown(function(event) {

    event.stopPropagation()

    let controller = $(this)

    updateCamera(controller, event)

    holdTimeout = setTimeout(function() {

      holdInterval = setInterval(function() { updateCamera(controller, event) }, 100)

    }, 1000)

  }).mouseup(function(event) {

    this.blur()

    event.stopPropagation()

    clearTimeout(holdTimeout)
    clearInterval(holdInterval)

    let selection = $(this).parent().attr("id").split("-")[0]

    updateSettings("camera", selection, camera[selection])

  })

  function updateCamera(controller, event) {

    let operation = $(controller).attr("id")
    let selection = $(controller).parent().attr("id").split("-")

    let input = $(controller).parent().find("input")

    let step = Number(input.attr("step"))
    let min = Number(input.attr("min"))
    let max = Number(input.attr("max"))

    let position = camera.position
    let target = camera.target

    step = operation == "plus" ? step : operation == "minus" ? -step : 0

    let value = Number(input.val()) + step

    value = value < min ? min : value > max ? max : value

    camera[selection[0]][selection[1]] = value

    position.set(position.x, position.y, position.z)
    camera.lookAt(target.x, target.y, target.z)

    if (event.type != "keyup" || value == min || value == max) input.val(value.toFixed(2))

  }

  return panel

}