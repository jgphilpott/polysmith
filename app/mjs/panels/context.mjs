import {focus} from "../libs/controls/focus.mjs"
import {addMeshPanel} from "./mesh.mjs"

export function addContextPanel() {

  $("#nav, #forkme, #canvas, .panel").mouseover(function() { $("#context-menu.panel").remove() })

}

export function contextMenu(type, element, event) {

  $("body").append("<div id='context-menu' class='panel'></div>")

  let contextMenu = $("#context-menu.panel")

  switch (type) {

    case "mesh":

      contextMenu.append("<p id='open'>Open Panel</p>")
      contextMenu.append("<p id='look'>Look Here</p>")
      contextMenu.append("<p id='remove'>Remove Mesh</p>")

      $("#context-menu.panel #open").click(function() {
        addMeshPanel(element)
      })

      $("#context-menu.panel #look").click(function() {
        focus(element.geometry.boundingSphere.center)
      })

      $("#context-menu.panel #remove").click(function() {

        data.events.removeEventListener(element, "contextmenu")
        data.scene.remove(element)

      })

      break

  }

  $("#context-menu.panel p").click(function() { contextMenu.remove() })

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
