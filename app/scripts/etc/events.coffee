class Events extends THREEx.DomEvents

    constructor: ->

        super camera, canvas

        $(window).on "resize", =>

            width = window.innerWidth
            height = window.innerHeight

            camera.setAspect width, height

            renderer.setSize width, height
            composer.setSize width, height

            if grid.axes.x then grid.axes.x.material.resolution.set width, height
            if grid.axes.y then grid.axes.y.material.resolution.set width, height
            if grid.axes.z then grid.axes.z.material.resolution.set width, height

        $("body").on "click contextmenu", =>

            help.setActive false

        $("body").keypress (event) =>

            # Ctrl + Enter
            if event.ctrlKey and event.key is "Enter"

                event.stopPropagation()
                exporter.exportFile "stl"

            # Shift + Enter
            else if event.shiftKey and event.key is "Enter"

                event.stopPropagation()
                exporter.exportFile "obj"

        $("#canvas").mousedown (event) =>

            window.getSelection().removeAllRanges()

            for input in $("input, [contenteditable]")

                if $(input).is ":focus"

                    $(input).blur()

        $("#canvas").click (event) =>

            if not camera.getDragged()

                if this.operation.key then this.clearMeshOperation()
                if tooltips.getSelected() then tooltips.setSelected null

        $("#navbar #title span").on("keypress keydown keyup", (event) => event.stopPropagation()).blur (event) =>

            text = $(event.target)[0].innerText.replace(/[^a-zA-Z0-9-_ ]/g, "").trim()
            title = if text then text else upper data.title

            settings.setSetting "ui", "title", title

            $(event.target).text title

        $("#navbar, #forkme, #help").mouseenter (event) =>

            composer.outlinePass.selectedObjects = []

            $("#metabox").css "display", "none"

        $("#navbar, #forkme, #help").mouseleave (event) =>

            $("#metabox").css "display", "block"

        @operation = mesh: null, key: null

        @zIndex = 1

    clearMeshOperation: ->

        operationIcons = $("#mesh.panel img.operation")

        for icon in operationIcons

            if not $(icon).hasClass "disabled"

                $(icon).attr "src", "/app/imgs/panels/ops/default/" + icon.id + ".png"

        $("#canvas").css "cursor", ""

        this.operation.mesh = null
        this.operation.key = null

    makeDragable: (element, origEvent = null) ->

        xOffset = 0
        yOffset = 0

        dragged = null

        max = scale * 3
        min = -scale * 3

        start = (event) =>

            if element.type is "Mesh" and not element.getLock()

                coordinates = d3$d2 element.position.x, element.position.y, element.position.z

                xOffset = origEvent.clientX - coordinates.x
                yOffset = origEvent.clientY - coordinates.y

                $("#canvas").css "cursor", "grabbing"

            else

                event.stopPropagation()

                if element.hasClass "panel"

                    transform = element.css("transform").replace(/[{()}]/g, "").replace(/[a-zA-Z]/g, "").split(",")

                    xOffset = event.clientX - element.position().left + Number transform[4]
                    yOffset = event.clientY - element.position().top + Number transform[5]

                else if element.hasClass "shape"

                    $("body").append "<img class='ghost-shape' src='" + element.attr("src") + "'>"

                    $(".ghost-shape").css "z-index", this.zIndex + 1

                    xOffset = event.clientX - element.offset().left
                    yOffset = event.clientY - element.offset().top

                $("body").css "cursor", "grabbing"

            document.onmousemove = drag
            document.onmouseup = stop

        drag = (event) =>

            dragged = true

            eventX = event.clientX - xOffset
            eventY = event.clientY - yOffset

            if element.type is "Mesh" and not element.getLock()

                $("#canvas").css "cursor", "grabbing"

                panel = $ "#mesh." + element.uuid + ""

                coordinates = d2$d3 eventX, eventY, element.position.z
                guidelines = settings.getSetting "tooltips", "guidelines"

                coordinates.x = if coordinates.x < min then min else if coordinates.x > max then max else coordinates.x
                coordinates.y = if coordinates.y < min then min else if coordinates.y > max then max else coordinates.y
                coordinates.z = if coordinates.z < min then min else if coordinates.z > max then max else coordinates.z

                if guidelines

                    measurements = settings.getSetting "tooltips", "measurements"

                    for distanceLine in tooltips.distanceLines

                        distanceLine.geometry.dispose()
                        distanceLine.material.dispose()

                        scene.remove distanceLine

                    xColor = if measurements then redThree else blackThree
                    yColor = if measurements then greenThree else blackThree
                    zColor = if measurements then blueThree else blackThree

                    xDistanceLine = new Line vertices: [[0, coordinates.y, coordinates.z], [coordinates.x, coordinates.y, coordinates.z]], material: "dashed", color: xColor
                    yDistanceLine = new Line vertices: [[coordinates.x, 0, coordinates.z], [coordinates.x, coordinates.y, coordinates.z]], material: "dashed", color: yColor
                    zDistanceLine = new Line vertices: [[coordinates.x, coordinates.y, 0], [coordinates.x, coordinates.y, coordinates.z]], material: "dashed", color: zColor

                    tooltips.distanceLines.push xDistanceLine, yDistanceLine, zDistanceLine
                    scene.add xDistanceLine, yDistanceLine, zDistanceLine

                    if measurements

                        $(".measurement.tooltip").remove()

                        unit = settings.getSetting "general", "unit"
                        scale = settings.getSetting "general", "scale"
                        language =settings.getSetting "general", "language"

                        xDistanceLineCenter = getCenterPoint xDistanceLine.geometry.vertices[0], xDistanceLine.geometry.vertices[1]
                        yDistanceLineCenter = getCenterPoint yDistanceLine.geometry.vertices[0], yDistanceLine.geometry.vertices[1]
                        zDistanceLineCenter = getCenterPoint zDistanceLine.geometry.vertices[0], zDistanceLine.geometry.vertices[1]

                        xScreenCoordinates = d3$d2 xDistanceLineCenter.x, xDistanceLineCenter.y, xDistanceLineCenter.z
                        yScreenCoordinates = d3$d2 yDistanceLineCenter.x, yDistanceLineCenter.y, yDistanceLineCenter.z
                        zScreenCoordinates = d3$d2 zDistanceLineCenter.x, zDistanceLineCenter.y, zDistanceLineCenter.z

                        measurements = [{key: "x", value: coordinates.x}, {key: "y", value: coordinates.y}, {key: "z", value: coordinates.z}].sort (a, b) -> Math.abs(a.value) - Math.abs(b.value)

                        for measurement in measurements

                            $("body").append "<div id='" + measurement.key + "' class='measurement tooltip'><p>" + format(measurement.value, "length", unit[scale], 2, 2, language) + "</p></div>"

                        $("body").find("#x.measurement.tooltip").css("left", xScreenCoordinates.x).css("top", xScreenCoordinates.y)
                        $("body").find("#y.measurement.tooltip").css("left", yScreenCoordinates.x).css("top", yScreenCoordinates.y)
                        $("body").find("#z.measurement.tooltip").css("left", zScreenCoordinates.x).css("top", zScreenCoordinates.y)

                panel.find("#position-x input").val coordinates.x.toFixed 2
                panel.find("#position-y input").val coordinates.y.toFixed 2

                composer.outlinePass.visibleEdgeColor.set blackThree
                composer.outlinePass.selectedObjects = [element]

                element.position.x = coordinates.x
                element.position.y = coordinates.y

            else

                event.stopPropagation()

                if element.hasClass "panel"

                    element.css "cursor", "grabbing"
                    element.find("*").css "cursor", "grabbing"

                    element.css top: eventY, left: eventX

                else if element.hasClass "shape"

                    $(".ghost-shape").css "cursor", "grabbing"

                    $(".ghost-shape").css top: eventY, left: eventX

        stop = (event) =>

            if element.type is "Mesh" and not element.getLock()

                if settings.getSetting "tooltips", "guidelines"

                    for distanceLine in tooltips.distanceLines

                        distanceLine.geometry.dispose()
                        distanceLine.material.dispose()

                        scene.remove distanceLine

                    if settings.getSetting "tooltips", "measurements"

                        $(".measurement.tooltip").remove()

                $("#canvas").css "cursor", "grab"

                localStore.updateMesh element

                tooltips.distanceLines = []

            else

                event.stopPropagation()

                $("body").css "cursor", ""

                if element.hasClass "panel"

                    element.css "cursor", ""
                    element.find("*").css "cursor", ""

                else if element.hasClass "shape"

                    ghost = $ ".ghost-shape"

                    if dragged

                        coordinates = d2$d3 ghost.offset().left + (ghost.width() / 2), ghost.offset().top + (ghost.height() / 2), 0

                        x = if coordinates.x < min then min else if coordinates.x > max then max else coordinates.x
                        y = if coordinates.y < min then min else if coordinates.y > max then max else coordinates.y
                        z = if coordinates.z < min then min else if coordinates.z > max then max else coordinates.z

                        mesh = new Mesh element.attr("id"), position: {x: x, y: y, z: z}

                        if element.attr("id") isnt "text" and element.attr("id") isnt "image"

                            composer.outlinePass.visibleEdgeColor.set blackThree
                            composer.outlinePass.selectedObjects = [mesh]

                            $("#canvas").css "cursor", "grab"

                        mesh.add()

                    ghost.remove()

            document.onmousemove = null
            document.onmouseup = null

            dragged = null

        if element.type isnt "Mesh" then element.mousedown start else if not this.operation.key then start() else null
