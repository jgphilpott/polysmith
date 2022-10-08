addMeshesPanel = ->

    $("body").append "<div id='meshes' class='panel'><img title='Close' class='close' src='/app/imgs/panels/nav/close.png'></div>"

    panel = $("#meshes.panel")

    panel.append "<h3>Meshes</h3>"

    panel.append "<div class='table'><table id='meshes' class='table'><thead><tr></tr></thead><tbody></tbody></table></div>"

    tableHead = panel.find "#meshes.table thead tr"

    tableHead.append "<th><h4>ID</h4></th>"
    tableHead.append "<th><h4>Name</h4></th>"
    tableHead.append "<th><h4>Settings</h4></th>"
    tableHead.append "<th><h4>Lock</h4></th>"
    tableHead.append "<th><h4>Trash</h4></th>"

    panel.append "<p id='none'><b>None</b></p>"

    panel.find("div.table").on "scroll", (event) ->

        panel.find("#meshes.table tbody").css "clip-path", "inset(" + $(this).scrollTop() + "px 0px 0px 0px)"

    tooltips.meshCount = 0

    return panel

updateMeshesPanel = (type, mesh) ->

    panel = $("#meshes.panel")
    table = panel.find "#meshes.table tbody"

    switch type

        when "add"

            meshes.push mesh

            tooltips.meshCount += 1

            panel.find("#none").css "display", "none"
            panel.find("div.table").css "display", "block"

            row = "<tr id=" + mesh.uuid + ">"

            row += "<td><p title='ID' class='id'>" + tooltips.meshCount + "</p></td>"
            row += "<td><p title='Name' class='name'><span class='" + (if mesh.lock == "locked" then "disabled" else "") + "' contenteditable='true'>" + mesh.name + "</span></p></td>"
            row += "<td><img title='Settings' class='settings' src='/app/imgs/panels/tools/toggle/off.png'></td></td>"
            row += "<td><img title='Lock Mesh' class='lock' src='/app/imgs/panels/lock/" + mesh.lock + ".png'></td>"
            row += "<td><img title='Delete Mesh' class='trash " + (if mesh.lock == "locked" then "disabled" else "") + "' src='/app/imgs/panels/tools/trash.png'></td>"

            table.append row + "</tr>"

            tableRow = table.find "tr#" + mesh.uuid + ""

            tableRow.mouseenter((event) ->

                visibleEdgeColor = if mesh.lock == "locked" then redThree else blackThree

                data.composer.outlinePass.visibleEdgeColor.set visibleEdgeColor
                data.composer.outlinePass.selectedObjects = [mesh]

            ).mouseleave (event) ->

                data.composer.outlinePass.selectedObjects = []

            tableRow.find(".name span").keypress (event) -> event.stopPropagation()
            tableRow.find(".name span").keydown (event) -> event.stopPropagation()
            tableRow.find(".name span").keyup (event) -> event.stopPropagation(); if mesh.lock != "locked" then updateMesh(mesh, "name", "meshes", $(this)[0].innerText)

            tableRow.find(".name span").dblclick (event) -> if mesh.lock != "locked" then document.execCommand("selectAll")
            tableRow.find(".name span").mousedown (event) -> event.stopPropagation(); if mesh.lock == "locked" then event.preventDefault()
            tableRow.find(".name span").mouseup (event) -> event.stopPropagation()

            tableRow.find(".name span").blur (event) -> event.stopPropagation(); if mesh.lock != "locked" then updateMesh(mesh, "name", null, $(this)[0].innerText, true)

            tableRow.find(".settings").click ->

                panel = $("#mesh." + mesh.uuid + "")

                if panel.length and panel.css("visibility") == "visible"

                    $(this).attr "src", "/app/imgs/panels/tools/toggle/off.png"

                    panel.css "visibility", "hidden"

                else if panel.length

                    $(this).attr "src", "/app/imgs/panels/tools/toggle/on.png"

                    panel.css "z-index", events.zIndex += 1
                    panel.css "visibility", "visible"

                else

                    $(this).attr "src", "/app/imgs/panels/tools/toggle/on.png"

                    addMeshPanel mesh

            tableRow.find(".lock").click -> updateMesh(mesh, "lock")
            tableRow.find(".trash").click -> if mesh.lock != "locked" then removeMesh(mesh)
            tableRow.find(".settings, .lock, .trash").on "mousedown mouseup", (event) -> event.stopPropagation()

            break

        when "update"

            break

        when "remove"

            $("#mesh." + mesh.uuid + "").remove()
            table.find("tr#" + mesh.uuid + "").remove()

            meshes.filterInPlace (item) -> item.uuid != mesh.uuid

            if meshes.length == 0

                panel.find("#none").css "display", "block"
                panel.find("div.table").css "display", "none"

            break
