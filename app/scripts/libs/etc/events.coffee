addEvents = () ->

    events = new THREEx.DomEvents camera, canvas

    events.operation = mesh: null, key: null
    events.zIndex = 1

    $(window).on "resize", () ->

        innerWidth = window.innerWidth
        innerHeight = window.innerHeight

        for axis in axes

            if axis.type == "Line2" then axis.material.resolution.set innerWidth, innerHeight

        renderer.setSize innerWidth, innerHeight
        composer.setSize innerWidth, innerHeight

        camera.aspect = innerWidth / innerHeight
        camera.updateProjectionMatrix()

    $("body").keypress (event) ->

        # Ctrl + Enter
        if event.ctrlKey and (event.keyCode == 13 or event.keyCode == 10)

            event.preventDefault()
            event.stopPropagation()

            exportFile "stl"

        # Shift + Enter
        else if event.shiftKey and event.keyCode == 13

            event.preventDefault()
            event.stopPropagation()

            exportFile "obj"

    $("#navbar #title span").on("keypress keydown keyup", (event) -> event.stopPropagation()).blur (event) ->

        text = $(this)[0].innerText.replace(/[^a-zA-Z0-9-_ ]/g, "").trim()
        title = if text then text else data.title.toUpperCase()

        updateSettings "ui", "title", title

        $(this).text title

    $("#canvas").mousedown((event) ->

        window.getSelection().removeAllRanges()

        for input in $("input, [contenteditable]")

            if $(input).is ":focus" then $(input).blur()

    ).click (event) ->

        if events.operation.key and not camera.dragged then clearMeshOperation()

    $("#navbar, #forkme, #metabox, #help").mouseenter((event) ->

        composer.outlinePass.selectedObjects = []

        $("#metabox").css "display", "none"

    ).mouseleave (event) ->

        $("#metabox").css "display", "block"

    return events

addPanelEvents = (panel) ->

    queue = false
    duration = 1000

    id = panel.attr "id"
    close = panel.find ".close"

    panel.mouseenter((event) ->

        $("#context-menu.panel").remove()
        $("#metabox").css "display", "none"

        panel.css "z-index", events.zIndex += 1

        if id == "mesh"

            mesh = panel.data "mesh"
            visibleEdgeColor = if mesh.lock == "locked" then redThree else blackThree

            composer.outlinePass.visibleEdgeColor.set visibleEdgeColor
            composer.outlinePass.selectedObjects = [mesh]

        else

            composer.outlinePass.selectedObjects = []

        close.animate {opacity: 1}, {duration: duration, queue: queue}
        panel.animate {backgroundColor: grayGlass}, {duration: duration * 3, queue: queue}

    ).mouseleave (event) ->

        $("#metabox").css "display", "block"

        composer.outlinePass.selectedObjects = []

        close.animate {opacity: 0}, {duration: duration, queue: queue}
        panel.animate {backgroundColor: lightGrayGlass}, {duration: duration * 3, queue: queue}

    close.click((event) ->

        if id == "mesh"

            panel.css "visibility", "hidden"

            $("#meshes.table tr#" + panel.data("mesh").uuid + " .settings").attr "src", "/app/imgs/panels/tools/toggle/off.png"

        else

            updateSettings "panels", id, false

    ).on "mousedown mouseup", (event) -> event.stopPropagation()

    if id != "mesh"

        if settings.panels[id] then panel.css "visibility", "visible" else panel.css "visibility", "hidden"

    panel.css "z-index", events.zIndex

    makeDragable panel

    return panel

addMeshEvents = (mesh) ->

    events.addEventListener mesh, "mouseover", (event) ->

        if settings.ui.metabox then drawMetabox "draw", mesh, event.origDomEvent

    events.addEventListener mesh, "mousemove", (event) ->

        if events.operation.key

            if events.operation.mesh.uuid == mesh.uuid then composer.outlinePass.visibleEdgeColor.set redThree else composer.outlinePass.visibleEdgeColor.set greenThree
            if events.operation.mesh.uuid == mesh.uuid then $("#canvas").css "cursor", "not-allowed" else $("#canvas").css "cursor", "copy"


        else

            if mesh.lock == "locked" then composer.outlinePass.visibleEdgeColor.set redThree else composer.outlinePass.visibleEdgeColor.set blackThree
            if mesh.lock == "locked" then $("#canvas").css "cursor", "not-allowed" else $("#canvas").css "cursor", "grab"

        composer.outlinePass.selectedObjects = [mesh]

        if settings.ui.metabox then drawMetabox "update", mesh, event.origDomEvent

    events.addEventListener mesh, "mouseout", (event) ->

        if events.operation.key then $("#canvas").css "cursor", "copy" else $("#canvas").css "cursor", ""

        composer.outlinePass.selectedObjects = []

        eraseMetabox()

    events.addEventListener mesh, "mousedown", (event) ->

        if mesh.lock != "locked" then makeDragable mesh, event.origDomEvent

    events.addEventListener mesh, "click", (event) ->

        updateMesh mesh, "operation", events.operation.key, null, true

    events.addEventListener mesh, "dblclick", (event) ->

        focus x: mesh.position.x, y: mesh.position.y, z: mesh.position.z

    events.addEventListener mesh, "contextmenu", (event) ->

        contextMenu "mesh", mesh, event.origDomEvent

makeDragable = (element, origEvent = null) ->

    xOffset = 0
    yOffset = 0
    dragged = null
    max = scale * 3
    min = - (scale * 3)

    start = (event) ->

        if element.type == "Mesh"

            if element.lock != "locked"

                coordinates = d3$d2 element.position.x, element.position.y, element.position.z

                xOffset = origEvent.clientX - coordinates.x
                yOffset = origEvent.clientY - coordinates.y

                $("#canvas").css "cursor", "grabbing"

                tooltips.distanceLines = []

        else

            event.stopPropagation()

            $("body").css "cursor", "grabbing"

            if element.hasClass "panel"

                transform = element.css("transform").replace(/[{()}]/g, "").replace(/[a-zA-Z]/g, "").split(",")

                xOffset = event.clientX - element.position().left + Number transform[4]
                yOffset = event.clientY - element.position().top + Number transform[5]

            else if element.hasClass "shape"

                $("body").append "<img class='ghost-shape' src='" + element.attr("src") + "'>"

                $(".ghost-shape").css "z-index", events.zIndex + 1

                xOffset = event.clientX - element.offset().left
                yOffset = event.clientY - element.offset().top

        document.onmousemove = drag
        document.onmouseup = stop

    drag = (event) ->

        dragged = true

        eventX = event.clientX - xOffset
        eventY = event.clientY - yOffset

        if element.type == "Mesh"

            if element.lock != "locked"

                $("#canvas").css "cursor", "grabbing"

                panel = $ "#mesh." + element.uuid + ""
                coordinates = d2$d3 eventX, eventY, element.position.z

                coordinates.x = if coordinates.x < min then min else if coordinates.x > max then max else coordinates.x
                coordinates.y = if coordinates.y < min then min else if coordinates.y > max then max else coordinates.y
                coordinates.z = if coordinates.z < min then min else if coordinates.z > max then max else coordinates.z

                if settings.tooltips.guidelines

                    for distanceLine in tooltips.distanceLines

                        scene.remove distanceLine

                    xColor = if settings.tooltips.measurements then redThree else blackThree
                    yColor = if settings.tooltips.measurements then greenThree else blackThree
                    zColor = if settings.tooltips.measurements then blueThree else blackThree

                    xDistanceLine = newLine [[0, coordinates.y, coordinates.z], [coordinates.x, coordinates.y, coordinates.z]], "dashed", xColor
                    yDistanceLine = newLine [[coordinates.x, 0, coordinates.z], [coordinates.x, coordinates.y, coordinates.z]], "dashed", yColor
                    zDistanceLine = newLine [[coordinates.x, coordinates.y, 0], [coordinates.x, coordinates.y, coordinates.z]], "dashed", zColor

                    tooltips.distanceLines.push xDistanceLine, yDistanceLine, zDistanceLine
                    scene.add xDistanceLine, yDistanceLine, zDistanceLine

                    if settings.tooltips.measurements

                        $(".measurement.tooltip").remove()

                        xDistanceLineCenter = getCenterPoint xDistanceLine.geometry.vertices[0], xDistanceLine.geometry.vertices[1]
                        yDistanceLineCenter = getCenterPoint yDistanceLine.geometry.vertices[0], yDistanceLine.geometry.vertices[1]
                        zDistanceLineCenter = getCenterPoint zDistanceLine.geometry.vertices[0], zDistanceLine.geometry.vertices[1]

                        xScreenCoordinates = d3$d2 xDistanceLineCenter.x, xDistanceLineCenter.y, xDistanceLineCenter.z
                        yScreenCoordinates = d3$d2 yDistanceLineCenter.x, yDistanceLineCenter.y, yDistanceLineCenter.z
                        zScreenCoordinates = d3$d2 zDistanceLineCenter.x, zDistanceLineCenter.y, zDistanceLineCenter.z

                        measurements = [{key: "x", value: coordinates.x}, {key: "y", value: coordinates.y}, {key: "z", value: coordinates.z}].sort (a, b) -> Math.abs(a.value) - Math.abs(b.value)

                        for measurement in measurements

                            $("body").append "<div id='" + measurement.key + "' class='measurement tooltip'><p>" + format(measurement.value, "length", settings.general.unit[settings.general.scale], 2, 2, settings.general.language) + "</p></div>"

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

    stop = (event) ->

        if element.type == "Mesh"

            if element.lock != "locked"

                if settings.tooltips.guidelines

                    for distanceLine in tooltips.distanceLines

                        scene.remove distanceLine

                    if settings.tooltips.measurements

                        $(".measurement.tooltip").remove()

                $("#canvas").css "cursor", "grab"

                localMeshes "update", element

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

                    mesh = addMesh null, {name: element.attr("title"), class: element.attr("id"), position: {x: x, y: y, z: z}}

                    composer.outlinePass.visibleEdgeColor.set blackThree
                    composer.outlinePass.selectedObjects = [mesh]

                    $("#canvas").css "cursor", "grab"

                ghost.remove()

        document.onmousemove = null
        document.onmouseup = null

        dragged = null

    if element.type != "Mesh" then element.mousedown start else if not events.operation.key then start() else null
