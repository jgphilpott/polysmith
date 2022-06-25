function addMenuPanel() {

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

    let mainPanel = panel.find("#main")

    mainPanel.find(".option").on("mousedown mouseup", function(event) { event.stopPropagation() })
    mainPanel.find(".option").click(function(event) { toggleSubPanel(panel.find("#" + this.id + "-panel.sub-panel")) })

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
    subPanel.find("#stl, #obj").on("mousedown mouseup", function(event) { event.stopPropagation() })

    subPanel.find("#file").on("change", function() { importFiles(this) })
    subPanel.find("#import").click(function() { subPanel.find("#file").trigger("click") })
    subPanel.find("#import").on("mousedown mouseup", function(event) { event.stopPropagation() })

  }

  function appendPanels() {

    let panels = "<div id='panels-panel' class='sub-panel'><h3 id='title'>Panels</h3>"

    panels += "<div><input id='camera' class='checkbox' type='checkbox' " + (settings.panels.camera ? "checked" : "") + "><label>Camera</label></div>"
    panels += "<div><input id='lights' class='checkbox' type='checkbox' " + (settings.panels.lights ? "checked" : "") + "><label>Lights</label></div>"
    panels += "<div><input id='meshes' class='checkbox' type='checkbox' " + (settings.panels.meshes ? "checked" : "") + "><label>Meshes</label></div>"
    panels += "<div><input id='settings' class='checkbox' type='checkbox' " + (settings.panels.settings ? "checked" : "") + "><label>Settings</label></div>"
    panels += "<div><input id='shapes' class='checkbox' type='checkbox' " + (settings.panels.shapes ? "checked" : "") + "><label>Shapes</label></div>"
    panels += "<div><input id='shortcuts' class='checkbox' type='checkbox' " + (settings.panels.shortcuts ? "checked" : "") + "><label>Shortcuts</label></div>"

    panel.append(panels + "</div>")

    let subPanel = panel.find("#panels-panel.sub-panel")

    subPanel.find(".checkbox").click(function(event) {

      $(this).blur()

      updateSettings("panels", $(this).attr("id"), $(this).prop("checked"))

    }).on("mousedown mouseup", function(event) { event.stopPropagation() })

  }

  function appendSettings() {

    panel.append("<div id='settings-panel' class='sub-panel'><h3 id='title'>Settings</h3></div>")

    let subPanel = panel.find("#settings-panel.sub-panel")

    subPanel.append("<img title='Advanced Settings' class='gear' src='/app/imgs/panels/tools/gear.png'>")

    let general = "<div id='general-settings' class='settings-category'><h4>General</h4>"
    let ui = "<div id='ui-settings' class='settings-category'><h4>UI</h4>"
    let axes = "<div id='axes-settings' class='settings-category'><h4>Axes</h4>"

    general += "<div><label>Scale</label><select id='general-scale'><option value='metric'>Metric</option><option value='imperial'>Imperial</option></select></div>"

    ui += "<div><input id='ui-navbar' class='checkbox' type='checkbox' " + (settings.ui.navbar ? "checked" : "") + "><label>Navbar</label></div>"
    ui += "<div><input id='ui-forkme' class='checkbox' type='checkbox' " + (settings.ui.forkme ? "checked" : "") + "><label>Forkme</label></div>"
    ui += "<div><input id='ui-metabox' class='checkbox' type='checkbox' " + (settings.ui.metabox ? "checked" : "") + "><label>Metabox</label></div>"
    ui += "<div><input id='ui-help' class='checkbox' type='checkbox' " + (settings.ui.help ? "checked" : "") + "><label>Help</label></div>"

    axes += "<div><input id='axes-axesCaps' class='checkbox' type='checkbox' " + (settings.axes.axesCaps ? "checked" : "") + "><label>Axes Caps</label></div>"

    axes += "<div><input id='axes-xAxis' class='checkbox' type='checkbox' " + (settings.axes.xAxis ? "checked" : "") + "><label>X Axis</label></div>"
    axes += "<div><input id='axes-yAxis' class='checkbox' type='checkbox' " + (settings.axes.yAxis ? "checked" : "") + "><label>Y Axis</label></div>"
    axes += "<div><input id='axes-zAxis' class='checkbox' type='checkbox' " + (settings.axes.zAxis ? "checked" : "") + "><label>Z Axis</label></div>"

    axes += "<div><input id='axes-xyPlane' class='checkbox' type='checkbox' " + (settings.axes.xyPlane ? "checked" : "") + "><label>XY Plane</label></div>"
    axes += "<div><input id='axes-xzPlane' class='checkbox' type='checkbox' " + (settings.axes.xzPlane ? "checked" : "") + "><label>XZ Plane</label></div>"
    axes += "<div><input id='axes-yzPlane' class='checkbox' type='checkbox' " + (settings.axes.yzPlane ? "checked" : "") + "><label>YZ Plane</label></div>"

    subPanel.append(general + "</div>")
    subPanel.append(ui + "</div>")
    subPanel.append(axes + "</div>")

    subPanel.find("img.gear").click(function(event) {

      updateSettings("panels", "settings", !settings.panels.settings)

    }).css("opacity", settings.panels.settings ? 1 : 0.5)

    subPanel.find(".checkbox").click(function(event) {

      $(this).blur()

      let status = $(this).prop("checked")
      let setting = $(this).attr("id").split("-")

      updateSettings(setting[0], setting[1], status)

    }).on("mousedown mouseup", function(event) { event.stopPropagation() })

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

  let menuWidth = panel.outerWidth()
  let menuHeight = panel.outerHeight()

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

  panel.find("input[type=email]").on("dblclick", function(event) { document.execCommand("selectAll") })

  panel.find("input").on("mousedown mouseup", function(event) { event.stopPropagation() })
  panel.find("input").on("keypress keydown", function(event) { event.stopPropagation() })
  panel.find("input").on("cut copy paste", function(event) { event.preventDefault() })

  panel.find("#signup-panel input, #login-panel input").on("blur", function(event) {

    if (!$(this).hasClass("submit")) $(this).val($(this).val().trim())

    let subPanel = $(this).closest(".sub-panel")

    let email = subPanel.find(".email")
    let password = subPanel.find(".password")
    let retypePassword = subPanel.find(".retype-password")

    let emailCheck = validEmail(email.val()) || email.val() == ""
    let passwordCheck = password.val().length >= password.data("min") || password.val() == ""
    let retypePasswordCheck = retypePassword.val() === password.val() || retypePassword.val() == ""

    emailCheck ? email.removeClass("invalid") : email.addClass("invalid")
    passwordCheck ? password.removeClass("invalid") : password.addClass("invalid")
    retypePasswordCheck ? retypePassword.removeClass("invalid") : retypePassword.addClass("invalid")

  })

  $(document).keypress(function(event) { if (event.keyCode == 13) togglePanel() })

  $("#navbar #menu").click(function(event) { togglePanel() })

  function toggleSubPanel(subPanel, duration=1000) {

    if (subPanel.css("display") == "none") {

      panel.find(".sub-panel").css("display", "none")

      subPanel.css("display", "inline-block")
      let panelWidth = subPanel.outerWidth()
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

  function togglePanel() {

    if (panel.css("visibility") == "hidden") {

      panel.css("visibility", "visible")
      updateSettings("panels", "menu", true)

    } else if (panel.css("visibility") == "visible") {

      panel.css("visibility", "hidden")
      updateSettings("panels", "menu", false)

    }

  }

  return panel

}