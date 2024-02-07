class MeshesPanel

    constructor: ->

        @count = 0

        return this

    add: ->

        $("body").append "<div id='meshes' class='panel'><img title='Close' class='close' src='/app/imgs/panels/nav/close/black.png'></div>"

        @panel = $("#meshes.panel")
        @table = this.panel.find "#meshes.table tbody"

        this.panel.append "<h3>Meshes</h3>"

        this.panel.append "<div class='table'><table id='meshes' class='table'><thead><tr></tr></thead><tbody></tbody></table></div>"

        tableHead = this.panel.find "#meshes.table thead tr"

        tableHead.append "<th><h4>ID</h4></th>"
        tableHead.append "<th><h4>Name</h4></th>"
        tableHead.append "<th><h4>Settings</h4></th>"
        tableHead.append "<th><h4>Lock</h4></th>"
        tableHead.append "<th><h4>Trash</h4></th>"

        this.panel.append "<p id='none'><b>None</b></p>"

        # this.panel.find("div.table").on "scroll", (event) =>

        #     this.table.css "clip-path", "inset(" + $(event.target).scrollTop() + "px 0px 0px 0px)"

        this.panel.find("div.table").on "scroll", (event) ->

            $("#meshes.panel #meshes.table tbody").css "clip-path", "inset(" + $(this).scrollTop() + "px 0px 0px 0px)"

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

    showMeshPanel: ->

        null

    hideMeshPanel: (panel) ->

        panel.css "visibility", "hidden"

        $("#meshes.table tr#" + panel.data("mesh").uuid + " .settings").attr "src", "/app/imgs/panels/tools/toggle/off.png"

    addMesh: (mesh) ->

        panel = $("#meshes.panel")
        table = panel.find "#meshes.table tbody"

        meshes.push mesh

        this.count += 1

        panel.find("#none").css "display", "none"
        panel.find("div.table").css "display", "block"

        row = "<tr id=" + mesh.uuid + ">"

        row += "<td><p title='ID' class='id'>" + this.count + "</p></td>"
        row += "<td><p title='Name' class='name'><span class='" + (if mesh.getLock() then "disabled" else "") + "' contenteditable='true'>" + mesh.name + "</span></p></td>"
        row += "<td><img title='Settings' class='settings' src='/app/imgs/panels/tools/toggle/off.png'></td></td>"
        row += "<td><img title='Lock Mesh' class='lock' src='/app/imgs/panels/lock/" + (if mesh.getLock() then "locked" else "unlocked") + ".png'></td>"
        row += "<td><img title='Delete Mesh' class='trash " + (if mesh.getLock() then "disabled" else "") + "' src='/app/imgs/panels/tools/trash.png'></td>"

        table.append row + "</tr>"

        tableRow = table.find "tr#" + mesh.uuid + ""

        tableRow.mouseenter((event) ->

            visibleEdgeColor = if mesh.getLock() then redThree else blackThree

            composer.outlinePass.visibleEdgeColor.set visibleEdgeColor
            composer.outlinePass.selectedObjects = [mesh]

        ).mouseleave (event) ->

            composer.outlinePass.selectedObjects = []

        tableRow.find(".name span").keypress (event) -> event.stopPropagation()
        tableRow.find(".name span").keydown (event) -> event.stopPropagation()
        tableRow.find(".name span").keyup (event) -> event.stopPropagation(); mesh.setName("meshes", $(this)[0].innerText)

        tableRow.find(".name span").dblclick (event) -> if not mesh.getLock() then document.execCommand("selectAll")
        tableRow.find(".name span").mousedown (event) -> event.stopPropagation(); if mesh.getLock() then event.preventDefault()
        tableRow.find(".name span").mouseup (event) -> event.stopPropagation()

        tableRow.find(".name span").blur (event) -> event.stopPropagation(); mesh.setName(null, $(this)[0].innerText, true)

        tableRow.find(".settings").click ->

            panel = $("#mesh." + mesh.uuid + "")

            if panel.length and panel.css("visibility") is "visible"

                $(this).attr "src", "/app/imgs/panels/tools/toggle/off.png"

                panel.css "visibility", "hidden"

            else if panel.length

                $(this).attr "src", "/app/imgs/panels/tools/toggle/on.png"

                panel.css "z-index", events.zIndex += 1
                panel.css "visibility", "visible"

            else

                $(this).attr "src", "/app/imgs/panels/tools/toggle/on.png"

                # addMeshPanel
                mesh.panel.show()

        tableRow.find(".lock").click -> mesh.toggleLock()
        tableRow.find(".trash").click -> if not mesh.getLock() then mesh.remove()
        tableRow.find(".settings, .lock, .trash").on "mousedown mouseup", (event) -> event.stopPropagation()

    removeMesh: (mesh) ->

        panel = $("#meshes.panel")
        table = panel.find "#meshes.table tbody"

        $("#mesh." + mesh.uuid + "").remove()
        table.find("tr#" + mesh.uuid + "").remove()

        meshes.exclude (item) => item.uuid is mesh.uuid

        if meshes.length is 0

            panel.find("#none").css "display", "block"
            panel.find("div.table").css "display", "none"
