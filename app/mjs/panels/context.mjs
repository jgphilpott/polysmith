import {focus} from "../libs/controls/focus.mjs"
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

      $("#context-menu.panel #look").click(function() { focus({x: element.position.x, y: element.position.y, z: element.position.z}) })

      break

    case "geometry":

      let shape = $("#shapes.panel img#" + element.attr("id") + ".shape")

      contextMenu.append("<p id='add'>Add Mesh</p>")
      shape.css("display") == "none" ? contextMenu.append("<p id='show'>Show Shortcut</p>") : contextMenu.append("<p id='hide'>Hide Shortcut</p>")

      $("#context-menu.panel #add").click(function() { addMesh(null, {type: element.attr("id")}) })
      $("#context-menu.panel #show").click(function() { shape.css("display", "block") })
      $("#context-menu.panel #hide").click(function() { shape.css("display", "none") })

      break

    case "mesh":

      contextMenu.append("<h4>Basic</h4>")
      contextMenu.append("<p id='open'>Open Panel</p>")
      contextMenu.append("<p id='look'>Look Here</p>")

      contextMenu.append("<h4>Mesh</h4>")
      element.lock != "locked" ? contextMenu.append("<p id='cut'>Cut Mesh</p>") : null
      element.lock != "locked" ? contextMenu.append("<p id='join'>Join Mesh</p>") : null
      element.lock != "locked" ? contextMenu.append("<p id='intersect'>Intersect Mesh</p>") : null
      element.lock != "locked" ? contextMenu.append("<p id='remove'>Remove Mesh</p>") : null
      element.lock == "locked" ? contextMenu.append("<p id='lock'>Unlock Mesh</p>") : contextMenu.append("<p id='lock'>Lock Mesh</p>")

      $("#context-menu.panel #open").click(function() { addMeshPanel(element) })
      $("#context-menu.panel #look").click(function() { focus({x: element.position.x, y: element.position.y, z: element.position.z}) })

      $("#context-menu.panel #cut").click(function() { updateMesh(element, "operation", "cut", "setup") })
      $("#context-menu.panel #join").click(function() { updateMesh(element, "operation", "join", "setup") })
      $("#context-menu.panel #intersect").click(function() { updateMesh(element, "operation", "intersect", "setup") })
      $("#context-menu.panel #remove").click(function() { removeMesh(element) })
      $("#context-menu.panel #lock").click(function() { updateMesh(element, "lock") })

      break

    case "shape":

      contextMenu.append("<p id='add'>Add Mesh</p>")
      contextMenu.append("<p id='hide'>Hide Shortcut</p>")

      $("#context-menu.panel #add").click(function() { addMesh(null, {type: element.attr("id")}) })
      $("#context-menu.panel #hide").click(function() { element.css("display", "none") })

      break

  }

  $("#context-menu.panel p").click(function() { contextMenu.remove() })

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