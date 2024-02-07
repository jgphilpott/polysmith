class MenuPanel

    constructor: ->

        return this

    add: ->

        $("body").append "<div id='menu' class='panel'><img title='Close' class='close' src='/app/imgs/panels/nav/close/black.png'></div>"

        @panel = $("#menu.panel")

        appendMain = =>

            main = "<div id='main'>"

            main += "<div class='head'><img id='logo' src='/app/imgs/theme/logo/basic/small/colored.png'><h2 id='title'>" + data.title + "</h2></div>"

            main += "<div id='export-import' class='option'><h4>Export / Import</h4></div>"
            main += "<div id='panels' class='option'><h4>Panels</h4></div>"
            main += "<div id='settings' class='option'><h4>Settings</h4></div>"

            if client

                main += "<div id='profile' class='option opt'><h4>Profile</h4></div>"
                main += "<div id='logout' class='option opt'><h4>Logout</h4></div>"

            else

                main += "<div id='signup' class='option opt'><h4>Sign Up</h4></div>"
                main += "<div id='login' class='option opt'><h4>Login</h4></div>"

            this.panel.append main + "</div>"

            mainPanel = this.panel.find "#main"

            mainPanel.find(".option").on "mousedown mouseup", (event) => event.stopPropagation()
            mainPanel.find(".option").click => toggleSubPanel this.panel.find "#" + $(event.target).closest(".option").attr("id") + "-panel.sub-panel"

        appendExportImport = =>

            porting = "<div id='export-import-panel' class='sub-panel'>"

            porting += "<div><h3 id='title'>Export</h3></div>"

            porting += "<div id='stl' class='option'><h4>STL<h4></div>"
            porting += "<div id='obj' class='option'><h4>OBJ<h4></div>"

            porting += "<div><h3 id='title'>Import</h3></div>"

            porting += "<div id='import' class='option'><h4>Choose File</h4></div>"
            porting += "<input id='file' type='file' accept='.obj, .ply, .stl' multiple>"

            this.panel.append porting + "</div>"

            subPanel = this.panel.find "#export-import-panel.sub-panel"

            subPanel.find("#stl, #obj").click -> exporter.exportFile this.id
            subPanel.find("#stl, #obj").on "mousedown mouseup", (event) -> event.stopPropagation()

            subPanel.find("#file").on "change", -> importer.importFiles this
            subPanel.find("#import").click -> subPanel.find("#file").trigger "click"
            subPanel.find("#import").on "mousedown mouseup", (event) -> event.stopPropagation()

        appendPanels = =>

            panels = "<div id='panels-panel' class='sub-panel'><h3 id='title'>Panels</h3>"

            panels += "<div><input id='camera' class='checkbox' type='checkbox' " + (if settings.get("panels.camera.open") then "checked" else "") + "><label>Camera</label></div>"
            panels += "<div><input id='lights' class='checkbox' type='checkbox' " + (if settings.get("panels.lights.open") then "checked" else "") + "><label>Lights</label></div>"
            panels += "<div><input id='meshes' class='checkbox' type='checkbox' " + (if settings.get("panels.meshes.open") then"checked" else "") + "><label>Meshes</label></div>"
            panels += "<div><input id='settings' class='checkbox' type='checkbox' " + (if settings.get("panels.settings.open") then "checked" else "") + "><label>Settings</label></div>"
            panels += "<div><input id='shapes' class='checkbox' type='checkbox' " + (if settings.get("panels.shapes.open") then "checked" else "") + "><label>Shapes</label></div>"
            panels += "<div><input id='shortcuts' class='checkbox' type='checkbox' " + (if settings.get("panels.shortcuts.open") then "checked" else "") + "><label>Shortcuts</label></div>"

            this.panel.append panels + "</div>"

            subPanel = this.panel.find "#panels-panel.sub-panel"

            subPanel.find(".checkbox").click( ->

                $(this).blur()

                settings.set ["panels", $(this).attr("id"), "open"], $(this).prop("checked")

            ).on "mousedown mouseup", (event) -> event.stopPropagation()

        appendSettings = =>

            this.panel.append "<div id='settings-panel' class='sub-panel'><h3 id='title'>Settings</h3></div>"

            subPanel = this.panel.find "#settings-panel.sub-panel"

            subPanel.append "<img title='Advanced Settings' id='gear' class='nav' src='/app/imgs/panels/tools/gear.png'>"

            scale = settings.get "scales.scale"

            lengthMetric = settings.get "scales.length.unit.metric"
            lengthImperial = settings.get "scales.length.unit.imperial"

            areaMetric = settings.get "scales.area.unit.metric"
            areaImperial = settings.get "scales.area.unit.imperial"

            volumeMetric = settings.get "scales.volume.unit.metric"
            volumeImperial = settings.get "scales.volume.unit.imperial"

            measurement =

            """
            <div id='measurement-settings' class='settings-category'>

                <h4>Measurement</h4>

                <div>

                    <label>Scale:</label>

                    <select id='scales-scale'>

                        <option value='metric' """ + (if scale is "metric" then "selected" else "") + """>Metric</option>
                        <option value='imperial' """ + (if scale is "imperial" then "selected" else "") + """>Imperial</option>

                    </select>

                </div>

                <div>

                    <label>Length:</label>

                    <select id='scales-length' class='metric'>

                        <option value='nanometer' """ + (if lengthMetric is "nanometer" then "selected" else "") + """>Nanometer</option>
                        <option value='micrometer' """ + (if lengthMetric is "micrometer" then "selected" else "") + """>Micrometer</option>
                        <option value='millimeter' """ + (if lengthMetric is "millimeter" then "selected" else "") + """>Millimeter</option>
                        <option value='centimeter' """ + (if lengthMetric is "centimeter" then "selected" else "") + """>Centimeter</option>
                        <option value='decimeter' """ + (if lengthMetric is "decimeter" then "selected" else "") + """>Decimeter</option>
                        <option value='meter' """ + (if lengthMetric is "meter" then "selected" else "") + """>Meter</option>

                    </select>

                    <select id='scales-length' class='imperial'>

                        <option value='inch' """ + (if lengthImperial is "inch" then "selected" else "") + """>Inch</option>
                        <option value='foot' """ + (if lengthImperial is "foot" then "selected" else "") + """>Foot</option>
                        <option value='yard' """ + (if lengthImperial is "yard" then "selected" else "") + """>Yard</option>

                    </select>

                </div>

                <div>

                    <label>Area:</label>

                    <select id='scales-area' class='metric'>

                        <option value='nanometerSq' """ + (if areaMetric is "nanometerSq" then "selected" else "") + """>Nanometer Sq</option>
                        <option value='micrometerSq' """ + (if areaMetric is "micrometerSq" then "selected" else "") + """>Micrometer Sq</option>
                        <option value='millimeterSq' """ + (if areaMetric is "millimeterSq" then "selected" else "") + """>Millimeter Sq</option>
                        <option value='centimeterSq' """ + (if areaMetric is "centimeterSq" then "selected" else "") + """>Centimeter Sq</option>
                        <option value='decimeterSq' """ + (if areaMetric is "decimeterSq" then "selected" else "") + """>Decimeter Sq</option>
                        <option value='meterSq' """ + (if areaMetric is "meterSq" then "selected" else "") + """>Meter Sq</option>

                    </select>

                    <select id='scales-area' class='imperial'>

                        <option value='inchSq' """ + (if areaImperial is "inchSq" then "selected" else "") + """>Inch Sq</option>
                        <option value='footSq' """ + (if areaImperial is "footSq" then "selected" else "") + """>Foot Sq</option>
                        <option value='yardSq' """ + (if areaImperial is "yardSq" then "selected" else "") + """>Yard Sq</option>

                    </select>

                </div>

                <div>

                    <label>Volume:</label>

                    <select id='scales-volume' class='metric'>

                        <option value='nanometerCu' """ + (if volumeMetric is "nanometerCu" then "selected" else "") + """>Nanometer Cu</option>
                        <option value='micrometerCu' """ + (if volumeMetric is "micrometerCu" then "selected" else "") + """>Micrometer Cu</option>
                        <option value='millimeterCu' """ + (if volumeMetric is "millimeterCu" then "selected" else "") + """>Millimeter Cu</option>
                        <option value='centimeterCu' """ + (if volumeMetric is "centimeterCu" then "selected" else "") + """>Centimeter Cu</option>
                        <option value='decimeterCu' """ + (if volumeMetric is "decimeterCu" then "selected" else "") + """>Decimeter Cu</option>
                        <option value='meterCu' """ + (if volumeMetric is "meterCu" then "selected" else "") + """>Meter Cu</option>

                    </select>

                    <select id='scales-volume' class='imperial'>

                        <option value='inchCu' """ + (if volumeImperial is "inchCu" then "selected" else "") + """>Inch Cu</option>
                        <option value='footCu' """ + (if volumeImperial is "footCu" then "selected" else "") + """>Foot Cu</option>
                        <option value='yardCu' """ + (if volumeImperial is "yardCu" then "selected" else "") + """>Yard Cu</option>

                    </select>

                </div>

            </div>
            """

            ui =

                """
                <div id='ui-settings' class='settings-category'>

                    <h4>UI</h4>

                    <div>

                        <input id='ui-fullscreen' class='checkbox' type='checkbox'><label>Fullscreen</label>

                    </div>

                    <div>

                        <input id='ui-navbar' class='checkbox' type='checkbox' """ + (if settings.get "ui.navbar" then "checked" else "") + """><label>Navbar</label>

                    </div>

                    <div>

                        <input id='ui-forkme' class='checkbox' type='checkbox' """ + (if settings.get "ui.forkme" then "checked" else "") + """><label>Forkme</label>

                    </div>

                    <div>

                        <input id='ui-metabox' class='checkbox' type='checkbox' """ + (if settings.get "ui.metabox" then "checked" else "") + """><label>Metabox</label>

                    </div>

                    <div>

                        <input id='ui-help' class='checkbox' type='checkbox' """ + (if settings.get "ui.help" then "checked" else "") + """><label>Help</label>

                    </div>

                </div>
                """

            grid =

                """
                <div id='grid-settings' class='settings-category'>

                    <h4>Grid</h4>

                    <div>

                        <input id='tooltips-grid-caps' class='checkbox' type='checkbox' """ + (if settings.get "tooltips.grid.caps" then "checked" else "") + """><label>Axes Caps</label>

                    </div>

                    <div>

                        <input id='tooltips-grid-axes-x' class='checkbox' type='checkbox' """ + (if settings.get "tooltips.grid.axes.x" then "checked" else "") + """><label>X Axis</label>

                    </div>

                    <div>

                        <input id='tooltips-grid-axes-y' class='checkbox' type='checkbox' """ + (if settings.get "tooltips.grid.axes.y" then "checked" else "") + """><label>Y Axis</label>

                    </div>

                    <div>

                        <input id='tooltips-grid-axes-z' class='checkbox' type='checkbox' """ + (if settings.get "tooltips.grid.axes.z" then "checked" else "") + """><label>Z Axis</label>

                    </div>

                    <div>

                        <input id='tooltips-grid-ticks-xy' class='checkbox' type='checkbox' """ + (if settings.get "tooltips.grid.ticks.xy" then "checked" else "") + """><label>XY Plane</label>

                    </div>

                    <div>

                        <input id='tooltips-grid-ticks-xz' class='checkbox' type='checkbox' """ + (if settings.get "tooltips.grid.ticks.xz" then "checked" else "") + """><label>XZ Plane</label>

                    </div>

                    <div>

                        <input id='tooltips-grid-ticks-yz' class='checkbox' type='checkbox' """ + (if settings.get "tooltips.grid.ticks.yz" then "checked" else "") + """><label>YZ Plane</label>

                    </div>

                </div>
                """

            subPanel.append measurement
            subPanel.append ui
            subPanel.append grid

            subPanel.find("img#gear").click( ->

                settings.set "panels.settings.open", !settings.get "panels.settings.open"

            ).css "opacity", if settings.get "panels.settings.open" then 1 else 0.5

            subPanel.find("select." + scale + "").css "display", "block"

            subPanel.find("select").on("change", (event) =>

                $(event.target).blur()

                path = $(event.target).attr("id").split("-")
                value = $(event.target).find(":selected").val()

                if path[0] is "scales" and path[1] isnt "scale"

                    path.push "unit", settings.get "scales.scale"

                settings.set path, value

            ).on "mousedown mouseup", (event) => event.stopPropagation()

            subPanel.find(".checkbox").click((event) =>

                $(event.target).blur()

                path = $(event.target).attr("id").split("-")
                value = $(event.target).prop("checked")

                settings.set path, value

            ).on "mousedown mouseup", (event) => event.stopPropagation()

        appendSignup = =>

            signup = "<div id='signup-panel' class='sub-panel'><h3 id='title'>Signup</h3>"

            signup += "<input class='email' type='email' placeholder='Email'>"
            signup += "<input class='password' type='password' data-min='8' placeholder='Password'>"
            signup += "<input class='retype-password' type='password' data-min='8' placeholder='Retype Password'>"

            signup += "<input class='submit' type='submit' placeholder='Submit'>"

            this.panel.append signup + "</div>"

            subPanel = this.panel.find "#signup-panel.sub-panel"

            email = subPanel.find ".email"
            password = subPanel.find ".password"
            retypePassword = subPanel.find ".retype-password"

            subPanel.find(".submit").click ->

                emailCheck = validEmail email.val()
                passwordCheck = password.val().length >= password.data "min"
                retypePasswordCheck = retypePassword.val() is password.val()

                if emailCheck and passwordCheck and retypePasswordCheck

                    socket.emit "signup", {email: email.val(), password: sha256(password.val())}

                else

                    if !emailCheck then email.addClass("invalid"); alert("Email invalid, please try again.")
                    if !passwordCheck then password.addClass("invalid"); alert("Password to short, please try again.")
                    if !retypePasswordCheck then retypePassword.addClass("invalid"); alert("Passwords dont match, please try again.")

            socket.on "signup_failed", -> alert("Signup failed, please try again.")
            socket.on "signup_success", (id) -> writeCookie("id", id); localDump(); location.reload()

        appendProfile = =>

            profile = "<div id='profile-panel' class='sub-panel'><h3 id='title'>Profile</h3>"

            profile += "<img id='profile-image' src='/app/imgs/panels/main/profile.png'>"

            profile += "<h4>Email</h4>"
            profile += "<p>" + client.email + "</p>"

            this.panel.append profile + "</div>"

        appendLogin = =>

            login = "<div id='login-panel' class='sub-panel'><h3 id='title'>Login</h3>"

            login += "<input class='email' type='email' placeholder='Email'>"
            login += "<input class='password' type='password' data-min='8' placeholder='Password'>"

            login += "<input class='submit' type='submit' placeholder='Submit'>"

            this.panel.append login + "</div>"

            subPanel = this.panel.find "#login-panel.sub-panel"

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

        appendLogout = =>

            this.panel.find("#logout").click ->

                deleteCookie("id"); localDump(); location.reload()

        appendMain()

        menuWidth = this.panel.outerWidth()
        menuHeight = this.panel.outerHeight()

        appendExportImport()
        appendPanels()
        appendSettings()

        if client

            appendProfile()
            appendLogout()

        else

            appendSignup()
            appendLogin()

        this.panel.find("input[type=email]").on "dblclick", -> document.execCommand "selectAll"

        this.panel.find("input").on "mousedown mouseup", (event) -> event.stopPropagation()
        this.panel.find("input").on "keypress keydown", (event) -> event.stopPropagation()
        this.panel.find("input").on "cut copy paste", (event) -> event.preventDefault()

        this.panel.find("#signup-panel input, #login-panel input").on "blur", ->

            if !$(this).hasClass("submit") then $(this).val($(this).val().trim())

            subPanel = $(this).closest ".sub-panel"

            email = subPanel.find ".email"
            password = subPanel.find ".password"
            retypePassword = subPanel.find ".retype-password"

            emailCheck = validEmail(email.val()) or email.val() is ""
            passwordCheck = password.val().length >= password.data("min") or password.val() is ""
            retypePasswordCheck = retypePassword.val() is password.val() or retypePassword.val() is ""

            if emailCheck then email.removeClass("invalid") else email.addClass("invalid")
            if passwordCheck then password.removeClass("invalid") else password.addClass("invalid")
            if retypePasswordCheck then retypePassword.removeClass("invalid") else retypePassword.addClass("invalid")

        toggleSubPanel = (subPanel, duration = 1000) =>

            if subPanel.css("display") is "none"

                this.panel.find(".sub-panel").css "display", "none"

                subPanel.css "display", "inline-block"
                panelWidth = subPanel.outerWidth()
                subPanel.css "display", "none"

                this.panel.animate {width: menuWidth + panelWidth}, {duration: duration, queue: false}
                this.panel.animate {height: menuHeight}, {duration: duration, queue: false}

                subPanel.css "display", "inline-block"

            else

                this.panel.animate {width: menuWidth}, {duration: duration, queue: false}
                this.panel.animate {height: menuHeight}, {duration: duration, queue: false}

                subPanel.css "display", "none"

        this.events()

    remove: ->

        this.panel.remove()

    show: ->

        this.panel.css "visibility", "visible"
        this.panel.css "z-index", events.zIndex += 1

    hide: ->

        this.panel.css "visibility", "hidden"

    toggle: ->

        settings.set "panels.menu.open", not settings.get "panels.menu.open"

    events: ->

        panels.events this.panel
