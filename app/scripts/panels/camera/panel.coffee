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

        if display is "none" then settings.setSetting("camera", "open", id) else settings.setSetting("camera", "open", false)

        foldPanel this

    ).on "mousedown mouseup", (event) -> event.stopPropagation()

    if settings.getSetting "camera", "open"

        controls = panel.find "#" + settings.getSetting("camera", "open") + ".controls"

        controls.find(".body").css "display", "block"

        rotate controls.find ".fold", 90, 0

    unit = settings.getSetting "general", "unit"
    scale = settings.getSetting "general", "scale"

    dragSpeed = settings.getSetting "controls", "dragSpeed"
    flySpeed = settings.getSetting "controls", "flySpeed"
    zoomSpeed = settings.getSetting "controls", "zoomSpeed"

    position = panel.find "#position .body"
    target = panel.find "#target .body"
    speed = panel.find "#speed .body"

    cameraPosition = camera.getPosition()
    cameraTarget = camera.getTarget()

    holdInterval = null
    holdTimeout = null

    min = - scale * 5
    max = scale * 5

    position.append "<span id='position-x'><label id='x'>X</label><div class='suffix " + unit[scale] + "'><input type=number step=1 min=" + min + " max=" + max + " value=" + cameraPosition.x.toFixed(2) + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"
    position.append "<span id='position-y'><label id='y'>Y</label><div class='suffix " + unit[scale] + "'><input type=number step=1 min=" + min + " max=" + max + " value=" + cameraPosition.y.toFixed(2) + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"
    position.append "<span id='position-z'><label id='z'>Z</label><div class='suffix " + unit[scale] + "'><input type=number step=1 min=" + min + " max=" + max + " value=" + cameraPosition.z.toFixed(2) + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"

    target.append "<span id='target-x'><label id='x'>X</label><div class='suffix " + unit[scale] + "'><input type=number step=1 min=" + min + " max=" + max + " value=" + cameraTarget.x.toFixed(2) + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"
    target.append "<span id='target-y'><label id='y'>Y</label><div class='suffix " + unit[scale] + "'><input type=number step=1 min=" + min + " max=" + max + " value=" + cameraTarget.y.toFixed(2) + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"
    target.append "<span id='target-z'><label id='z'>Z</label><div class='suffix " + unit[scale] + "'><input type=number step=1 min=" + min + " max=" + max + " value=" + cameraTarget.z.toFixed(2) + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"

    speed.append "<p>Drag Speed</p><div id='drag' class='slider'></div>"
    speed.append "<p>Fly Speed</p><div id='fly' class='slider'></div>"
    speed.append "<p>Zoom Speed</p><div id='zoom' class='slider'></div>"

    speed.find("#drag.slider").slider min: 1, max: 100, value: dragSpeed, start: sliderStart, slide: sliderSlide, stop: sliderStop
    speed.find("#fly.slider").slider min: 1, max: 100, value: flySpeed, start: sliderStart, slide: sliderSlide, stop: sliderStop
    speed.find("#zoom.slider").slider min: 1, max: 100, value: zoomSpeed, start: sliderStart, slide: sliderSlide, stop: sliderStop

    sliderStyle speed.find "#drag.slider"
    sliderStyle speed.find "#fly.slider"
    sliderStyle speed.find "#zoom.slider"

    panel.find(".reset").click((event) ->

        controls = settings.defaultSettings.controls
        target = settings.defaultSettings.camera.target
        position = settings.defaultSettings.camera.position

        settings.setSetting "controls", "dragSpeed", controls.dragSpeed
        settings.setSetting "controls", "flySpeed", controls.flySpeed
        settings.setSetting "controls", "zoomSpeed", controls.zoomSpeed

        speed.find("#drag.slider").slider "value", controls.dragSpeed
        speed.find("#fly.slider").slider "value", controls.flySpeed
        speed.find("#zoom.slider").slider "value", controls.zoomSpeed

        sliderStyle speed.find "#drag.slider"
        sliderStyle speed.find "#fly.slider"
        sliderStyle speed.find "#zoom.slider"

        camera.setPosition position
        camera.setTarget target

    ).on "mousedown mouseup", (event) -> event.stopPropagation()

    panel.find("input").keypress (event) -> event.stopPropagation(); if event.keyCode is 13 then this.blur()
    panel.find("input").keydown (event) -> event.stopPropagation()
    panel.find("input").keyup (event) -> event.stopPropagation(); updateCamera(this, event)
    panel.find("input").change (event) -> event.stopPropagation(); updateCamera(this, event)

    panel.find("input").dblclick (event) -> document.execCommand "selectAll"
    panel.find("input").mousedown (event) -> event.stopPropagation()
    panel.find("input").mouseup (event) -> event.stopPropagation()

    panel.find("input").blur (event) ->

        event.stopPropagation()

        selection = $(this).closest("span").attr("id").split("-")[0]

        settings.setSetting "camera", selection, camera[selection]

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

        settings.setSetting "camera", selection, camera[selection]

    )

    updateCamera = (controller, event) ->

        operation = $(controller).attr "id"
        selection = $(controller).closest("span").attr("id").split "-"

        input = $(controller).parent().find "input"

        step = Number input.attr "step"
        min = Number input.attr "min"
        max = Number input.attr "max"

        position = camera.getPosition()
        target = camera.getTarget()

        step = if operation is "plus" then step else if operation is "minus" then - step else 0

        value = Number(input.val()) + step

        value = if value < min then min else if value > max then max else value

        camera[selection[0]][selection[1]] = value

        camera.setPosition position

        if event.type isnt "keyup" or value is min or value is max

            input.val value.toFixed 2

    return panel
