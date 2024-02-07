class Events extends THREEx.DomEvents

    constructor: (camera = null, canvas = null) ->

        super camera, canvas

        changeFullScreen = =>

            settings.set "ui.fullscreen", activeFullScreen()

        document.addEventListener "fullscreenchange", changeFullScreen
        document.addEventListener "MSFullscreenChange", changeFullScreen
        document.addEventListener "mozfullscreenchange", changeFullScreen
        document.addEventListener "webkitfullscreenchange", changeFullScreen

        window.onbeforeunload = (event) =>

            # settings.set "ui.fullscreen", false

            document.activeElement.blur()

            return null

        $(window).on "resize", =>

            if page.path() is "/"

                width = window.innerWidth
                height = window.innerHeight

                camera.setAspect width, height

                renderer.setSize width, height
                composer.setSize width, height

                if grid.axes.x then grid.axes.x.material.setResolution width, height
                if grid.axes.y then grid.axes.y.material.setResolution width, height
                if grid.axes.z then grid.axes.z.material.setResolution width, height
                # what about other strokes?

        $(document).keydown (event) =>

            if event.key is "Enter"

                if event.metaKey

                    settings.set "ui.fullscreen", not activeFullScreen()

                else if page.path() is "/"

                    if event.shiftKey

                        exporter.exportFile "obj"

                    else if event.ctrlKey

                        exporter.exportFile "stl"

                    else

                        panels.menu.toggle()

        $("body").on "click contextmenu", =>

            help.setActive false

        $("#canvas").mousedown (event) =>

            window.getSelection().removeAllRanges()

            for input in $("input, [contenteditable]")

                if $(input).is ":focus"

                    $(input).blur()

        $("#canvas").click (event) =>

            if not camera.dragged

                if this.operation.key then this.clearCSG()
                if tooltips.getSelected() then tooltips.setSelected null

        $("#navbar, #forkme, #help").mouseenter (event) =>

            composer.outlinePass.selectedObjects = []

            metabox.hide()

        @operation = mesh: null, key: null

        @zIndex = 1

    clearCSG: ->

        icons = $("#mesh.panel img.operation")

        for icon in icons

            if not $(icon).hasClass "disabled"

                $(icon).attr "src", "/app/imgs/panels/ops/default/" + icon.id + ".png"

        $("#canvas").css "cursor", ""

        this.operation.mesh = null
        this.operation.key = null
