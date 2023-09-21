class CameraPanel

    constructor: ->

        return this

    add: ->

        template =

            """
            <div id='camera' class='panel'>

                <img title='Close' class='close' src='/app/imgs/panels/nav/close.png'>
                <img title='Camera' class='camera' src='/app/imgs/panels/main/camera.png'>
                <img title='Reset Camera' class='reset' src='/app/imgs/panels/tools/reset.png'>

                <div id='position' class='controls'>

                    <div class='head'>

                        <img title='Fold Position' class='fold' src='/app/imgs/panels/nav/fold.png'>

                        <h4>Position</h4>

                    </div>

                    <div class='body'></div>

                </div>

                <div id='target' class='controls'>

                    <div class='head'>

                        <img title='Fold Target' class='fold' src='/app/imgs/panels/nav/fold.png'>

                        <h4>Target</h4>

                    </div>

                    <div class='body'></div>

                </div>

                <div id='speed' class='controls'>

                    <div class='head'>

                        <img title='Fold Speed' class='fold' src='/app/imgs/panels/nav/fold.png'>

                        <h4>Speed</h4>

                    </div>

                    <div class='body'></div>

                </div>

            </div>
            """

        $("body").append template

        @panel = $("#camera.panel")

        scale = settings.get "scales.scale"
        unit = settings.get "scales.length.unit"
        detail = settings.get "scales.length.detail"

        cameraPosition = settings.get "camera.position"
        cameraTarget = settings.get "camera.target"

        position = vectorAdaptor "convert", "length", cameraPosition
        target = vectorAdaptor "convert", "length", cameraTarget

        @position = this.panel.find "#position .body"
        @target = this.panel.find "#target .body"
        @speed = this.panel.find "#speed .body"

        @buttonInterval = null
        @buttonTimeout = null

        positionTemplate =

            """
            <span id='position-x'>

                <label id='x'>X</label>

                <div class='suffix """ + unit[scale] + """'>

                    <input type=number step=1 value=""" + position.x.toFixed(detail) + """>

                </div>

                <button id='plus'>+</button>
                <button id='minus'>-</button>

            </span>

            <span id='position-y'>

                <label id='y'>Y</label>

                <div class='suffix """ + unit[scale] + """'>

                    <input type=number step=1 value=""" + position.y.toFixed(detail) + """>

                </div>

                <button id='plus'>+</button>
                <button id='minus'>-</button>

            </span>

            <span id='position-z'>

                <label id='z'>Z</label>

                <div class='suffix """ + unit[scale] + """'>

                    <input type=number step=1 value=""" + position.z.toFixed(detail) + """>

                </div>

                <button id='plus'>+</button>
                <button id='minus'>-</button>

            </span>
            """

        targetTemplate =

            """
            <span id='target-x'>

                <label id='x'>X</label>

                <div class='suffix """ + unit[scale] + """'>

                    <input type=number step=1 value=""" + target.x.toFixed(detail) + """>

                </div>

                <button id='plus'>+</button>
                <button id='minus'>-</button>

            </span>

            <span id='target-y'>

                <label id='y'>Y</label>

                <div class='suffix """ + unit[scale] + """'>

                    <input type=number step=1 value=""" + target.y.toFixed(detail) + """>

                </div>

                <button id='plus'>+</button>
                <button id='minus'>-</button>

            </span>

            <span id='target-z'>

                <label id='z'>Z</label>

                <div class='suffix """ + unit[scale] + """'>

                    <input type=number step=1 value=""" + target.z.toFixed(detail) + """>

                </div>

                <button id='plus'>+</button>
                <button id='minus'>-</button>

            </span>
            """

        speedTemplate =

            """
            <p>Drag Speed</p>

            <div id='drag' class='slider'></div>

            <p>Fly Speed</p>

            <div id='fly' class='slider'></div>

            <p>Zoom Speed</p>

            <div id='zoom' class='slider'></div>
            """

        this.position.append positionTemplate
        this.target.append targetTemplate
        this.speed.append speedTemplate

        dragSpeed = settings.get "controls.speed.drag"
        flySpeed = settings.get "controls.speed.fly"
        zoomSpeed = settings.get "controls.speed.zoom"

        @selected = settings.get "panels.camera.selected"

        @drag = new Slider value: dragSpeed, start: this.sliderStart, slide: this.sliderSlide, stop: this.sliderStop, element: this.speed.find "#drag.slider"
        @fly = new Slider value: flySpeed, start: this.sliderStart, slide: this.sliderSlide, stop: this.sliderStop, element: this.speed.find "#fly.slider"
        @zoom = new Slider value: zoomSpeed, start: this.sliderStart, slide: this.sliderSlide, stop: this.sliderStop, element: this.speed.find "#zoom.slider"

        if this.selected

            controls = this.panel.find "#" + this.selected + ".controls"

            controls.find(".body").css "display", "block"
            controls.find(".fold").rotate 90, 0

        this.events()

    remove: ->

        this.panel.remove()

    show: ->

        this.panel.css "visibility", "visible"
        this.panel.css "z-index", events.zIndex += 1

    hide: ->

        this.panel.css "visibility", "hidden"

    events: ->

        panels.events this.panel

        this.panel.find("img.reset").click (event) => this.reset()

        this.panel.find(".fold, h4").click (event) =>

            selection = $(event.target).closest(".controls").attr("id")

            if this.selected isnt selection

                this.selected = selection

            else

                this.selected = null

            settings.set "panels.camera.selected", this.selected

            this.fold this.selected

        this.panel.find(".fold, h4").on "mousedown mouseup", (event) =>

            event.stopPropagation()

        this.panel.find("input").on "keypress keydown keyup change", (event) =>

            this.input event

        this.panel.find("input").on "dblclick mousedown mouseup blur", (event) =>

            this.input event

        this.panel.find("button").on "mousedown mouseup", (event) =>

            this.button event

    fold: (target, duration = 1000) ->

        for control in this.panel.find ".controls"

            control = $(control)

            head = control.find ".head"
            body = control.find ".body"
            fold = control.find ".fold"

            if control.attr("id") is target

                body.css "display", "block"
                height = body.height()
                body.css "display", "none"

                control.animate {height: height + head.height()}, {duration: duration}
                body.css "display", "block"
                fold.rotate 90, duration

            else

                control.animate {height: head.height()}, {duration: duration}
                body.css "display", "none"
                fold.rotate 0, duration

    input: (event) ->

        event.stopPropagation()

        selection = $(event.target).closest(".controls").attr("id")

        if event.type is "keypress" and event.key is "Enter"

            $(event.target).blur()

        else if event.type is "keyup" or event.type is "change"

            if selection is "position"

                x = Number this.position.find("#position-x input").val()
                y = Number this.position.find("#position-y input").val()
                z = Number this.position.find("#position-z input").val()

                camera.setPosition x: x, y: y, z: z

            else if selection is "target"

                x = Number this.target.find("#target-x input").val()
                y = Number this.target.find("#target-y input").val()
                z = Number this.target.find("#target-z input").val()

                camera.setTarget x: x, y: y, z: z

        else if event.type is "blur"

            if selection is "position"

                this.position.find("#position-x input").val this.getPositionX()
                this.position.find("#position-y input").val this.getPositionY()
                this.position.find("#position-z input").val this.getPositionZ()

            else if selection is "target"

                this.target.find("#target-x input").val this.getTargetX()
                this.target.find("#target-y input").val this.getTargetY()
                this.target.find("#target-z input").val this.getTargetZ()

    button: (event) ->

        event.stopPropagation()

        updateCamera = (event) =>

            selection = $(event.target).closest("span")

            value = Number selection.find("input").val()
            detail = settings.get "scales.length.detail"

            control = selection.attr("id").split("-")[0]
            axis = selection.attr("id").split("-")[1]

            step = selection.find("input").attr "step"
            operation = $(event.target).attr "id"

            if operation is "plus"

                value += Number step

            else if operation is "minus"

                value -= Number step

            if control is "position"

                if axis is "x" then camera.setPositionX value, false
                if axis is "y" then camera.setPositionY value, false
                if axis is "z" then camera.setPositionZ value, false

                this.position.find("#position-" + axis + " input").val value.round detail

            else if control is "target"

                if axis is "x" then camera.setTargetX value, false
                if axis is "y" then camera.setTargetY value, false
                if axis is "z" then camera.setTargetZ value, false

                this.target.find("#target-" + axis + " input").val value.round detail

        if event.type is "mousedown"

            updateCamera event

            this.buttonTimeout = setTimeout =>

                this.buttonInterval = setInterval =>

                    updateCamera event

                , 100

            , 1000

            $(event.target).css "font-weight", "bold"

        else if event.type is "mouseup"

            $(event.target).blur()

            clearTimeout this.buttonTimeout
            clearInterval this.buttonInterval

            $(event.target).css "font-weight", "normal"

            camera.setPosition camera.getPosition()
            camera.setTarget camera.getTarget()

    getPosition: ->

        x = clone this.position.find("#position-x input").attr "value"
        y = clone this.position.find("#position-y input").attr "value"
        z = clone this.position.find("#position-z input").attr "value"

        return x: x, y: y, z: z

    setPosition: (position) ->

        detail = settings.get "scales.length.detail"

        this.position.find("#position-x input").attr "value", Number position.x.toFixed detail
        this.position.find("#position-y input").attr "value", Number position.y.toFixed detail
        this.position.find("#position-z input").attr "value", Number position.z.toFixed detail

    getPositionX: ->

        return clone this.position.find("#position-x input").attr "value"

    setPositionX: (x) ->

        detail = settings.get "scales.length.detail"

        this.position.find("#position-x input").attr "value", Number x.toFixed detail

    getPositionY: ->

        return clone this.position.find("#position-y input").attr "value"

    setPositionY: (y) ->

        detail = settings.get "scales.length.detail"

        this.position.find("#position-y input").attr "value", Number y.toFixed detail

    getPositionZ: ->

        return clone this.position.find("#position-z input").attr "value"

    setPositionZ: (z) ->

        detail = settings.get "scales.length.detail"

        this.position.find("#position-z input").attr "value", Number z.toFixed detail

    getTarget: ->

        x = clone this.target.find("#target-x input").attr "value"
        y = clone this.target.find("#target-y input").attr "value"
        z = clone this.target.find("#target-z input").attr "value"

        return x: x, y: y, z: z

    setTarget: (target) ->

        detail = settings.get "scales.length.detail"

        this.target.find("#target-x input").attr "value", Number target.x.toFixed detail
        this.target.find("#target-y input").attr "value", Number target.y.toFixed detail
        this.target.find("#target-z input").attr "value", Number target.z.toFixed detail

    getTargetX: ->

        return clone this.target.find("#target-x input").attr "value"

    setTargetX: (x) ->

        detail = settings.get "scales.length.detail"

        this.target.find("#target-x input").attr "value", Number x.toFixed detail

    getTargetY: ->

        return clone this.target.find("#target-y input").attr "value"

    setTargetY: (y) ->

        detail = settings.get "scales.length.detail"

        this.target.find("#target-y input").attr "value", Number y.toFixed detail

    getTargetZ: ->

        return clone this.target.find("#target-z input").attr "value"

    setTargetZ: (z) ->

        detail = settings.get "scales.length.detail"

        this.target.find("#target-z input").attr "value", Number z.toFixed detail

    getDragSpeed: ->

        return clone this.drag.getValue()

    setDragSpeed: (speed, animate = true, duration = 1000) ->

        if animate

            this.drag.animate speed, duration

        else

            this.drag.setValue speed

    getFlySpeed: ->

        return clone this.fly.getValue()

    setFlySpeed: (speed, animate = true, duration = 1000) ->

        if animate

            this.fly.animate speed, duration

        else

            this.fly.setValue speed

    getZoomSpeed: ->

        return clone this.zoom.getValue()

    setZoomSpeed: (speed, animate = true, duration = 1000) ->

        if animate

            this.zoom.animate speed, duration

        else

            this.zoom.setValue speed

    sliderStart: (event, slider) =>

        $(slider).focus()

        events.slider = true

        event.stopPropagation()

        this.panel.css "cursor", "ew-resize"
        this.panel.find("*").css "cursor", "ew-resize"

    sliderSlide: (event, slider) =>

        event.stopPropagation()

        this[event.target.id].setValue()

        this[event.target.id].fill $(event.target), "#3273f6", "#e6e6e6"

    sliderStop: (event, slider) =>

        $(slider).blur()

        events.slider = false

        event.stopPropagation()

        this.panel.css "cursor", ""
        this.panel.find("*").css "cursor", ""

        this[event.target.id].fill $(event.target)

        controls[event.target.id].setSpeed this[event.target.id].getValue(), false

    reset: (duration = 1000, steps = 100) ->

        this.panel.find("img.reset").rotate 360

        panelDefaults = settings.panels.defaults()
        cameraDefaults = settings.camera.defaults()
        controlsDefaults = settings.controls.defaults()

        controls.drag.setSpeed controlsDefaults.speed.drag
        controls.fly.setSpeed controlsDefaults.speed.fly
        controls.zoom.setSpeed controlsDefaults.speed.zoom

        positionStepX = (camera.getPositionX() - cameraDefaults.position.x) / steps
        positionStepY = (camera.getPositionY() - cameraDefaults.position.y) / steps
        positionStepZ = (camera.getPositionZ() - cameraDefaults.position.z) / steps

        targetStepX = (camera.getTargetX() - cameraDefaults.target.x) / steps
        targetStepY = (camera.getTargetY() - cameraDefaults.target.y) / steps
        targetStepZ = (camera.getTargetZ() - cameraDefaults.target.z) / steps

        updateCamera = =>

            camera.setPositionX camera.getPositionX() - positionStepX
            camera.setPositionY camera.getPositionY() - positionStepY
            camera.setPositionZ camera.getPositionZ() - positionStepZ

            camera.setTargetX camera.getTargetX() - targetStepX
            camera.setTargetY camera.getTargetY() - targetStepY
            camera.setTargetZ camera.getTargetZ() - targetStepZ

        for step in [0...steps]

            setTimeout updateCamera, duration / steps * step

        if this.selected isnt panelDefaults.camera.selected

            this.selected = panelDefaults.camera.selected

            this.fold this.selected
