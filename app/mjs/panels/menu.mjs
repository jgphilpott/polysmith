import {exportFile, exportFiles} from "../libs/files/export.mjs"
import {importFile, importFiles} from "../libs/files/import.mjs"

export function addMenuPanel() {

  $("body").append("<div id='menu' class='panel'><img class='close' src='/app/imgs/panels/nav/close.png'></div>")

  let panel = $("#menu.panel")

  function appendMain() {

    let main = "<div id='main'>"

    main += "<div class='head'><img id='logo' src='/app/imgs/theme/logo.png'><h2 id='title'>" + data.title + "</h2></div>"

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

    porting += "<div><h3 id='title'>Export</h3></div>"

    porting += "<div id='stl' class='option'><h4>STL<h4></div>"
    porting += "<div id='obj' class='option'><h4>OBJ<h4></div>"

    porting += "<div><h3 id='title'>Import</h3></div>"

    porting += "<div id='import' class='option'><h4>Choose File</h4></div>"
    porting += "<input id='file' type='file' accept='.obj, .ply, .stl' multiple>"

    panel.append(porting + "</div>")

    let subPanel = panel.find("#export-import-panel.sub-panel")

    subPanel.find("#stl, #obj").click(function() { exportFile(this.id) })
    subPanel.find("#stl, #obj").mousedown(function(event) { event.stopPropagation() }) .mouseup(function(event) { event.stopPropagation() })

    subPanel.find("#file").on("change", function() { importFiles(this) })
    subPanel.find("#import").click(function() { subPanel.find("#file").trigger("click") })
    subPanel.find("#import").mousedown(function(event) { event.stopPropagation() }) .mouseup(function(event) { event.stopPropagation() })

  }

  function appendPanels() {

    let panels = "<div id='panels-panel' class='sub-panel'><h3 id='title'>Panels</h3><form>"

    panels += "<div><input id='camera' class='checkbox' type='checkbox' " + (settings.panels.camera ? "checked" : "") + "><label>Camera</label></div>"
    panels += "<div><input id='lights' class='checkbox' type='checkbox' " + (settings.panels.lights ? "checked" : "") + "><label>Lights</label></div>"
    panels += "<div><input id='meshes' class='checkbox' type='checkbox' " + (settings.panels.meshes ? "checked" : "") + "><label>Meshes</label></div>"
    panels += "<div><input id='shapes' class='checkbox' type='checkbox' " + (settings.panels.shapes ? "checked" : "") + "><label>Shapes</label></div>"
    panels += "<div><input id='shortcuts' class='checkbox' type='checkbox' " + (settings.panels.shortcuts ? "checked" : "") + "><label>Shortcuts</label></div>"

    panel.append(panels + "</form></div>")

    let subPanel = panel.find("#panels-panel.sub-panel")

    subPanel.find(".checkbox").click(function(event) {

      updateSettings("panels", $(this).attr("id"), $(this).prop("checked"))

    }).mousedown(function(event) { event.stopPropagation() }).mouseup(function(event) { event.stopPropagation() })

  }

  function appendSettings() {

    let settings = "<div id='settings-panel' class='sub-panel'><h3 id='title'>Settings</h3>"

    panel.append(settings + "</div>")

  }

  function appendSignup() {

    let signup = "<div id='signup-panel' class='sub-panel'><h3 id='title'>Signup</h3>"

    signup += "<input class='email' type='email' placeholder='Email'>"
    signup += "<input class='password' type='password' data-min='8' placeholder='Password'>"
    signup += "<input class='retype-password' type='password' data-min='8' placeholder='Retype Password'>"

    signup += "<input class='submit' type='submit' placeholder='Submit'>"

    panel.append(signup + "</div>")

    let subPanel = panel.find("#signup-panel.sub-panel")

    let email = subPanel.find(".email")
    let password = subPanel.find(".password")
    let retypePassword = subPanel.find(".retype-password")

    subPanel.find(".submit").click(function() {

      let emailCheck = validEmail(email.val())
      let passwordCheck = password.val().length >= password.data("min")
      let retypePasswordCheck = retypePassword.val() === password.val()

      if (emailCheck && passwordCheck && retypePasswordCheck) {

        socket.emit("signup", {email: email.val(), password: sha256(password.val())})

      } else {

        if (!emailCheck) { email.addClass("invalid"); alert("Email invalid, please try again.") }
        if (!passwordCheck) { password.addClass("invalid"); alert("Password to short, please try again.") }
        if (!retypePasswordCheck) { retypePassword.addClass("invalid"); alert("Passwords dont match, please try again.") }

      }

    })

    socket.on("signup_failed", function() { alert("Signup failed, please try again.") })
    socket.on("signup_success", function(id) { writeCookie("id", id); localDump(); location.reload() })

  }

  function appendProfile() {

    let profile = "<div id='profile-panel' class='sub-panel'><h3 id='title'>Profile</h3>"

    profile += "<img id='profile-image' src='/app/imgs/panels/main/profile.png'>"

    profile += "<h4>Email</h4>"
    profile += "<p>" + client.email + "</p>"

    panel.append(profile + "</div>")

  }

  function appendLogin() {

    let login = "<div id='login-panel' class='sub-panel'><h3 id='title'>Login</h3>"

    login += "<input class='email' type='email' placeholder='Email'>"
    login += "<input class='password' type='password' data-min='8' placeholder='Password'>"

    login += "<input class='submit' type='submit' placeholder='Submit'>"

    panel.append(login + "</div>")

    let subPanel = panel.find("#login-panel.sub-panel")

    let email = subPanel.find(".email")
    let password = subPanel.find(".password")

    subPanel.find(".submit").click(function() {

      let emailCheck = validEmail(email.val())
      let passwordCheck = password.val().length >= password.data("min")

      if (emailCheck && passwordCheck) {

        socket.emit("login", {email: email.val(), password: sha256(password.val())})

      } else {

        if (!emailCheck) { email.addClass("invalid"); alert("Email invalid, please try again.") }
        if (!passwordCheck) { password.addClass("invalid"); alert("Password to short, please try again.") }

      }

    })

    socket.on("login_failed", function() { alert("Login failed, please try again.") })
    socket.on("login_success", function(id) { writeCookie("id", id); localDump(); location.reload() })

  }

  function appendLogout() {

    panel.find("#logout").click(function() {

      deleteCookie("id"); localDump()

      location.reload()

    })

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
      let panelWidth = subPanel.outerWidth() + 3
      subPanel.css("display", "none")

      panel.animate({width: menuWidth + panelWidth}, {duration: duration, queue: false})
      panel.animate({height: menuHeight}, {duration: duration, queue: false})

      subPanel.css("display", "inline-block")

    } else {

      panel.animate({width: menuWidth}, {duration: duration, queue: false})
      panel.animate({height: menuHeight}, {duration: duration, queue: false})

      subPanel.css("display", "none")

    }

  }

  function toggleMenu() {

    let menu = $("#menu.panel")

    if (menu.css("visibility") == "hidden") {

      menu.css("visibility", "visible")
      updateSettings("panels", "menu", true)

    } else if (menu.css("visibility") == "visible") {

      menu.css("visibility", "hidden")
      updateSettings("panels", "menu", false)

    }

  }

  $("#menu.panel #main .option").click(function(event) { toggleSubPanel($("#menu.panel #" + this.id + "-panel.sub-panel")) })
  $("#menu.panel #main .option").mousedown(function(event) { event.stopPropagation() }).mouseup(function(event) { event.stopPropagation() })

  $("#menu.panel input").mousedown(function(event) { event.stopPropagation() }).mouseup(function(event) { event.stopPropagation() })
  $("#menu.panel input").on("keypress keydown", function(event) { event.stopPropagation() })
  $("#menu.panel input").on("cut copy paste", function(event) { event.preventDefault() })
  $("#menu.panel input").on("blur", function(event) {

    if (!$(this).hasClass("submit")) $(this).val($(this).val().trim())

    let invalidEmail = $(this).hasClass("email") && !(validEmail($(this).val())) && $(this).val() != ""
    let invalidPassword = $(this).hasClass("password") && !($(this).val().length > 7) && $(this).val() != ""
    let invalidPasswords = $(this).hasClass("retype-password") && !($("#signup-panel .password").val() === $("#signup-panel .retype-password").val()) && $(this).val() != ""

    if (invalidEmail || invalidPassword || invalidPasswords) {

      $(this).addClass("invalid")

    } else {

      $(this).removeClass("invalid")

    }

  })

  $(document).keypress(function(event) { if (event.keyCode == 13) toggleMenu() })

  $("#nav #menu").click(function(event) { toggleMenu() })

  return panel

}