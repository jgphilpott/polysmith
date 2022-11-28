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

        this.mesh.getPosition = this.getPosition
        this.mesh.setPosition = this.setPosition

        this.mesh.getRotation = this.getRotation
        this.mesh.setRotation = this.setRotation

        this.mesh.addEvents = this.addEvents
        this.mesh.removeEvents = this.removeEvents

        this.mesh.add = this.add
        this.mesh.remove = this.remove

        if params.position then this.mesh.setPosition params.position
        if params.rotation then this.mesh.setRotation params.rotation

        this.mesh.name = if "name" of params then params.name else if this.mesh.name then this.mesh.name else "Unnamed"
        this.mesh.lock = if "lock" of params then params.lock else if this.mesh.lock then this.mesh.lock else "unlocked"
        this.mesh.class = if "class" of params then params.class else if this.mesh.class then this.mesh.class else "custom"

        this.mesh.material.style = if "style" of params then params.style else if this.mesh.material.style then this.mesh.material.style else "multi"
        this.mesh.material.wireframe = if "wireframe" of params then params.wireframe else if this.mesh.material.wireframe then this.mesh.material.wireframe else false

        return this.mesh

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

    addEvents : (self = this) ->

        events.addEventListener self, "mouseover", (event) ->

            if settings.getSetting "ui", "metabox"

                drawMetabox "draw", self, event.origDomEvent

        events.addEventListener self, "mousemove", (event) ->

            if events.operation.key

                if events.operation.mesh.uuid == self.uuid

                    composer.outlinePass.visibleEdgeColor.set redThree
                    $("#canvas").css "cursor", "not-allowed"

                else

                    composer.outlinePass.visibleEdgeColor.set greenThree
                    $("#canvas").css "cursor", "copy"

            else

                if self.lock == "locked"

                    composer.outlinePass.visibleEdgeColor.set redThree
                    $("#canvas").css "cursor", "not-allowed"

                else

                    composer.outlinePass.visibleEdgeColor.set blackThree
                    $("#canvas").css "cursor", "grab"

            composer.outlinePass.selectedObjects = [self]

            if settings.getSetting "ui", "metabox"

                drawMetabox "update", self, event.origDomEvent

        events.addEventListener self, "mouseout", (event) ->

            if events.operation.key then $("#canvas").css "cursor", "copy" else $("#canvas").css "cursor", ""

            composer.outlinePass.selectedObjects = []

            eraseMetabox()

        events.addEventListener self, "mousedown", (event) ->

            if self.lock != "locked" then makeDragable self, event.origDomEvent

        events.addEventListener self, "click", (event) ->

            event.origDomEvent.stopImmediatePropagation()

            if not camera.dragged

                if events.operation.key

                    updateMesh self, "operation", events.operation.key, null, true

                else if tooltips.getSelected() != self

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
        updateMetrics this

        localStore.addMeshes this
        updateMeshesPanel "add", this

        scene.add this

    remove : () ->

        if this.lock != "locked"

            this.removeEvents()

            $("body").css "cursor", ""
            $("#canvas").css "cursor", ""

            if events.operation.mesh == this then clearMeshOperation()

            updateMeshesPanel "remove", this
            localStore.removeMeshes this

            this.geometry.dispose()
            this.material.dispose()

            scene.remove this

###########
### OLD ###
###########

updateMesh = (mesh, type, key = null, value = null, save = false) ->

    panel = $("#mesh." + mesh.uuid + "")

    if type == "name" and mesh.lock != "locked"

        value = value.trim()

        mesh.name = value

        if save then localStore.updateMeshes mesh

        meshPanelName = $ "#mesh." + mesh.uuid + " #name span"
        meshesPanelName = $ "#meshes.table tr#" + mesh.uuid + " .name span"

        if meshPanelName[0] and key != "mesh" then meshPanelName[0].innerText = value
        if meshesPanelName[0] and key != "meshes" then meshesPanelName[0].innerText = value

        if value == "" and key != "mesh" then meshPanelName.css("display", "none") else meshPanelName.css("display", "block")

    else if type == "operation"

        operationIcon = panel.find "#" + key + ".operation"
        operationIcons = $ "#mesh.panel img.operation"

        operationIcons.toArray().forEach (icon) ->

            if !$(icon).hasClass "disabled"

                $(icon).attr "src", "/app/imgs/panels/ops/default/" + icon.id + ".png"

        if value == "setup" and mesh.lock != "locked"

            operationIcon.attr "src", "/app/imgs/panels/ops/selected/" + key + ".png"

            $("#canvas").css "cursor", "copy"

            events.operation.mesh = mesh
            events.operation.key = key

        else if events.operation.key and !camera.dragged

            if events.operation.mesh.uuid != mesh.uuid

                morphed = morph key, events.operation.mesh, mesh

                if morphed

                    morphed.geometry = new Geometry "custom", geometry: morphed.geometry

                    events.operation.mesh.class = "custom"
                    events.operation.mesh.geometry = morphed.geometry

                    updateMetrics events.operation.mesh
                    localStore.updateMeshes events.operation.mesh

                    $("#mesh." + events.operation.mesh.uuid + " #properties.controls").remove()

            $("#canvas").css "cursor", ""

            events.operation.mesh = null
            events.operation.key = null

    else if type == "color" and mesh.lock != "locked"

        color = null
        opacity = mesh.material.opacity
        wireframe = mesh.material.wireframe
        material = if value == "multi" then "normal" else "standard"

        panel.find(".color").removeClass "selected"
        panel.find("#" + value + ".color").addClass "selected"

        if ["red", "orange", "yellow", "green", "blue", "purple", "pink"].includes value
            color = rainbowThree[value + "Three"]
        else if ["white", "gray", "black"].includes value
            color = grayscaleThree[value + "Three"]
        else
            color = blackThree

        mesh.material.dispose()
        mesh.material = new MeshMaterial material, color: color
        mesh.material.wireframe = wireframe
        mesh.material.opacity = opacity
        mesh.material.style = value

        if save then localStore.updateMeshes mesh

    else if type == "visibility" and mesh.lock != "locked"

        if key == "eye"

            visibility = /[^/]*$/.exec(value)[0].split(".")[0]
            slider = panel.find "#visibility.slider"

            if visibility == "visible"

                panel.find("#eye").attr "src", "/app/imgs/panels/visibility/hidden.png"

                mesh.material.opacity = 0

                slider.slider "value", 0
                sliderFill slider

            else if visibility == "hidden"

                panel.find("#eye").attr "src", "/app/imgs/panels/visibility/visible.png"

                mesh.material.opacity = 1

                slider.slider "value", 100
                sliderFill slider

        if save then localStore.updateMeshes mesh

    else if type == "lock"

        meshPanel = $ "#mesh." + mesh.uuid + ""
        meshesTableRow = $ "#meshes.table tr#" + mesh.uuid + ""

        if mesh.lock == "locked"

            mesh.lock = "unlocked"

            composer.outlinePass.visibleEdgeColor.set blackThree

            meshPanel.find("#join.operation").attr "src", "/app/imgs/panels/ops/default/join.png"
            meshPanel.find("#cut.operation").attr "src", "/app/imgs/panels/ops/default/cut.png"
            meshPanel.find("#intersect.operation").attr "src", "/app/imgs/panels/ops/default/intersect.png"

            meshPanel.find("#name span").removeClass "disabled"
            meshPanel.find(".operation").removeClass "disabled"
            meshPanel.find(".color").removeClass "disabled"

            meshPanel.find("#eye").removeClass "disabled"
            meshPanel.find("#visibility").removeClass("disabled").slider "enable"
            meshPanel.find("#lock").attr "src", "/app/imgs/panels/lock/" + mesh.lock + ".png"
            meshPanel.find("#trash").removeClass "disabled"

            sliderStyle meshPanel.find "#visibility"

            meshPanel.find("input").removeClass "disabled"
            meshPanel.find("button").removeClass "disabled"

            meshesTableRow.find(".name span").removeClass "disabled"
            meshesTableRow.find(".lock").attr "src", "/app/imgs/panels/lock/" + mesh.lock + ".png"
            meshesTableRow.find(".trash").removeClass "disabled"

        else if mesh.lock == "unlocked"

            mesh.lock = "locked"

            composer.outlinePass.visibleEdgeColor.set redThree

            if events.operation.mesh == mesh then clearMeshOperation()

            meshPanel.find("#join.operation").attr "src", "/app/imgs/panels/ops/disabled/join.png"
            meshPanel.find("#cut.operation").attr "src", "/app/imgs/panels/ops/disabled/cut.png"
            meshPanel.find("#intersect.operation").attr "src", "/app/imgs/panels/ops/disabled/intersect.png"

            meshPanel.find("#name span").addClass "disabled"
            meshPanel.find(".operation").addClass "disabled"
            meshPanel.find(".color").addClass "disabled"

            meshPanel.find("#eye").addClass "disabled"
            meshPanel.find("#visibility").addClass("disabled").slider "disable"
            meshPanel.find("#lock").attr "src", "/app/imgs/panels/lock/" + mesh.lock + ".png"
            meshPanel.find("#trash").addClass "disabled"

            sliderStyle meshPanel.find "#visibility"

            meshPanel.find("input").addClass "disabled"
            meshPanel.find("button").addClass "disabled"

            meshesTableRow.find(".name span").addClass "disabled"
            meshesTableRow.find(".lock").attr "src", "/app/imgs/panels/lock/" + mesh.lock + ".png"
            meshesTableRow.find(".trash").addClass "disabled"

        localStore.updateMeshes mesh

    else if (type == "properties" or type == "position" or type == "rotation" or type == "scale") and mesh.lock != "locked"

        input = panel.find "span#" + type + "-" + key + " input"

        min = Number input.attr "min"
        max = Number input.attr "max"

        value = if value < min then min else if value > max then max else if key.includes("segments") then value.toFixed(0) else value

        if save == "temp" or key.includes("segments") or value == min or value == max then input.val value

        switch type

            when "properties"

                mesh.geometry.dispose()

                parameters = mesh.geometry.parameters

                if mesh.class == "box"

                    if key == "length" then parameters.width = value
                    if key == "width" then parameters.height = value
                    if key == "height" then parameters.depth = value

                    mesh.geometry = new BoxGeometry parameters

                else if mesh.class == "sphere"

                    if key == "radius" then parameters.radius = value
                    if key == "width-segments" then parameters.widthSegments = value
                    if key == "height-segments" then parameters.heightSegments = value

                    mesh.geometry = new SphereGeometry radius, widthSegments, heightSegments

                else if mesh.class == "cylinder" or mesh.class.split("-")[1] == "prism"

                    if key == "length" then parameters.length = value
                    if key == "radius-positive" then parameters.radiusTop = value
                    if key == "radius-negative" then parameters.radiusBottom = value
                    if key == "radius-segments" then parameters.radialSegments = value

                    mesh.geometry = new CylinderGeometry positiveRadius, negativeRadius, length, radialSegments

                else if mesh.class == "cone" or mesh.class.split("-")[1] == "pyramid"

                    if key == "height" then parameters.height = value
                    if key == "radius" then parameters.radius = value
                    if key == "radius-segments" then parameters.radialSegments = value

                    mesh.geometry = new CylinderGeometry 0, radius, height, radialSegments

                else if mesh.class == "torus"

                    if key == "radius" then parameters.radius = value
                    if key == "thickness" then parameters.thickness = value
                    if key == "radius-segments" then parameters.radialSegments = value
                    if key == "tube-segments" then parameters.tubularSegments = value

                    mesh.geometry = new TorusGeometry radius, thickness, radialSegments, tubularSegments

                updateMetrics mesh

                break

            when "position"

                mesh[type][key] = value

                mesh.updateMatrix()

                break

            when "rotation"

                mesh[type][key] = deg$rad value

                mesh.updateMatrix()

                break

            when "scale"

                mesh[type][key] = value

                updateMetrics mesh

                break

        if save == true then localStore.updateMeshes mesh
