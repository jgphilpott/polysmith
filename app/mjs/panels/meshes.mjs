import {addMeshPanel, updateMesh, removeMesh} from "./mesh.mjs"

export function addMeshesPanel() {

  $("body").append("<div id='meshes' class='panel'><img class='close' src='/app/imgs/panels/nav/close.png'></div>")

  let panel = $("#meshes.panel")

  panel.append("<h3>Meshes</h3>")

  panel.append("<div class='table'><table id='meshes' class='table'><thead><tr></tr></thead><tbody></tbody></table></div>")

  let tableHead = panel.find("#meshes.table thead tr")

  tableHead.append("<th><h4>ID</h4></th>")
  tableHead.append("<th><h4>Name</h4></th>")
  tableHead.append("<th><h4>Settings</h4></th>")
  tableHead.append("<th><h4>Lock</h4></th>")
  tableHead.append("<th><h4>Trash</h4></th>")

  panel.append("<p id='none'><b>None</b></p>")

  panel.find("div.table").on("scroll", function(event) {

    panel.find("#meshes.table tbody").css("clip-path", "inset(" + $(this).scrollTop() + "px 0px 0px 0px)")

  })

  tooltips.meshCount = 0

  return panel

}

export function updateMeshesPanel(type, mesh) {

  let panel = $("#meshes.panel")
  let table = panel.find("#meshes.table tbody")

  switch (type) {

    case "add":

      meshes.push(mesh)

      tooltips.meshCount += 1

      panel.find("#none").css("display", "none")
      panel.find("div.table").css("display", "block")

      let row = "<tr id=" + mesh.uuid + ">"

      row += "<td><p title='ID' class='id'>" + tooltips.meshCount + "</p></td>"
      row += "<td><p title='Name' class='name'><span class='" + (mesh.lock == "locked" ? "disabled" : "") + "' contenteditable='true'>" + mesh.name + "</span></p></td>"
      row += "<td><img title='Settings' class='settings' src='/app/imgs/panels/tools/toggle/off.png'></td></td>"
      row += "<td><img title='Lock' class='lock' src='/app/imgs/panels/lock/" + mesh.lock + ".png'></td>"
      row += "<td><img title='Trash' class='trash " + (mesh.lock == "locked" ? "disabled" : "") + "' src='/app/imgs/panels/tools/trash.png'></td>"

      table.append(row + "</tr>")

      let tableRow = table.find("tr#" + mesh.uuid + "")

      tableRow.find(".name span").keypress(function(event) { event.stopPropagation() })
      tableRow.find(".name span").keydown(function(event) { event.stopPropagation() })
      tableRow.find(".name span").keyup(function(event) { event.stopPropagation(); if (mesh.lock != "locked") updateMesh(mesh, "name", "meshes", $(this)[0].innerText) })

      tableRow.find(".name span").dblclick(function(event) { event.stopPropagation(); if (mesh.lock != "locked") document.execCommand("selectAll") })
      tableRow.find(".name span").mousedown(function(event) { event.stopPropagation(); if (mesh.lock == "locked") event.preventDefault() })
      tableRow.find(".name span").mouseup(function(event) { event.stopPropagation() })

      tableRow.find(".name span").blur(function(event) { event.stopPropagation(); if (mesh.lock != "locked") updateMesh(mesh, "name", null, $(this)[0].innerText, true) })

      tableRow.find(".settings").click(function() {

        event.stopPropagation()

        let panel = $("#mesh." + mesh.uuid + "")

        if (panel.length && panel.css("visibility") == "visible") {

          $(this).attr("src", "/app/imgs/panels/tools/toggle/off.png")

          panel.css("visibility", "hidden")

        } else if (panel.length) {

          $(this).attr("src", "/app/imgs/panels/tools/toggle/on.png")

          panel.css("visibility", "visible")

        } else {

          $(this).attr("src", "/app/imgs/panels/tools/toggle/on.png")

          addMeshPanel(mesh)

        }

      })

      tableRow.find(".lock").click(function() { event.stopPropagation(); updateMesh(mesh, "lock") })
      tableRow.find(".trash").click(function() { event.stopPropagation(); if (mesh.lock != "locked") removeMesh(mesh) })
      tableRow.find(".settings, .lock, .trash").mousedown(function(event) { event.stopPropagation() }).mouseup(function(event) { event.stopPropagation() })

      break

    case "update":

      break

    case "remove":

      $("#mesh." + mesh.uuid + "").remove()
      table.find("tr#" + mesh.uuid + "").remove()

      meshes.filterInPlace(item => item.uuid != mesh.uuid)

      if (meshes.length == 0) {

        panel.find("#none").css("display", "block")
        panel.find("div.table").css("display", "none")

      }

      break

  }

}