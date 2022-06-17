import {focus} from "../libs/controls/focus.mjs"
import {toggleShortcut} from "./shortcuts.mjs"
import {addMeshPanel, addMesh, updateMesh, removeMesh} from "./mesh.mjs"

export function addContextPanel() {

  $("#navbar, #forkme, #canvas, #metabox, #help").mouseenter(function() { $("#context-menu.panel").remove() })

}

export function contextMenu(type, element, event) {

  $("body").append("<div id='context-menu' class='panel'></div>")

  let panel = $("#context-menu.panel")

  switch (type) {

    case "axisCap":

      panel.append("<p id='look'>Look Here</p>")

      panel.find("#look").click(function() { focus({x: element.position.x, y: element.position.y, z: element.position.z}) })

      break

    case "mesh":

      let meshPanel = $("#mesh." + element.uuid + "")
      let meshTableRow = $("#meshes.table tr#" + element.uuid + "")

      panel.append("<h4>Basic</h4>")
      panel.append("<p id='panel'>" + (meshPanel.length && meshPanel.css("visibility") == "visible" ? "Close" : "Open") + " Panel</p>")
      panel.append("<p id='look'>Look Here</p>")

      panel.append("<h4>Mesh</h4>")
      element.lock != "locked" ? panel.append("<p id='join'>Join Mesh</p>") : null
      element.lock != "locked" ? panel.append("<p id='cut'>Cut Mesh</p>") : null
      element.lock != "locked" ? panel.append("<p id='intersect'>Intersect Mesh</p>") : null
      element.lock != "locked" ? panel.append("<p id='remove'>Remove Mesh</p>") : null
      element.lock != "locked" ? panel.append("<p id='lock'>Lock Mesh</p>") : panel.append("<p id='lock'>Unlock Mesh</p>")

      panel.find("#panel").click(function() {

        if (meshPanel.length && meshPanel.css("visibility") == "visible") {

          meshTableRow.find(".settings").attr("src", "/app/imgs/panels/tools/toggle/off.png")

          meshPanel.css("visibility", "hidden")

        } else if (meshPanel.length && meshPanel.css("visibility") == "hidden") {

          meshTableRow.find(".settings").attr("src", "/app/imgs/panels/tools/toggle/on.png")

          meshPanel.css("visibility", "visible")

        } else {

          meshTableRow.find(".settings").attr("src", "/app/imgs/panels/tools/toggle/on.png")

          addMeshPanel(element)

        }

      })

      panel.find("#look").click(function() { focus({x: element.position.x, y: element.position.y, z: element.position.z}) })
      panel.find("#cut").click(function() { updateMesh(element, "operation", "cut", "setup") })
      panel.find("#join").click(function() { updateMesh(element, "operation", "join", "setup") })
      panel.find("#intersect").click(function() { updateMesh(element, "operation", "intersect", "setup") })
      panel.find("#remove").click(function() { removeMesh(element) })
      panel.find("#lock").click(function() { updateMesh(element, "lock") })

      break

    case "shape":

      let shortcut = $("#shortcuts.panel img#" + element.attr("id") + ".shape")

      panel.append("<p id='add'>Add Mesh</p>")
      shortcut.css("display") == "none" ? panel.append("<p id='show'>Show Shortcut</p>") : panel.append("<p id='hide'>Hide Shortcut</p>")

      panel.find("#add").click(function() { addMesh(null, {name: element.attr("title"), class: element.attr("id")}) })
      panel.find("#show, #hide").click(function() { toggleShortcut(element.attr("id")) })

      break

  }

  panel.find("p").click(function() {

    panel.remove()

    composer.outlinePass.selectedObjects = []

  })

  panel.css("z-index", events.zIndex + 1)

  positionContextMenu(panel, event)

}

function positionContextMenu(panel, event) {

  let padding = 5

  let contextMenuWidth = panel.outerWidth()
  let contextMenuHeight = panel.outerHeight()

  if (event.pageX >= window.innerWidth / 2) {
    panel.css("left", event.pageX - contextMenuWidth + padding)
  } else if (event.pageX < window.innerWidth / 2) {
    panel.css("left", event.pageX - padding)
  }

  if (event.pageY >= window.innerHeight / 2) {
    panel.css("top", event.pageY - contextMenuHeight + padding)
  } else if (event.pageY < window.innerHeight / 2) {
    panel.css("top", event.pageY - padding)
  }

}