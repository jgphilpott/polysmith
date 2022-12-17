class Mesh

    constructor : (type, params = {}) ->

        @type = lower type.trim()

        switch this.type

            when "box"

                @mesh = new POLY.BoxMesh params; break

            when "cylinder"

                @mesh = new POLY.CylinderMesh params; break

            when "sphere"

                @mesh = new POLY.SphereMesh params; break

            when "octahedron"

                @mesh = new POLY.OctahedronMesh params; break

            when "dodecahedron"

                @mesh = new POLY.DodecahedronMesh params; break

            when "icosahedron"

                @mesh = new POLY.IcosahedronMesh params; break

            when "triangular-prism"

                @mesh = new POLY.TriangularPrismMesh params; break

            when "rectangular-prism"

                @mesh = new POLY.RectangularPrismMesh params; break

            when "pentagonal-prism"

                @mesh = new POLY.PentagonalPrismMesh params; break

            when "hexagonal-prism"

                @mesh = new POLY.HexagonalPrismMesh params; break

            when "heptagonal-prism"

                @mesh = new POLY.HeptagonalPrismMesh params; break

            when "octagonal-prism"

                @mesh = new POLY.OctagonalPrismMesh params; break

            when "nonagonal-prism"

                @mesh = new POLY.NonagonalPrismMesh params; break

            when "decagonal-prism"

                @mesh = new POLY.DecagonalPrismMesh params; break

            when "cylindrical-prism"

                @mesh = new POLY.CylindricalPrismMesh params; break

            when "triangular-pyramid"

                @mesh = new POLY.TriangularPyramidMesh params; break

            when "rectangular-pyramid"

                @mesh = new POLY.RectangularPyramidMesh params; break

            when "pentagonal-pyramid"

                @mesh = new POLY.PentagonalPyramidMesh params; break

            when "hexagonal-pyramid"

                @mesh = new POLY.HexagonalPyramidMesh params; break

            when "heptagonal-pyramid"

                @mesh = new POLY.HeptagonalPyramidMesh params; break

            when "octagonal-pyramid"

                @mesh = new POLY.OctagonalPyramidMesh params; break

            when "nonagonal-pyramid"

                @mesh = new POLY.NonagonalPyramidMesh params; break

            when "decagonal-pyramid"

                @mesh = new POLY.DecagonalPyramidMesh params; break

            when "cone"

                @mesh = new POLY.ConeMesh params; break

            when "capsule"

                @mesh = new POLY.CapsuleMesh params; break

            when "image"

                @mesh = new POLY.ImageMesh params; break

            when "knot"

                @mesh = new POLY.KnotMesh params; break

            when "text"

                @mesh = new POLY.TextMesh params; break

            when "torus"

                @mesh = new POLY.TorusMesh params; break

            when "tube"

                @mesh = new POLY.TubeMesh params; break

            when "circle"

                @mesh = new POLY.CircleMesh params; break

            when "plane"

                @mesh = new POLY.PlaneMesh params; break

            when "triangle"

                @mesh = new POLY.TriangleMesh params; break

            when "quadrilateral"

                @mesh = new POLY.QuadrilateralMesh params; break

            when "pentagon"

                @mesh = new POLY.PentagonMesh params; break

            when "hexagon"

                @mesh = new POLY.HexagonMesh params; break

            when "heptagon"

                @mesh = new POLY.HeptagonMesh params; break

            when "octagon"

                @mesh = new POLY.OctagonMesh params; break

            when "nonagon"

                @mesh = new POLY.NonagonMesh params; break

            when "decagon"

                @mesh = new POLY.DecagonMesh params; break

            when "ring"

                @mesh = new POLY.RingMesh params; break

            when "line"

                @mesh = new POLY.LineMesh params; break

            when "stroke"

                @mesh = new POLY.StrokeMesh params; break

            else

                @mesh = params.mesh

        this.mesh.save = this.save
        this.mesh.morph = this.morph

        this.mesh.getName = this.getName
        this.mesh.setName = this.setName

        this.mesh.getLock = this.getLock
        this.mesh.setLock = this.setLock
        this.mesh.toggleLock = this.toggleLock

        this.mesh.getColor = this.getColor
        this.mesh.setColor = this.setColor

        this.mesh.getOpacity = this.getOpacity
        this.mesh.setOpacity = this.setOpacity

        this.mesh.getPosition = this.getPosition
        this.mesh.setPosition = this.setPosition

        this.mesh.getRotation = this.getRotation
        this.mesh.setRotation = this.setRotation

        this.updateMatrix = this.mesh.updateMatrix
        this.mesh.updateMetrics = this.updateMetrics
        this.mesh.updateParams = this.updateParams

        this.mesh.addEvents = this.addEvents
        this.mesh.removeEvents = this.removeEvents

        this.mesh.add = this.add
        this.mesh.remove = this.remove

        if params.position then this.mesh.setPosition params.position
        if params.rotation then this.mesh.setRotation params.rotation

        this.mesh.lock = if "lock" of params then params.lock else if this.mesh.lock then this.mesh.lock else false
        this.mesh.name = if "name" of params then params.name else if this.mesh.name then this.mesh.name else "Unnamed"
        this.mesh.class = if "class" of params then params.class else if this.mesh.class then this.mesh.class else "custom"

        this.mesh.material.style = if "style" of params then params.style else if this.mesh.material.style then this.mesh.material.style else "multi"
        this.mesh.material.wireframe = if "wireframe" of params then params.wireframe else if this.mesh.material.wireframe then this.mesh.material.wireframe else false

        return this.mesh

    save : (method) ->

        store = if client then serverStore else localStore

        switch method

            when "add"

                store.addMesh this

            when "update"

                store.updateMesh this

            when "remove"

                store.removeMesh this

    morph : (key = null, value = null, save = false) ->

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
                    events.operation.mesh.geometry = morphed.geometry

                    events.operation.mesh.updateMetrics()
                    localStore.updateMesh events.operation.mesh

                    $("#mesh." + events.operation.mesh.uuid + " #properties.controls").remove()

            $("#canvas").css "cursor", ""

            events.operation.mesh = null
            events.operation.key = null

    getName : () ->

        return this.name

    setName : (key = null, value = null, save = false) ->

        if not this.getLock()

            value = value.trim()

            this.name = value

            if save then this.save "update"

            meshPanelName = $ "#mesh." + this.uuid + " #name span"
            meshesPanelName = $ "#meshes.table tr#" + this.uuid + " .name span"

            if meshPanelName[0] and key isnt "mesh" then meshPanelName[0].innerText = value
            if meshesPanelName[0] and key isnt "meshes" then meshesPanelName[0].innerText = value

            if value is "" and key isnt "mesh" then meshPanelName.css("display", "none") else meshPanelName.css("display", "block")

    getLock : () ->

        return this.lock

    setLock : (lock, save = true) ->

        this.lock = Boolean lock

        meshPanel = $("#mesh." + this.uuid + "")
        meshesTableRow = $("#meshes.table tr#" + this.uuid + "")

        if this.getLock()

            composer.outlinePass.visibleEdgeColor.set redThree

            if this is events.operation.mesh then clearMeshOperation()

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

    toggleLock : () ->

        this.setLock not this.getLock()

    getColor : () ->

        return this.material.color

    setColor : (color, save = true) ->

        if not this.getLock()

            opacity = this.getOpacity()
            wireframe = this.material.wireframe
            material = if color is "multi" then "normal" else "standard"

            $("#mesh." + this.uuid + "").find(".color").removeClass "selected"
            $("#mesh." + this.uuid + "").find("#" + color + ".color").addClass "selected"

            if ["red", "orange", "yellow", "green", "blue", "purple", "pink"].includes color

                colorThree = rainbowThree[color + "Three"]

            else if ["white", "gray", "black"].includes color

                colorThree = grayscaleThree[color + "Three"]

            else

                colorThree = blackThree

            this.material.dispose()
            this.material = new MeshMaterial material, color: colorThree
            this.material.opacity = opacity / 100
            this.material.wireframe = wireframe
            this.material.style = color

            if save then this.save "update"

    getOpacity : () ->

        return this.material.opacity * 100

    setOpacity : (opacity, save = true) ->

        if not this.getLock()

            this.material.opacity = opacity / 100

            panel = $("#mesh." + this.uuid + "")
            slider = panel.find "#visibility.slider"
            visibility = if opacity < 50 then "hidden" else "visible"

            panel.find("#eye").attr "src", "/app/imgs/panels/visibility/" + visibility + ".png"

            slider.slider "value", opacity
            sliderFill slider

            if save then this.save "update"

    getPosition : () ->

        return this.position

    setPosition : (position) ->

        this.position.x = position.x
        this.position.y = position.y
        this.position.z = position.z

    getRotation : () ->

        return this.rotation

    setRotation : (rotation) ->

        this.rotation.x = rotation.x
        this.rotation.y = rotation.y
        this.rotation.z = rotation.z

    updateMetrics : () ->

        this.updateMatrix()

        this.geometry.setVolume()
        this.geometry.setSurface()

        panel = $ "#mesh." + this.uuid + ""
        controls = panel.find "#meta.controls"

        controls.find("#type span").text this.class.replace("-", " ").replace(/\b\w/g, (char) -> return char.toUpperCase())
        controls.find("#surface span").text this.geometry.surface.toFixed 2
        controls.find("#volume span").text this.geometry.volume.toFixed 2

    updateParams : (type = null, key = null, value = null, save = false) ->

        if not this.getLock()

            panel = $("#mesh." + this.uuid + "")

            input = panel.find "span#" + type + "-" + key + " input"

            min = Number input.attr "min"
            max = Number input.attr "max"

            value = if value < min then min else if value > max then max else if key.includes("segments") then value.toFixed(0) else value

            if save is "temp" or key.includes("segments") or value is min or value is max then input.val value

            switch type

                when "properties"

                    this.geometry.dispose()

                    parameters = this.geometry.parameters

                    if this.class is "box"

                        if key is "length" then parameters.width = value
                        if key is "width" then parameters.height = value
                        if key is "height" then parameters.depth = value

                        this.geometry = new BoxGeometry parameters

                    else if this.class is "sphere"

                        if key is "radius" then parameters.radius = value
                        if key is "width-segments" then parameters.widthSegments = value
                        if key is "height-segments" then parameters.heightSegments = value

                        this.geometry = new SphereGeometry parameters

                    else if this.class is "cylinder" or this.class.split("-")[1] is "prism"

                        if key is "length" then parameters.length = value
                        if key is "radius-positive" then parameters.radiusTop = value
                        if key is "radius-negative" then parameters.radiusBottom = value
                        if key is "radius-segments" then parameters.radialSegments = value

                        this.geometry = new CylinderGeometry parameters

                    else if this.class is "cone" or this.class.split("-")[1] is "pyramid"

                        if key is "height" then parameters.height = value
                        if key is "radius" then parameters.radius = value
                        if key is "radius-segments" then parameters.radialSegments = value

                        this.geometry = new CylinderGeometry parameters

                    else if this.class is "torus"

                        if key is "radius" then parameters.radius = value
                        if key is "thickness" then parameters.thickness = value
                        if key is "radius-segments" then parameters.radialSegments = value
                        if key is "tube-segments" then parameters.tubularSegments = value

                        this.geometry = new TorusGeometry parameters

                    this.updateMetrics()

                    break

                when "position"

                    this[type][key] = value

                    this.updateMatrix()

                    break

                when "rotation"

                    this[type][key] = deg$rad value

                    this.updateMatrix()

                    break

                when "scale"

                    this[type][key] = value

                    this.updateMetrics()

                    break

            if save is true then this.save "update"

    addEvents : (self = this) ->

        events.addEventListener self, "mouseover", (event) ->

            if settings.getSetting "ui", "metabox"

                metabox.draw "draw", self, event.origDomEvent

        events.addEventListener self, "mousemove", (event) ->

            if events.operation.key

                if events.operation.mesh.uuid is self.uuid

                    composer.outlinePass.visibleEdgeColor.set redThree
                    $("#canvas").css "cursor", "not-allowed"

                else

                    composer.outlinePass.visibleEdgeColor.set greenThree
                    $("#canvas").css "cursor", "copy"

            else

                if self.getLock()

                    composer.outlinePass.visibleEdgeColor.set redThree
                    $("#canvas").css "cursor", "not-allowed"

                else

                    composer.outlinePass.visibleEdgeColor.set blackThree
                    $("#canvas").css "cursor", "grab"

            composer.outlinePass.selectedObjects = [self]

            if settings.getSetting "ui", "metabox"

                metabox.draw "update", self, event.origDomEvent

        events.addEventListener self, "mouseout", (event) ->

            if events.operation.key then $("#canvas").css "cursor", "copy" else $("#canvas").css "cursor", ""

            composer.outlinePass.selectedObjects = []

            metabox.erase()

        events.addEventListener self, "mousedown", (event) ->

            if not self.getLock() then makeDragable self, event.origDomEvent

        events.addEventListener self, "click", (event) ->

            event.origDomEvent.stopImmediatePropagation()

            if not camera.dragged

                if events.operation.key

                    self.morph events.operation.key, null, true

                else if tooltips.getSelected() isnt self

                    tooltips.setSelected self

        events.addEventListener self, "dblclick", (event) ->

            if camera.focus self.position

                $("#canvas").css "cursor", ""

        events.addEventListener self, "contextmenu", (event) ->

            contextMenu "mesh", self, event.origDomEvent

    removeEvents : (self = this) ->

        events.removeEventListener self, "mouseover"
        events.removeEventListener self, "mousemove"
        events.removeEventListener self, "mouseout"
        events.removeEventListener self, "mousedown"

        events.removeEventListener self, "click"
        events.removeEventListener self, "dblclick"
        events.removeEventListener self, "contextmenu"

    add : () ->

        this.addEvents()
        this.updateMetrics()

        updateMeshesPanel "add", this

        this.save "add"
        scene.add this

    remove : () ->

        if not this.getLock()

            this.removeEvents()

            $("body").css "cursor", ""
            $("#canvas").css "cursor", ""

            if events.operation.mesh is this then clearMeshOperation()

            updateMeshesPanel "remove", this

            this.geometry.dispose()
            this.material.dispose()

            this.save "remove"
            scene.remove this
