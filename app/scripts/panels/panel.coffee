class Panels

    constructor: ->

        @camera = new CameraPanel()
        @context = new ContextPanel()
        @lights = new LightsPanel()
        @menu = new MenuPanel()
        @meshes = new MeshesPanel()
        @polygen = new PolygenPanel()
        @settings = new SettingsPanel()
        @shapes = new ShapesPanel()
        @shortcuts = new ShortcutsPanel()

    add: ->

        this.camera.add()
        this.lights.add()
        this.menu.add()
        this.meshes.add()
        this.polygen.add()
        this.settings.add()
        this.shapes.add()
        this.shortcuts.add()

    events: (panel) ->

        duration = 1000
        id = panel.attr "id"
        close = panel.find ".close"

        close.click (event) =>

            if id is "mesh"

                this.meshes.hideMeshPanel panel

            else if id is "light"

                this.lights.hideLightPanel panel

            else

                settings.set "panels." + id + ".open", false

        close.on "mousedown mouseup", (event) => event.stopPropagation()

        panel.mouseenter (event) =>

            $("#metabox").css "display", "none"

            panel.css "z-index", events.zIndex += 1

            if id is "mesh"

                mesh = panel.data "mesh"
                visibleEdgeColor = if mesh.getLock() then redThree else blackThree
                composer.outlinePass.visibleEdgeColor.set visibleEdgeColor
                composer.outlinePass.selectedObjects = [mesh]

            else

                composer.outlinePass.selectedObjects = []

            close.animate {opacity: 1}, {duration: duration}
            panel.animate {backgroundColor: grayGlass}, {duration: duration * 3}

        panel.mouseleave (event) =>

            $("#metabox").css "display", "block"

            composer.outlinePass.selectedObjects = []

            close.animate {opacity: 0}, {duration: duration}
            panel.animate {backgroundColor: lightGrayGlass}, {duration: duration * 3}

        if id isnt "mesh"

            if settings.get("panels." + id).open then panel.css("visibility", "visible") else panel.css("visibility", "hidden")

        panel.css "z-index", if events? then events.zIndex else 0

        this.dragable panel

    dragable: (panel) ->

        xOffset = 0
        yOffset = 0

        start = (event) =>

            event.stopPropagation()

            transform = panel.css("transform").replace(/[{()}]/g, "").replace(/[a-zA-Z]/g, "").split(",")

            xOffset = event.clientX - panel.position().left + Number transform[4]
            yOffset = event.clientY - panel.position().top + Number transform[5]

            panel.css "cursor", "grabbing"

            document.onmousemove = drag
            document.onmouseup = stop

        drag = (event) =>

            event.stopPropagation()

            eventX = event.clientX - xOffset
            eventY = event.clientY - yOffset

            panel.css top: eventY, left: eventX

        stop = (event) =>

            event.stopPropagation()

            panel.css "cursor", ""

            document.onmousemove = null
            document.onmouseup = null

        panel.mousedown start
