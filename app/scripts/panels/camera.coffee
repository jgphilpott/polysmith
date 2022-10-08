addCameraPanel = ->

    $("body").append "<div id='camera' class='panel'><img title='Close' class='close' src='/app/imgs/panels/nav/close.png'></div>"

    panel = $("#camera.panel")

    panel.append "<img title='Camera' class='camera' src='/app/imgs/panels/main/camera.png'>"
    panel.append "<img title='Reset Camera' class='reset' src='/app/imgs/panels/tools/reset.png'>"

    panel.append "<div id='position' class='controls'><div class='head'><img title='Fold Position' class='fold' src='/app/imgs/panels/nav/fold.png'><h4>Position</h4></div><div class='body'></div></div>"
    panel.append "<div id='target' class='controls'><div class='head'><img title='Fold Target' class='fold' src='/app/imgs/panels/nav/fold.png'><h4>Target</h4></div><div class='body'></div></div>"
    panel.append "<div id='speed' class='controls'><div class='head'><img title='Fold Speed' class='fold' src='/app/imgs/panels/nav/fold.png'><h4>Speed</h4></div><div class='body'></div></div>"

    panel.find(".fold, h4").click((event) ->

        controls = $(this).closest ".controls"
        display = controls.find(".body").css "display"
        id = controls.attr "id"

        if display == "none" then updateSettings "camera", "open", id else updateSettings "camera", "open", false

        foldPanel this

    ).on "mousedown mouseup", (event) -> event.stopPropagation()

    if settings.camera.open

        controls = panel.find "#" + settings.camera.open + ".controls"

        controls.find(".body").css "display", "block"

        rotate controls.find ".fold", 90, 0

    position = panel.find "#position .body"
    target = panel.find "#target .body"
    speed = panel.find "#speed .body"

    holdInterval = null
    holdTimeout = null

    min = - scale * 5
    max = scale * 5

    position.append "<span id='position-x'><label id='x'>X</label><div class='suffix " + settings.general.unit[settings.general.scale] + "'><input type=number step=1 min=" + min + " max=" + max + " value=" + camera.position.x.toFixed(2) + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"
    position.append "<span id='position-y'><label id='y'>Y</label><div class='suffix " + settings.general.unit[settings.general.scale] + "'><input type=number step=1 min=" + min + " max=" + max + " value=" + camera.position.y.toFixed(2) + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"
    position.append "<span id='position-z'><label id='z'>Z</label><div class='suffix " + settings.general.unit[settings.general.scale] + "'><input type=number step=1 min=" + min + " max=" + max + " value=" + camera.position.z.toFixed(2) + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"

    target.append "<span id='target-x'><label id='x'>X</label><div class='suffix " + settings.general.unit[settings.general.scale] + "'><input type=number step=1 min=" + min + " max=" + max + " value=" + camera.target.x.toFixed(2) + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"
    target.append "<span id='target-y'><label id='y'>Y</label><div class='suffix " + settings.general.unit[settings.general.scale] + "'><input type=number step=1 min=" + min + " max=" + max + " value=" + camera.target.y.toFixed(2) + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"
    target.append "<span id='target-z'><label id='z'>Z</label><div class='suffix " + settings.general.unit[settings.general.scale] + "'><input type=number step=1 min=" + min + " max=" + max + " value=" + camera.target.z.toFixed(2) + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"

    speed.append "<p>Drag Speed</p><div id='drag' class='slider'></div>"
    speed.append "<p>Fly Speed</p><div id='fly' class='slider'></div>"
    speed.append "<p>Zoom Speed</p><div id='zoom' class='slider'></div>"

    speed.find("#drag.slider").slider min: 1, max: 100, value: settings.controls.dragSpeed, start: sliderStart, slide: sliderSlide, stop: sliderStop
    speed.find("#fly.slider").slider min: 1, max: 100, value: settings.controls.flySpeed, start: sliderStart, slide: sliderSlide, stop: sliderStop
    speed.find("#zoom.slider").slider min: 1, max: 100, value: settings.controls.zoomSpeed, start: sliderStart, slide: sliderSlide, stop: sliderStop

    sliderStyle speed.find "#drag.slider"
    sliderStyle speed.find "#fly.slider"
    sliderStyle speed.find "#zoom.slider"

    panel.find(".reset").click((event) ->

        speed.find(".slider").slider "value", 50

        sliderStyle speed.find "#drag.slider"
        sliderStyle speed.find "#fly.slider"
        sliderStyle speed.find "#zoom.slider"

        camera.target = x: 0, y: 0, z: 0

        camera.position.set 135, 135, 55
        camera.lookAt 0, 0, 0

        updateSettings "camera", "position", camera.position
        updateSettings "camera", "target", camera.target

        updateSettings "controls", "dragSpeed", 50
        updateSettings "controls", "flySpeed", 50
        updateSettings "controls", "zoomSpeed", 50

    ).on "mousedown mouseup", (event) -> event.stopPropagation()

    panel.find("input").keypress (event) -> event.stopPropagation(); if event.keyCode == 13 then this.blur()
    panel.find("input").keydown (event) -> event.stopPropagation()
    panel.find("input").keyup (event) -> event.stopPropagation(); updateCamera(this, event)
    panel.find("input").change (event) -> event.stopPropagation(); updateCamera(this, event)

    panel.find("input").dblclick (event) -> document.execCommand "selectAll"
    panel.find("input").mousedown (event) -> event.stopPropagation()
    panel.find("input").mouseup (event) -> event.stopPropagation()

    panel.find("input").blur (event) ->

        event.stopPropagation()

        selection = $(this).closest("span").attr("id").split("-")[0]

        updateSettings "camera", selection, camera[selection]

    panel.find("button").mousedown((event) ->

        event.stopPropagation()

        controller = $ this

        updateCamera controller, event

        holdTimeout = setTimeout ->

            holdInterval = setInterval (-> updateCamera controller, event), 100

        , 1000

    ).mouseup((event) ->

        this.blur()

        event.stopPropagation()

        clearTimeout holdTimeout
        clearInterval holdInterval

        selection = $(this).parent().attr("id").split("-")[0]

        updateSettings "camera", selection, camera[selection]

    )

    updateCamera = (controller, event) ->

        operation = $(controller).attr "id"
        selection = $(controller).parent().attr("id").split "-"

        input = $(controller).parent().find "input"

        step = Number input.attr "step"
        min = Number input.attr "min"
        max = Number input.attr "max"

        position = camera.position
        target = camera.target

        step = if operation == "plus" then step else if operation == "minus" then - step else 0

        value = Number(input.val()) + step

        value = if value < min then min else if value > max then max else value

        camera[selection[0]][selection[1]] = value

        position.set position.x, position.y, position.z
        camera.lookAt target.x, target.y, target.z

        if event.type != "keyup" or value == min or value == max

            input.val value.toFixed 2

    return panel
