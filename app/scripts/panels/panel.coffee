addPanels = ->

    panels.push addPanelEvents addCameraPanel()
    panels.push addPanelEvents addLightsPanel()
    panels.push addPanelEvents addMenuPanel()
    panels.push addPanelEvents addMeshesPanel()
    panels.push addPanelEvents addPolygenPanel()
    panels.push addPanelEvents addSettingsPanel()
    panels.push addPanelEvents addShapesPanel()
    panels.push addPanelEvents addShortcutsPanel()

    addContextPanel()

    return panels

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
            visibleEdgeColor = if mesh.getLock() then redThree else blackThree

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

            settings.setSetting "panels", id, false

    ).on "mousedown mouseup", (event) -> event.stopPropagation()

    if id != "mesh"

        if settings.getSetting("panels", id) then panel.css("visibility", "visible") else panel.css("visibility", "hidden")

    panel.css "z-index", events.zIndex

    makeDragable panel

    return panel
