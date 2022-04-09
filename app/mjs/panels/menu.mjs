import {exportFile} from "../libs/files/export.mjs"
import {importFile} from "../libs/files/import.mjs"

import {addPanelEvents} from "../libs/etc/events.mjs"

export function addMenuPanel() {

  $("body").append("<div id='menu' class='panel'><img class='close' src='/app/imgs/panels/nav/close.png'></div>")

  let panel = $("#menu.panel")

  var client = false

  function appendMain() {

    let main = "<div id='main'>"

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

    let porting = "<div id='export-import-panel' class='sub-panel'>"

    porting += "<div><h3>Export</h3></div>"

    porting += "<div id='stl' class='option'><h4>STL<h4></div>"
    porting += "<div id='obj' class='option'><h4>OBJ<h4></div>"

    porting += "<div><h3>Import</h3></div>"

    porting += "<input id='file' type='file' accept='.obj, .ply, .stl' multiple>"
    porting += "<div id='import' class='option'><h4>Choose File</h4></div>"

    panel.append(porting + "</div>")

    $("#stl, #obj").click(function() { exportFile(this.id) })

    $("#file").on("change", function() { importFiles(this) })
    $("#import").click(function() { $("#file").trigger("click") })

    function importFiles(input) {

      if (input.files && input.files[0]) {

        for (let i = 0; i < input.files.length; i++) {

          let reader = new FileReader()

          reader.readAsDataURL(input.files[i])

          let extension = input.files[i].name.match(/\.[0-9a-z]+$/i)[0].substring(1)

          reader.onload = function (event) { importFile(extension, event.target.result) }

        }

      }

    }

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

    let signup = "<div id='signup-panel' class='sub-panel'><h3 id='title'>Signup</h3>"

    signup += "<input id='email' type='email' placeholder='Email'>"
    signup += "<input id='password' type='password' placeholder='Password'>"
    signup += "<input id='retype-password' type='password' placeholder='Retype Password'>"

    signup += "<input id='submit' type='submit' placeholder='Submit'>"

    panel.append(signup + "</div>")

  }

  function appendProfile() {

    let profile = "<div id='profile-panel' class='sub-panel'><h3 id='title'>Profile</h3>"

    panel.append(profile + "</div>")

  }

  function appendLogin() {

    let login = "<div id='login-panel' class='sub-panel'><h3 id='title'>Login</h3>"

    login += "<input id='email' type='email' placeholder='Email'>"
    login += "<input id='password' type='password' placeholder='Password'>"

    login += "<input id='submit' type='submit' placeholder='Submit'>"

    panel.append(login + "</div>")

  }

  function appendLogout() {

    let logout = "<div id='logout-panel' class='sub-panel'><h3 id='title'>Logout</h3>"

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

  let menuWidth = panel.outerWidth()
  let menuHeight = panel.outerHeight()

  function toggleSubPanel(subPanel, duration=1000) {

    if (subPanel.css("display") == "none") {

      $(".sub-panel").css("display", "none")

      subPanel.css("display", "inline-block")
      let panelWidth = subPanel.outerWidth() + 1
      subPanel.css("display", "none")

      panel.animate({width: menuWidth + panelWidth}, {duration: duration, queue: false})
      panel.animate({height: menuHeight}, {duration: duration, queue: false})

      subPanel.css("display", "inline-block")

    } else {

      subPanel.css("display", "none")

      panel.animate({width: menuWidth}, {duration: duration, queue: false})
      panel.animate({height: menuHeight}, {duration: duration, queue: false})

    }

  }

  function toggleMenu() {

    let menu = $("#menu.panel")

    if (menu.css("visibility") == "hidden") {
      menu.css("visibility", "visible")
    } else if (menu.css("visibility") == "visible") {
      menu.css("visibility", "hidden")
    }

  }

  $("#menu.panel #main .option").click(function(event) {
    toggleSubPanel($("#menu.panel #" + this.id + "-panel.sub-panel"))
  })

  $("#nav #menu").click(function(event) { toggleMenu() })

  $(document).keypress(function(event) {
    if (event.keyCode == 13) { toggleMenu() }
  })

  addPanelEvents(panel)

}