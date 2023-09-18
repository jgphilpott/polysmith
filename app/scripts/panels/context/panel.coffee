class ContextPanel

    constructor: ->

        return this

    add: (context, element, event) ->

        $("body").append "<div id='context' class='panel'></div>"

        @panel = $("#context.panel")

        switch context

            when "cap"

                this.panel.append "<p id='look'>Look Here</p>"

                this.panel.find("#look").click =>

                    if camera.focus vectorAdaptor "convert", "length", element.position

                        $("#canvas").css "cursor", ""

                this.show event, 400

                break

            when "shape"

                shape = element.attr "id"

                this.panel.append "<p id='add'>Add Mesh</p>"

                if panels.shortcuts.shortcuts.includes shape

                    this.panel.append("<p id='hide'>Hide Shortcut</p>")

                else

                    this.panel.append("<p id='show'>Show Shortcut</p>")

                this.panel.find("#add").click =>

                    new Mesh(shape).add()

                this.panel.find("#hide, #show").click =>

                    panels.shortcuts.toggle shape

                this.show event, 600

                break

            when "mesh"

                uuid = element.uuid

                meshPanel = $("#mesh." + uuid + "")
                meshTableRow = $("#meshes.table tr#" + uuid + "")
                meshPanelOpen = meshPanel.length and meshPanel.css("visibility") is "visible"

                this.panel.append "<h4>Basic</h4>"

                this.panel.append "<p id='panel'>" + (if meshPanelOpen then "Close" else "Open") + " Panel</p>"
                this.panel.append "<p id='look'>Look Here</p>"

                if not element.getLock()

                    this.panel.append "<h4>CSG</h4>"

                    this.panel.append "<p id='join'>Join Mesh</p>"
                    this.panel.append "<p id='cut'>Cut Mesh</p>"
                    this.panel.append "<p id='intersect'>Intersect Mesh</p>"

                this.panel.append "<h4>Mesh</h4>"

                if not element.getLock() then this.panel.append("<p id='lock'>Lock Mesh</p>") else this.panel.append("<p id='lock'>Unlock Mesh</p>")
                if not element.getLock() then this.panel.append("<p id='wireframe'>Wireframe " + (if element.getWireframe() then "Off" else "On") + "</p>")
                if not element.getLock() then this.panel.append("<p id='remove'>Remove Mesh</p>")

                this.panel.find("#panel").click =>

                    if meshPanel.length and meshPanel.css("visibility") is "visible"

                        meshTableRow.find(".settings").attr "src", "/app/imgs/panels/tools/toggle/off.png"

                        meshPanel.css "visibility", "hidden"

                    else if meshPanel.length and meshPanel.css("visibility") is "hidden"

                        meshTableRow.find(".settings").attr "src", "/app/imgs/panels/tools/toggle/on.png"

                        meshPanel.css "z-index", events.zIndex += 1
                        meshPanel.css "visibility", "visible"

                    else

                        meshTableRow.find(".settings").attr "src", "/app/imgs/panels/tools/toggle/on.png"

                        addMeshPanel element

                this.panel.find("#look").click =>

                    if camera.focus vectorAdaptor "convert", "length", element.position

                        $("#canvas").css "cursor", ""

                this.panel.find("#cut").click => element.morph "cut", "setup"
                this.panel.find("#join").click => element.morph "join", "setup"
                this.panel.find("#intersect").click => element.morph "intersect", "setup"

                this.panel.find("#lock").click => element.toggleLock()
                this.panel.find("#wireframe").click => element.setWireframe not element.getWireframe()
                this.panel.find("#remove").click => element.remove()

                this.show event, 750

                break

        this.events()

    remove: ->

        this.hide this.duration

        this.panel.promise().done =>

            this.panel.remove()

    show: (event, duration = 1000) ->

        @duration = duration

        width = this.panel.outerWidth()
        height = this.panel.outerHeight()

        padding = Number this.panel.css("padding").replace("px", "")
        border = Number this.panel.css("border-width").replace("px", "")

        this.panel.css "width", padding * 2
        this.panel.css "height", padding * 2

        # Right half of the screen.
        if event.pageX >= window.innerWidth / 2

            left = event.pageX - width + padding
            this.panel.css "left", event.pageX - padding - (border * 2)

        # Left half of the screen.
        else if event.pageX < window.innerWidth / 2

            left = event.pageX - padding
            this.panel.css "left", event.pageX - padding

        # Bottom half of the screen.
        if event.pageY >= window.innerHeight / 2

            top = event.pageY - height + padding
            this.panel.css "top", event.pageY - padding - (border * 2)

        # Top half of the screen.
        else if event.pageY < window.innerHeight / 2

            top = event.pageY - padding
            this.panel.css "top", event.pageY - padding

        this.panel.animate {width: width, left: left}, {duration: duration / 2}
        this.panel.animate {height: height, top: top}, {duration: duration / 2}

    hide: (duration = 1000) ->

        this.panel.stop(true, false)
        this.panel.find("*").remove()

        width = this.panel.outerWidth()
        height = this.panel.outerHeight()

        left = Number(this.panel.css("left").replace("px", "")) + (width / 2)
        top = Number(this.panel.css("top").replace("px", "")) + (height / 2)

        this.panel.animate {padding: 0, width: 0, height: 0, left: left, top: top}, {duration: duration}

    events: ->

        this.panel.mouseleave =>

            this.panel.off "mouseleave"

            this.remove()

        this.panel.find("p").click =>

            composer.outlinePass.selectedObjects = []

            this.panel.off "mouseleave"

            this.remove()
