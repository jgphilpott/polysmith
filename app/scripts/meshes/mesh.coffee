class Mesh

    constructor: (type, params = {}) ->

        type = type.lower()

        if type in d1 then dimension = "1D"
        if type in d2 then dimension = "2D"
        if type in d3 then dimension = "3D"

        switch dimension

            when "1D"

                @mesh = new Mesh1D type, params

            when "2D"

                @mesh = new Mesh2D type, params

            when "3D"

                @mesh = new Mesh3D type, params

            else

                @mesh = params.mesh

        params.panel ?= true

        this.mesh.add = this.add
        this.mesh.remove = this.remove

        this.mesh.addEvents = this.addEvents
        this.mesh.removeEvents = this.removeEvents

        this.mesh.getName = this.getName
        this.mesh.setName = this.setName

        this.mesh.getLock = this.getLock
        this.mesh.setLock = this.setLock
        this.mesh.toggleLock = this.toggleLock

        this.mesh.getColor = this.getColor
        this.mesh.setColor = this.setColor

        this.mesh.getTransparent = this.getTransparent
        this.mesh.setTransparent = this.setTransparent

        this.mesh.getOpacity = this.getOpacity
        this.mesh.setOpacity = this.setOpacity

        this.mesh.getPosition = this.getPosition
        this.mesh.setPosition = this.setPosition

        this.mesh.getPositionX = this.getPositionX
        this.mesh.setPositionX = this.setPositionX

        this.mesh.getPositionY = this.getPositionY
        this.mesh.setPositionY = this.setPositionY

        this.mesh.getPositionZ = this.getPositionZ
        this.mesh.setPositionZ = this.setPositionZ

        this.mesh.getRotation = this.getRotation
        this.mesh.setRotation = this.setRotation

        this.mesh.getRotationX = this.getRotationX
        this.mesh.setRotationX = this.setRotationX

        this.mesh.getRotationY = this.getRotationY
        this.mesh.setRotationY = this.setRotationY

        this.mesh.getRotationZ = this.getRotationZ
        this.mesh.setRotationZ = this.setRotationZ

        this.mesh.getScale = this.getScale
        this.mesh.setScale = this.setScale

        this.mesh.getScaleX = this.getScaleX
        this.mesh.setScaleX = this.setScaleX

        this.mesh.getScaleY = this.getScaleY
        this.mesh.setScaleY = this.setScaleY

        this.mesh.getScaleZ = this.getScaleZ
        this.mesh.setScaleZ = this.setScaleZ

        this.updateMatrix = this.mesh.updateMatrix
        this.mesh.updateMetrics = this.updateMetrics
        this.mesh.updateParams = this.updateParams

        if params.panel then this.mesh.panel = new MeshPanel this.mesh

        if params.position then this.mesh.setPosition params.position, false
        if params.rotation then this.mesh.setRotation params.rotation, false

        this.mesh.lock = if "lock" of params then params.lock else if this.mesh.lock then this.mesh.lock else false
        this.mesh.name = if "name" of params then params.name else if this.mesh.name then this.mesh.name else "Unnamed"
        this.mesh.class = if "class" of params then params.class else if this.mesh.class then this.mesh.class else "custom"

        this.mesh.material.style = if "style" of params then params.style else if this.mesh.material.style then this.mesh.material.style else "multi"
        this.mesh.material.wireframe = if "wireframe" of params then params.wireframe else if this.mesh.material.wireframe then this.mesh.material.wireframe else false

        # this.translate = this.geometry.translate
        # this.center = this.geometry.center

        this.mesh.morph = this.morph
        this.mesh.save = this.save

        this.mesh.dragable = this.dragable
        this.mesh.params = params

        return this.mesh

    add: ->

        scene.add this
        this.save "add"

        this.addEvents()

        # this.panel.add()
        panels.meshes.addMesh this

        return this

    remove: ->

        if not this.getLock()

            scene.remove this
            this.save "remove"

            this.removeEvents()

            this.panel.remove()
            panels.meshes.removeMesh this

            this.geometry.dispose()
            this.material.dispose()

            if events.operation.mesh is this

                events.clearCSG()

        return this

    addEvents: ->

        events.addEventListener this, "mouseover", (event) =>

            null

        events.addEventListener this, "mousemove", (event) =>

            if settings.get "ui.metabox"

                metabox.update this, event.origDomEvent

            if events.operation.key

                if events.operation.mesh.uuid is this.uuid

                    composer.outlinePass.visibleEdgeColor.set redThree
                    $("#canvas").css "cursor", "not-allowed"

                else

                    composer.outlinePass.visibleEdgeColor.set greenThree
                    $("#canvas").css "cursor", "copy"

            else

                if this.getLock()

                    composer.outlinePass.visibleEdgeColor.set redThree
                    $("#canvas").css "cursor", "not-allowed"

                else

                    composer.outlinePass.visibleEdgeColor.set blackThree
                    $("#canvas").css "cursor", "grab"

            composer.outlinePass.selectedObjects = [this]

        events.addEventListener this, "mouseout", (event) =>

            composer.outlinePass.selectedObjects = []

            if events.operation.key

                $("#canvas").css "cursor", "copy"

            else

                $("#canvas").css "cursor", ""

            metabox.hide()

        events.addEventListener this, "mousedown", (event) =>

            this.dragable event.origDomEvent

        events.addEventListener this, "click", (event) =>

            event.origDomEvent.stopImmediatePropagation()

            if not camera.dragged

                if events.operation.key

                    this.morph events.operation.key, null, true

                else if tooltips.getSelected() isnt this

                    tooltips.setSelected this

        events.addEventListener this, "dblclick", (event) =>

            if camera.focus this.getPosition()

                $("#canvas").css "cursor", ""

        events.addEventListener this, "contextmenu", (event) =>

            panels.context.add "mesh", this, event.origDomEvent

        return this

    removeEvents: ->

        events.removeEventListener this, "mouseover"
        events.removeEventListener this, "mousemove"
        events.removeEventListener this, "mouseout"
        events.removeEventListener this, "mousedown"

        events.removeEventListener this, "click"
        events.removeEventListener this, "dblclick"
        events.removeEventListener this, "contextmenu"

        return this

    dragable: (origDomEvent, save = true) ->

        xOffset = 0
        yOffset = 0

        start = (event) =>

            coordinates = d3$d2 this.position.x, this.position.y, this.position.z

            xOffset = origDomEvent.clientX - coordinates.x
            yOffset = origDomEvent.clientY - coordinates.y

            $("#canvas").css "cursor", "grabbing"

            document.onmousemove = drag
            document.onmouseup = stop

            this.dragged = null

        drag = (event) =>

            this.dragged = true

            eventX = event.clientX - xOffset
            eventY = event.clientY - yOffset

            $("#canvas").css "cursor", "grabbing"

            coordinates = d2$d3 eventX, eventY, this.position.z
            size = vectorAdaptor "invert", "length", printer.getSize()

            this.position.x = if coordinates.x < -size.x then -size.x else if coordinates.x > size.x then size.x else coordinates.x
            this.position.y = if coordinates.y < -size.y then -size.y else if coordinates.y > size.y then size.y else coordinates.y
            this.position.z = if coordinates.z < -size.z then -size.z else if coordinates.z > size.z then size.z else coordinates.z

            composer.outlinePass.visibleEdgeColor.set blackThree
            composer.outlinePass.selectedObjects = [this]

            tooltips.guidelines.add this.getPosition()

            this.setPosition this.getPosition()

        stop = (event) =>

            $("#canvas").css "cursor", "grab"

            if save then this.save "update"

            tooltips.guidelines.remove()

            document.onmousemove = null
            document.onmouseup = null

        if not this.getLock() and not events.operation.key then start()

        return this

    morph: (key = null, value = null, save = false) ->

        panel = $("#mesh." + this.uuid + "")

        operationIcon = panel.find "#" + key + ".operation"
        operationIcons = $ "#mesh.panel img.operation"

        operationIcons.toArray().forEach (icon) ->

            if not $(icon).hasClass "disabled"

                $(icon).attr "src", "/app/imgs/panels/ops/default/" + icon.id + ".png"

        if value is "setup" and not this.getLock()

            operationIcon.attr "src", "/app/imgs/panels/ops/selected/" + key + ".png"

            $("#canvas").css "cursor", "copy"

            events.operation.mesh = this
            events.operation.key = key

        else if events.operation.key and not camera.dragged

            if events.operation.mesh.uuid isnt this.uuid

                morphed = morph key, events.operation.mesh, this

                if morphed

                    morphed.geometry = new Geometry "custom", geometry: morphed.geometry
                    events.operation.mesh.class = "custom"

                    events.operation.mesh.geometry = morphed.geometry.clone()
                    events.operation.mesh.matrix = morphed.matrix.clone()

                    events.operation.mesh.position.x = morphed.position.x
                    events.operation.mesh.position.y = morphed.position.y
                    events.operation.mesh.position.z = morphed.position.z

                    events.operation.mesh.rotation.x = morphed.rotation.x
                    events.operation.mesh.rotation.y = morphed.rotation.y
                    events.operation.mesh.rotation.z = morphed.rotation.z

                    events.operation.mesh.scale.x = morphed.scale.x
                    events.operation.mesh.scale.y = morphed.scale.y
                    events.operation.mesh.scale.z = morphed.scale.z

                    events.operation.mesh.updateMetrics()
                    localStore.updateMesh events.operation.mesh

                    $("#mesh." + events.operation.mesh.uuid + " #properties.controls").remove()

            $("#canvas").css "cursor", ""

            events.operation.mesh = null
            events.operation.key = null

        return this

    getName: ->

        return this.name

    setName: (key = null, value = null, save = false) ->

        if not this.getLock()

            value = value.trim()

            this.name = value

            if save then this.save "update"

            meshPanelName = $ "#mesh." + this.uuid + " #name span"
            meshesPanelName = $ "#meshes.table tr#" + this.uuid + " .name span"

            if meshPanelName[0] and key isnt "mesh" then meshPanelName[0].innerText = value
            if meshesPanelName[0] and key isnt "meshes" then meshesPanelName[0].innerText = value

            if value is "" and key isnt "mesh" then meshPanelName.css("display", "none") else meshPanelName.css("display", "block")

        return this

    getLock: ->

        return this.lock

    setLock: (lock, save = true) ->

        this.lock = Boolean lock

        meshPanel = $("#mesh." + this.uuid + "")
        meshesTableRow = $("#meshes.table tr#" + this.uuid + "")

        if this.getLock()

            composer.outlinePass.visibleEdgeColor.set redThree

            if this is events.operation.mesh then events.clearCSG()

            meshPanel.find("#join.operation").attr "src", "/app/imgs/panels/ops/disabled/join.png"
            meshPanel.find("#cut.operation").attr "src", "/app/imgs/panels/ops/disabled/cut.png"
            meshPanel.find("#intersect.operation").attr "src", "/app/imgs/panels/ops/disabled/intersect.png"

            meshPanel.find("#name span").addClass "disabled"
            meshPanel.find(".operation").addClass "disabled"
            meshPanel.find(".color").addClass "disabled"

            meshPanel.find("#eye").addClass "disabled"
            meshPanel.find("#visibility").addClass("disabled").slider "disable"
            meshPanel.find("#lock").attr "src", "/app/imgs/panels/lock/locked.png"
            meshPanel.find("#trash").addClass "disabled"

            sliderStyle meshPanel.find "#visibility"

            meshPanel.find("input").addClass "disabled"
            meshPanel.find("button").addClass "disabled"

            meshesTableRow.find(".name span").addClass "disabled"
            meshesTableRow.find(".lock").attr "src", "/app/imgs/panels/lock/locked.png"
            meshesTableRow.find(".trash").addClass "disabled"

        else

            composer.outlinePass.visibleEdgeColor.set blackThree

            meshPanel.find("#join.operation").attr "src", "/app/imgs/panels/ops/default/join.png"
            meshPanel.find("#cut.operation").attr "src", "/app/imgs/panels/ops/default/cut.png"
            meshPanel.find("#intersect.operation").attr "src", "/app/imgs/panels/ops/default/intersect.png"

            meshPanel.find("#name span").removeClass "disabled"
            meshPanel.find(".operation").removeClass "disabled"
            meshPanel.find(".color").removeClass "disabled"

            meshPanel.find("#eye").removeClass "disabled"
            meshPanel.find("#visibility").removeClass("disabled").slider "enable"
            meshPanel.find("#lock").attr "src", "/app/imgs/panels/lock/unlocked.png"
            meshPanel.find("#trash").removeClass "disabled"

            sliderStyle meshPanel.find "#visibility"

            meshPanel.find("input").removeClass "disabled"
            meshPanel.find("button").removeClass "disabled"

            meshesTableRow.find(".name span").removeClass "disabled"
            meshesTableRow.find(".lock").attr "src", "/app/imgs/panels/lock/unlocked.png"
            meshesTableRow.find(".trash").removeClass "disabled"

        if save then this.save "update"

        return this

    toggleLock: ->

        this.setLock not this.getLock()

        return this

    getColor: ->

        return clone this.material.getColor()

    setColor: (color = blackThree, save = true) ->

        if not this.getLock()

            this.params.color = color

            depthMaterial = this.params.material is "depth"
            normalMaterial = this.params.material is "normal"
            distanceMaterial = this.params.material is "distance"

            if depthMaterial or normalMaterial or distanceMaterial

                this.setMaterial "standard", false

            if this.params.color is "multi"

                this.setMaterial "normal", false

            this.material.setColor this.params.color

            if save then this.save "update"

        return this

    getTransparent: ->

        return clone this.material.getTransparent()

    setTransparent: (transparent = true, save = true) ->

        if not this.getLock()

            this.params.transparent = Boolean transparent
            this.material.setTransparent this.params.transparent

            # panel stuff here

            if save then this.save "update"

        return this

    getOpacity: ->

        return clone this.material.getOpacity()

    setOpacity: (opacity = 100, save = true) ->

        if not this.getLock()

            this.params.opacity = Number opacity
            this.material.setOpacity this.params.opacity

            # panel = $("#mesh." + this.uuid + "")
            # slider = panel.find "#visibility.slider"
            # visibility = if opacity < 50 then "hidden" else "visible"

            # panel.find("#eye").attr "src", "/app/imgs/panels/visibility/" + visibility + ".png"

            # slider.slider "value", opacity
            # sliderFill slider

            if save then this.save "update"

        return this

    getPosition: ->

        return vectorAdaptor "convert", "length", clone this.position

    setPosition: (position, save = true) ->

        if not this.getLock()

            if this.panel then this.panel.setPosition position

            this.position.x = adaptor "invert", "length", position.x
            this.position.y = adaptor "invert", "length", position.y
            this.position.z = adaptor "invert", "length", position.z

            if save then this.save "update"

        return this

    getPositionX: ->

        return adaptor "convert", "length", clone this.position.x

    setPositionX: (x, save = true) ->

        if not this.getLock()

            # if this.panel then this.panel.setPositionX x

            this.position.x = adaptor "invert", "length", x

            if save then this.save "update"

        return this

    getPositionY: ->

        return adaptor "convert", "length", clone this.position.y

    setPositionY: (y, save = true) ->

        if not this.getLock()

            # if this.panel then this.panel.setPositionY y

            this.position.y = adaptor "invert", "length", y

            if save then this.save "update"

        return this

    getPositionZ: ->

        return adaptor "convert", "length", clone this.position.z

    setPositionZ: (z, save = true) ->

        if not this.getLock()

            # if this.panel then this.panel.setPositionZ z

            this.position.z = adaptor "invert", "length", z

            if save then this.save "update"

        return this

    getRotation: ->

        return clone this.rotation

    setRotation: (rotation, save = true) ->

        if not this.getLock()

            this.rotation.x = rotation.x
            this.rotation.y = rotation.y
            this.rotation.z = rotation.z

            this.updateMatrix()

            if save then this.save "update"

        return this

    getRotationX: ->

        return clone this.rotation.x

    setRotationX: (x, save = true) ->

        if not this.getLock()

            this.rotation.x = x

            this.updateMatrix()

            if save then this.save "update"

        return this

    getRotationY: ->

        return clone this.rotation.x

    setRotationY: (y, save = true) ->

        if not this.getLock()

            this.rotation.y = y

            this.updateMatrix()

            if save then this.save "update"

        return this

    getRotationZ: ->

        return clone this.rotation.x

    setRotationZ: (z, save = true) ->

        if not this.getLock()

            this.rotation.z = z

            this.updateMatrix()

            if save then this.save "update"

        return this

    getScale: ->

        scale = clone this.scale

        scale.x *= 100
        scale.y *= 100
        scale.z *= 100

        return scale

    setScale: (scale, save = true) ->

        if not this.getLock()

            this.scale.x = scale.x / 100
            this.scale.y = scale.y / 100
            this.scale.z = scale.z / 100

            this.updateMetrics()

            if save then this.save "update"

        return this

    getScaleX: ->

        return clone this.scale.x * 100

    setScaleX: (x, save = true) ->

        if not this.getLock()

            this.scale.x = x / 100

            this.updateMetrics()

            if save then this.save "update"

        return this

    getScaleY: ->

        return clone this.scale.y * 100

    setScaleY: (y, save = true) ->

        if not this.getLock()

            this.scale.y = y / 100

            this.updateMetrics()

            if save then this.save "update"

        return this

    getScaleZ: ->

        return clone this.scale.z * 100

    setScaleZ: (z, save = true) ->

        if not this.getLock()

            this.scale.z = z / 100

            this.updateMetrics()

            if save then this.save "update"

        return this

    updateMetrics: ->

        this.updateMatrix()

        this.geometry.setVolume()
        this.geometry.setSurface()

        panel = $ "#mesh." + this.uuid + ""
        controls = panel.find "#meta.controls"

        controls.find("#type span").text this.class.replace("-", " ").replace(/\b\w/g, (char) -> return char.toUpperCase())
        controls.find("#surface span").text this.geometry.surface.toFixed 2
        controls.find("#volume span").text this.geometry.volume.toFixed 2

        return this

    save: (method) ->

        this.updateMatrix()

        storage = if client then serverStore else localStore

        switch method

            when "add"

                storage.addMesh this

            when "update"

                storage.updateMesh this

            when "remove"

                storage.removeMesh this

        return this
