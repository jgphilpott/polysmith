import {focus} from "../libs/controls/focus.mjs"
import {toggleShortcut} from "./shortcuts.mjs"
import {addMeshPanel, addMesh, updateMesh, removeMesh} from "./mesh.mjs"

export function addContextPanel() {

  $("#nav, #forkme, #canvas, .panel").mouseover(function() { $("#context-menu.panel").remove() })

}

export function contextMenu(type, element, event) {

  $("body").append("<div id='context-menu' class='panel'></div>")

  let contextMenu = $("#context-menu.panel")

  switch (type) {

    case "axisCap":

      contextMenu.append("<p id='look'>Look Here</p>")

      contextMenu.find("#look").click(function() { focus({x: element.position.x, y: element.position.y, z: element.position.z}) })

      break

    case "mesh":

      let meshPanel = $("#mesh." + element.uuid + "")
      let meshTableRow = $("#meshes.table tr#" + element.uuid + "")

      contextMenu.append("<h4>Basic</h4>")
      contextMenu.append("<p id='panel'>" + (meshPanel.length && meshPanel.css("visibility") == "visible" ? "Close" : "Open") + " Panel</p>")
      contextMenu.append("<p id='look'>Look Here</p>")

      contextMenu.append("<h4>Mesh</h4>")
      element.lock != "locked" ? contextMenu.append("<p id='join'>Join Mesh</p>") : null
      element.lock != "locked" ? contextMenu.append("<p id='cut'>Cut Mesh</p>") : null
      element.lock != "locked" ? contextMenu.append("<p id='intersect'>Intersect Mesh</p>") : null
      element.lock != "locked" ? contextMenu.append("<p id='remove'>Remove Mesh</p>") : null
      element.lock == "locked" ? contextMenu.append("<p id='lock'>Unlock Mesh</p>") : contextMenu.append("<p id='lock'>Lock Mesh</p>")

      contextMenu.find("#panel").click(function() {

        if (meshPanel.length && meshPanel.css("visibility") == "visible") {

          meshTableRow.find(".settings").attr("src", "/app/imgs/panels/tools/toggle/off.png")

          meshPanel.css("visibility", "hidden")

        } else if (meshPanel.length) {

          meshTableRow.find(".settings").attr("src", "/app/imgs/panels/tools/toggle/on.png")

          meshPanel.css("visibility", "visible")

        } else {

          meshTableRow.find(".settings").attr("src", "/app/imgs/panels/tools/toggle/on.png")

          addMeshPanel(element)

        }

      })

      contextMenu.find("#look").click(function() { focus({x: element.position.x, y: element.position.y, z: element.position.z}) })

      contextMenu.find("#cut").click(function() { updateMesh(element, "operation", "cut", "setup") })
      contextMenu.find("#join").click(function() { updateMesh(element, "operation", "join", "setup") })
      contextMenu.find("#intersect").click(function() { updateMesh(element, "operation", "intersect", "setup") })
      contextMenu.find("#remove").click(function() { removeMesh(element) })
      contextMenu.find("#lock").click(function() { updateMesh(element, "lock") })

      break

    case "shape":

      let shape = $("#shortcuts.panel img#" + element.attr("id") + ".shape")

      contextMenu.append("<p id='add'>Add Mesh</p>")
      shape.css("display") == "none" ? contextMenu.append("<p id='show'>Show Shortcut</p>") : contextMenu.append("<p id='hide'>Hide Shortcut</p>")

      contextMenu.find("#add").click(function() { addMesh(null, {class: element.attr("id")}) })
      contextMenu.find("#show").click(function() { toggleShortcut(element.attr("id")) })
      contextMenu.find("#hide").click(function() { toggleShortcut(element.attr("id")) })

      break

    case "shortcut":

      contextMenu.append("<p id='add'>Add Mesh</p>")
      contextMenu.append("<p id='hide'>Hide Shortcut</p>")

      contextMenu.find("#add").click(function() { addMesh(null, {class: element.attr("id")}) })
      contextMenu.find("#hide").click(function() { toggleShortcut(element.attr("id")) })

      break

  }

  contextMenu.find("p").click(function() {

    contextMenu.remove()

    data.outlinePass.selectedObjects = []

  })

  contextMenu.css("z-index", events.zIndex + 1)

  positionMenu(contextMenu, event)

}

function positionMenu(menu, event) {

  let padding = 5

  let contextMenuWidth = menu.outerWidth()
  let contextMenuHeight = menu.outerHeight()

  if (event.pageX >= window.innerWidth / 2) {
    menu.css("left", event.pageX - contextMenuWidth + padding)
  } else if (event.pageX < window.innerWidth / 2) {
    menu.css("left", event.pageX - padding)
  }

  if (event.pageY >= window.innerHeight / 2) {
    menu.css("top", event.pageY - contextMenuHeight + padding)
  } else if (event.pageY < window.innerHeight / 2) {
    menu.css("top", event.pageY - padding)
  }

}