import {addPanelEvents} from "../libs/etc/events.mjs"

export function addMenuPanel() {

  $("body").append("<div id='menu' class='panel'><img class='close' src='/app/imgs/panels/nav/close.png'></div>")

  let panel = $("#menu.panel")

  var client = false

  function appendMain() {

    let main = "<div id='main' class='sub-panel'>"

    main += "<div class='head'><img id='logo' src='/app/imgs/theme/logo.png'><h2 id='title'>Polymaker</h2></div>"

    main += "<div id='export-import' class='option'><h4>Export / Import</h4></div>"
    main += "<div id='panels' class='option'><h4>Panels</h4></div>"
    main += "<div id='settings' class='option'><h4>Settings</h4></div>"

    if (client) {

      main += "<div id='profile' class='option opt'><h4>Profile</h4></div>"
      main += "<div id='logout' class='option opt'><h4>Logout</h4></div>"

    } else {

      main += "<div id='signup' class='option opt'><h4>Sign Up</h4></div>"
      main += "<div id='login' class='option opt'><h4>Login</h4></div>"

    }

    panel.append(main + "</div>")

  }

  function appendExportImport() {

    let porting = "<div id='export-import-panel' class='sub-panel'><h3 id='title'>Export / Import</h3>"

    panel.append(porting + "</div>")

  }

  function appendPanels() {

    let panels = "<div id='panels-panel' class='sub-panel'><h3 id='title'>Panels</h3>"

    panel.append(panels + "</div>")

  }

  function appendSettings() {

    let settings = "<div id='settings-panel' class='sub-panel'><h3 id='title'>Settings</h3>"

    panel.append(settings + "</div>")

  }

  function appendSignup() {

    let signup = "<div id='panels-panel' class='sub-panel'><h3 id='title'>Signup</h3>"

    panel.append(signup + "</div>")

  }

  function appendProfile() {

    let profile = "<div id='panels-panel' class='sub-panel'><h3 id='title'>Profile</h3>"

    panel.append(profile + "</div>")

  }

  function appendLogin() {

    let login = "<div id='panels-panel' class='sub-panel'><h3 id='title'>Login</h3>"

    panel.append(login + "</div>")

  }

  function appendLogout() {

    let logout = "<div id='panels-panel' class='sub-panel'><h3 id='title'>Logout</h3>"

    panel.append(logout + "</div>")

  }

  appendMain()

  appendExportImport()
  appendPanels()
  appendSettings()

  if (client) {
    appendProfile()
    appendLogout()
  } else {
    appendSignup()
    appendLogin()
  }

  $("#menu.panel .option").click(function(event) {
    console.log(this.id)
  })

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