import {addPanelEvents} from "../libs/etc/events.mjs"

export function addMenuPanel() {

  $("body").append("<div id='menu' class='panel'></div>")

  let panel = $("#menu.panel")

  panel.append("<div class='head'><img id='logo' src='/app/imgs/theme/logo.png'><h2 id='name'>Polymaker</h2></div>")

  panel.append("<div id='export-import' class='option'><h4>Export / Import</h4></div>")
  panel.append("<div id='panels' class='option'><h4>Panels</h4></div>")
  panel.append("<div id='settings' class='option'><h4>Settings</h4></div>")

  var client = false

  if (client) {

    panel.append("<div id='profile' class='option opt'><h4>Profile</h4></div>")
    panel.append("<div id='logout' class='option opt'><h4>Logout</h4></div>")

  } else {

    panel.append("<div id='signup' class='option opt'><h4>Sign Up</h4></div>")
    panel.append("<div id='login' class='option opt'><h4>Login</h4></div>")

  }

  $("#nav #menu").click(function() { toggleMenu() })

  $(document).keypress(function(event) {
    if (event.keyCode == 13) { toggleMenu() }
  })

  addPanelEvents(panel)

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
