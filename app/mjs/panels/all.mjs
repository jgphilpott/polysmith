import {addMenuPanel} from "./menu.mjs"
import {addMeshPanel} from "./mesh.mjs"
import {addShapesPanel} from "./shapes.mjs"

export function addPanels() {

  addMenuPanel()
  addShapesPanel()

  $("#nav #menu").click(function() { toggleMenu() })

}

function toggleMenu() {

  let menu = $("#menu.panel")

  if (menu.css("visibility") == "hidden") {
    menu.css("visibility", "visible")
  } else if (menu.css("visibility") == "visible") {
    menu.css("visibility", "hidden")
  } else {
    menu.css("visibility", "visible")
  }

}
