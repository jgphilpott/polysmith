addMenuPanel = ->

    $("body").append "<div id='menu' class='panel'><img title='Close' class='close' src='/app/imgs/panels/nav/close.png'></div>"

    panel = $("#menu.panel")

    appendMain = ->

        main = "<div id='main'>"

        main += "<div class='head'><img id='logo' src='/app/imgs/theme/logo.png'><h2 id='title'>" + data.title + "</h2></div>"

        main += "<div id='export-import' class='option'><h4>Export / Import</h4></div>"
        main += "<div id='panels' class='option'><h4>Panels</h4></div>"
        main += "<div id='settings' class='option'><h4>Settings</h4></div>"

        if client

            main += "<div id='profile' class='option opt'><h4>Profile</h4></div>"
            main += "<div id='logout' class='option opt'><h4>Logout</h4></div>"

        else

            main += "<div id='signup' class='option opt'><h4>Sign Up</h4></div>"
            main += "<div id='login' class='option opt'><h4>Login</h4></div>"

        panel.append main + "</div>"

        mainPanel = panel.find "#main"

        mainPanel.find(".option").on "mousedown mouseup", (event) -> event.stopPropagation()
        mainPanel.find(".option").click -> toggleSubPanel panel.find "#" + this.id + "-panel.sub-panel"

    appendExportImport = ->

        porting = "<div id='export-import-panel' class='sub-panel'>"

        porting += "<div><h3 id='title'>Export</h3></div>"

        porting += "<div id='stl' class='option'><h4>STL<h4></div>"
        porting += "<div id='obj' class='option'><h4>OBJ<h4></div>"

        porting += "<div><h3 id='title'>Import</h3></div>"

        porting += "<div id='import' class='option'><h4>Choose File</h4></div>"
        porting += "<input id='file' type='file' accept='.obj, .ply, .stl' multiple>"

        panel.append porting + "</div>"

        subPanel = panel.find "#export-import-panel.sub-panel"

        subPanel.find("#stl, #obj").click -> exportFile this.id
        subPanel.find("#stl, #obj").on "mousedown mouseup", (event) -> event.stopPropagation()

        subPanel.find("#file").on "change", -> importFiles this
        subPanel.find("#import").click -> subPanel.find("#file").trigger "click"
        subPanel.find("#import").on "mousedown mouseup", (event) -> event.stopPropagation()

    appendPanels = ->

        panels = "<div id='panels-panel' class='sub-panel'><h3 id='title'>Panels</h3>"

        panels += "<div><input id='camera' class='checkbox' type='checkbox' " + (if settings.panels.camera then "checked" else "") + "><label>Camera</label></div>"
        panels += "<div><input id='lights' class='checkbox' type='checkbox' " + (if settings.panels.lights then "checked" else "") + "><label>Lights</label></div>"
        panels += "<div><input id='meshes' class='checkbox' type='checkbox' " + (if settings.panels.meshes then"checked" else "") + "><label>Meshes</label></div>"
        panels += "<div><input id='settings' class='checkbox' type='checkbox' " + (if settings.panels.settings then "checked" else "") + "><label>Settings</label></div>"
        panels += "<div><input id='shapes' class='checkbox' type='checkbox' " + (if settings.panels.shapes then "checked" else "") + "><label>Shapes</label></div>"
        panels += "<div><input id='shortcuts' class='checkbox' type='checkbox' " + (if settings.panels.shortcuts then "checked" else "") + "><label>Shortcuts</label></div>"

        panel.append panels + "</div>"

        subPanel = panel.find "#panels-panel.sub-panel"

        subPanel.find(".checkbox").click( ->

            $(this).blur()

            updateSettings "panels", $(this).attr("id"), $(this).prop("checked")

        ).on "mousedown mouseup", (event) -> event.stopPropagation()

    appendSettings = ->

        panel.append "<div id='settings-panel' class='sub-panel'><h3 id='title'>Settings</h3></div>"

        subPanel = panel.find "#settings-panel.sub-panel"

        subPanel.append "<img title='Advanced Settings' class='gear' src='/app/imgs/panels/tools/gear.png'>"

        general =

            """<div id='general-settings' class='settings-category'>

                <h4>General</h4>

                <div>
                    <label>Scale</label>
                    <select id='general-scale' class='select'>
                        <option value='imperial' """ + (if settings.general.scale == "imperial" then "selected" else "") + """>Imperial</option>
                        <option value='metric' """ + (if settings.general.scale == "metric" then "selected" else "") + """>Metric</option>
                    </select>
                </div>

                <div>
                    <label>Unit</label>
                    <select id='general-unit' class='select'>
                        <option value='centimeter' """ + (if settings.general.unit.metric == "centimeter" then "selected" else "") + """>Centimeter</option>
                        <option value='millimeter' """ + (if settings.general.unit.metric == "millimeter" then "selected" else "") + """>Millimeter</option>
                    </select>
                </div>

            </div>"""

        ui =

            """<div id='ui-settings' class='settings-category'>

                <h4>UI</h4>

                <div>
                    <input id='ui-navbar' class='checkbox' type='checkbox' """ + (if settings.ui.navbar then "checked" else "") + """><label>Navbar</label>
                </div>
                <div>
                    <input id='ui-forkme' class='checkbox' type='checkbox' """ + (if settings.ui.forkme then "checked" else "") + """><label>Forkme</label>
                </div>
                <div>
                    <input id='ui-metabox' class='checkbox' type='checkbox' """ + (if settings.ui.metabox then "checked" else "") + """><label>Metabox</label>
                </div>
                <div>
                    <input id='ui-help' class='checkbox' type='checkbox' """ + (if settings.ui.help then "checked" else "") + """><label>Help</label>
                </div>

            </div>"""

        axes =

            """<div id='axes-settings' class='settings-category'>

                <h4>Axes</h4>

                <div>
                    <input id='axes-axesCaps' class='checkbox' type='checkbox' """ + (if settings.axes.axesCaps then "checked" else "") + """><label>Axes Caps</label>
                </div>

                <div>
                    <input id='axes-xAxis' class='checkbox' type='checkbox' """ + (if settings.axes.xAxis then "checked" else "") + """><label>X Axis</label>
                </div>
                <div>
                    <input id='axes-yAxis' class='checkbox' type='checkbox' """ + (if settings.axes.yAxis then "checked" else "") + """><label>Y Axis</label>
                </div>
                <div>
                    <input id='axes-zAxis' class='checkbox' type='checkbox' """ + (if settings.axes.zAxis then "checked" else "") + """><label>Z Axis</label>
                </div>

                <div>
                    <input id='axes-xyPlane' class='checkbox' type='checkbox' """ + (if settings.axes.xyPlane then "checked" else "") + """><label>XY Plane</label>
                </div>
                <div>
                    <input id='axes-xzPlane' class='checkbox' type='checkbox' """ + (if settings.axes.xzPlane then "checked" else "") + """><label>XZ Plane</label>
                </div>
                <div>
                    <input id='axes-yzPlane' class='checkbox' type='checkbox' """ + (if settings.axes.yzPlane then "checked" else "") + """><label>YZ Plane</label>
                </div>

            </div>"""

        subPanel.append general
        subPanel.append ui
        subPanel.append axes

        subPanel.find("img.gear").click( ->

            updateSettings "panels", "settings", !settings.panels.settings

        ).css "opacity", if settings.panels.settings then 1 else 0.5

        subPanel.find(".select").on("change", ->

            $(this).blur()

            status = $(this).find(":selected").val()
            setting = $(this).attr("id").split "-"

            updateSettings setting[0], setting[1], status

        ).on "mousedown mouseup", (event) -> event.stopPropagation()

        subPanel.find(".checkbox").click( ->

            $(this).blur()

            status = $(this).prop "checked"
            setting = $(this).attr("id").split "-"

            updateSettings setting[0], setting[1], status

        ).on "mousedown mouseup", (event) -> event.stopPropagation()

    appendSignup = ->

        signup = "<div id='signup-panel' class='sub-panel'><h3 id='title'>Signup</h3>"

        signup += "<input class='email' type='email' placeholder='Email'>"
        signup += "<input class='password' type='password' data-min='8' placeholder='Password'>"
        signup += "<input class='retype-password' type='password' data-min='8' placeholder='Retype Password'>"

        signup += "<input class='submit' type='submit' placeholder='Submit'>"

        panel.append signup + "</div>"

        subPanel = panel.find "#signup-panel.sub-panel"

        email = subPanel.find ".email"
        password = subPanel.find ".password"
        retypePassword = subPanel.find ".retype-password"

        subPanel.find(".submit").click ->

            emailCheck = validEmail email.val()
            passwordCheck = password.val().length >= password.data "min"
            retypePasswordCheck = retypePassword.val() == password.val()

            if emailCheck and passwordCheck and retypePasswordCheck

                socket.emit "signup", {email: email.val(), password: sha256(password.val())}

            else

                if !emailCheck then email.addClass("invalid"); alert("Email invalid, please try again.")
                if !passwordCheck then password.addClass("invalid"); alert("Password to short, please try again.")
                if !retypePasswordCheck then retypePassword.addClass("invalid"); alert("Passwords dont match, please try again.")

        socket.on "signup_failed", -> alert("Signup failed, please try again.")
        socket.on "signup_success", (id) -> writeCookie("id", id); localDump(); location.reload()

    appendProfile = ->

        profile = "<div id='profile-panel' class='sub-panel'><h3 id='title'>Profile</h3>"

        profile += "<img id='profile-image' src='/app/imgs/panels/main/profile.png'>"

        profile += "<h4>Email</h4>"
        profile += "<p>" + client.email + "</p>"

        panel.append profile + "</div>"

    appendLogin = ->

        login = "<div id='login-panel' class='sub-panel'><h3 id='title'>Login</h3>"

        login += "<input class='email' type='email' placeholder='Email'>"
        login += "<input class='password' type='password' data-min='8' placeholder='Password'>"

        login += "<input class='submit' type='submit' placeholder='Submit'>"

        panel.append login + "</div>"

        subPanel = panel.find "#login-panel.sub-panel"

        email = subPanel.find ".email"
        password = subPanel.find ".password"

        subPanel.find(".submit").click ->

            emailCheck = validEmail email.val()
            passwordCheck = password.val().length >= password.data "min"

            if emailCheck and passwordCheck

                socket.emit "login", {email: email.val(), password: sha256(password.val())}

            else

                if !emailCheck then email.addClass("invalid"); alert("Email invalid, please try again.")
                if !passwordCheck then password.addClass("invalid"); alert("Password to short, please try again.")

        socket.on "login_failed", -> alert("Login failed, please try again.")
        socket.on "login_success", (id) -> writeCookie("id", id); localDump(); location.reload()

    appendLogout = ->

        panel.find("#logout").click ->

            deleteCookie("id"); localDump(); location.reload()

    appendMain()

    menuWidth = panel.outerWidth()
    menuHeight = panel.outerHeight()

    appendExportImport()
    appendPanels()
    appendSettings()

    if client

        appendProfile()
        appendLogout()

    else

        appendSignup()
        appendLogin()

    panel.find("input[type=email]").on "dblclick", -> document.execCommand "selectAll"

    panel.find("input").on "mousedown mouseup", (event) -> event.stopPropagation()
    panel.find("input").on "keypress keydown", (event) -> event.stopPropagation()
    panel.find("input").on "cut copy paste", (event) -> event.preventDefault()

    panel.find("#signup-panel input, #login-panel input").on "blur", ->

        if !$(this).hasClass("submit") then $(this).val($(this).val().trim())

        subPanel = $(this).closest ".sub-panel"

        email = subPanel.find ".email"
        password = subPanel.find ".password"
        retypePassword = subPanel.find ".retype-password"

        emailCheck = validEmail(email.val()) or email.val() == ""
        passwordCheck = password.val().length >= password.data("min") or password.val() == ""
        retypePasswordCheck = retypePassword.val() == password.val() or retypePassword.val() == ""

        if emailCheck then email.removeClass("invalid") else email.addClass("invalid")
        if passwordCheck then password.removeClass("invalid") else password.addClass("invalid")
        if retypePasswordCheck then retypePassword.removeClass("invalid") else retypePassword.addClass("invalid")

    $(document).keypress (event) -> if event.keyCode == 13 then togglePanel()

    $("#navbar #menu").click -> togglePanel()

    toggleSubPanel = (subPanel, duration = 1000) ->

        if subPanel.css("display") == "none"

            panel.find(".sub-panel").css "display", "none"

            subPanel.css "display", "inline-block"
            panelWidth = subPanel.outerWidth()
            subPanel.css "display", "none"

            panel.animate {width: menuWidth + panelWidth}, {duration: duration, queue: false}
            panel.animate {height: menuHeight}, {duration: duration, queue: false}

            subPanel.css "display", "inline-block"

        else

            panel.animate {width: menuWidth}, {duration: duration, queue: false}
            panel.animate {height: menuHeight}, {duration: duration, queue: false}

            subPanel.css "display", "none"

    togglePanel = ->

        if panel.css("visibility") == "hidden"

            panel.css "visibility", "visible"
            updateSettings "panels", "menu", true

        else if panel.css("visibility") == "visible"

            panel.css "visibility", "hidden"
            updateSettings "panels", "menu", false

    return panel
