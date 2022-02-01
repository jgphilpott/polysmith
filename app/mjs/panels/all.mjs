import {addMenuPanel} from "./menu.mjs"

export function addPanels() {

  addMenuPanel()

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
