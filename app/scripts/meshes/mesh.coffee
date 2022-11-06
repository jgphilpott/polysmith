addMesh = (mesh = null, properties = {}) ->

    if !mesh and properties.class

        switch properties.class

            when "box"

                mesh = newBox()
                mesh.rotation.x = deg$rad 0

                break

            when "cylinder"

                mesh = newCylinder()
                mesh.rotation.x = deg$rad 90

                break

            when "sphere"

                mesh = newSphere()
                mesh.rotation.x = deg$rad 90

                break

            when "triangular-prism"

                mesh = newCylinder 10, 5, 5, 3
                mesh.rotation.x = deg$rad 0

                break

            when "rectangular-prism"

                mesh = newCylinder 10, 5, 5, 4
                mesh.rotation.x = deg$rad 0

                break

            when "pentagonal-prism"

                mesh = newCylinder 10, 5, 5, 5
                mesh.rotation.x = deg$rad 0

                break

            when "hexagonal-prism"

                mesh = newCylinder 10, 5, 5, 6
                mesh.rotation.x = deg$rad 0

                break

            when "heptagonal-prism"

                mesh = newCylinder 10, 5, 5, 7
                mesh.rotation.x = deg$rad 0

                break

            when "octagonal-prism"

                mesh = newCylinder 10, 5, 5, 8
                mesh.rotation.x = deg$rad 0

                break

            when "triangular-pyramid"

                mesh = newCylinder 10, 0, 5, 3
                mesh.rotation.x = deg$rad 90

                break

            when "rectangular-pyramid"

                mesh = newCylinder 10, 0, 5, 4
                mesh.rotation.x = deg$rad 90

                break

            when "pentagonal-pyramid"

                mesh = newCylinder 10, 0, 5, 5
                mesh.rotation.x = deg$rad 90

                break

            when "cone"

                mesh = newCylinder 10, 0, 5, 42
                mesh.rotation.x = deg$rad 90

                break

            when "torus"

                mesh = newTorus()
                mesh.rotation.y = deg$rad 90

                break

            when "text"

                mesh = addText()

                return

            when "image"

                mesh = addImage()

                return

    if mesh

        mesh.name = if "name" in properties then properties.name else if mesh.name then mesh.name else "Unnamed"
        mesh.lock = if "lock" in properties then properties.lock else if mesh.lock then mesh.lock else "unlocked"
        mesh.class = if "class" in properties then properties.class else if mesh.class then mesh.class else "custom"

        mesh.material.style = if "style" in properties then properties.style else if mesh.material.style then mesh.material.style else "multi"
        mesh.material.wireframe = if "wireframe" in properties then properties.wireframe else if mesh.material.wireframe then mesh.material.wireframe else false

        if properties.position

            mesh.position.x = if properties.position.x then properties.position.x else if properties.position._x then properties.position._x else 0
            mesh.position.y = if properties.position.y then properties.position.y else if properties.position._y then properties.position._y else 0
            mesh.position.z = if properties.position.z then properties.position.z else if properties.position._z then properties.position._z else 0

        if properties.rotation

            mesh.rotation.x = if properties.rotation.x then properties.rotation.x else if properties.rotation._x then properties.rotation._x else 0
            mesh.rotation.y = if properties.rotation.y then properties.rotation.y else if properties.rotation._y then properties.rotation._y else 0
            mesh.rotation.z = if properties.rotation.z then properties.rotation.z else if properties.rotation._z then properties.rotation._z else 0

        updateMetrics mesh
        addMeshEvents mesh

        localStore.addMeshes mesh
        updateMeshesPanel "add", mesh

        scene.add mesh

    return mesh

addMeshEvents = (mesh) ->

    events.addEventListener mesh, "mouseover", (event) ->

        if settings.getSetting "ui", "metabox"

            drawMetabox "draw", mesh, event.origDomEvent

    events.addEventListener mesh, "mousemove", (event) ->

        if events.operation.key

            if events.operation.mesh.uuid == mesh.uuid then composer.outlinePass.visibleEdgeColor.set redThree else composer.outlinePass.visibleEdgeColor.set greenThree
            if events.operation.mesh.uuid == mesh.uuid then $("#canvas").css "cursor", "not-allowed" else $("#canvas").css "cursor", "copy"


        else

            if mesh.lock == "locked" then composer.outlinePass.visibleEdgeColor.set redThree else composer.outlinePass.visibleEdgeColor.set blackThree
            if mesh.lock == "locked" then $("#canvas").css "cursor", "not-allowed" else $("#canvas").css "cursor", "grab"

        composer.outlinePass.selectedObjects = [mesh]

        if settings.getSetting "ui", "metabox"

            drawMetabox "update", mesh, event.origDomEvent

    events.addEventListener mesh, "mouseout", (event) ->

        if events.operation.key then $("#canvas").css "cursor", "copy" else $("#canvas").css "cursor", ""

        composer.outlinePass.selectedObjects = []

        eraseMetabox()

    events.addEventListener mesh, "mousedown", (event) ->

        if mesh.lock != "locked" then makeDragable mesh, event.origDomEvent

    events.addEventListener mesh, "click", (event) ->

        event.origDomEvent.stopImmediatePropagation()

        if not camera.dragged

            if events.operation.key

                updateMesh mesh, "operation", events.operation.key, null, true

            else if tooltips.getSelected() != mesh

                tooltips.setSelected mesh

    events.addEventListener mesh, "dblclick", (event) ->

        if camera.focus mesh.position

            $("#canvas").css "cursor", ""

    events.addEventListener mesh, "contextmenu", (event) ->

        contextMenu "mesh", mesh, event.origDomEvent

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
        mesh.material = new MeshMaterial material, color
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

                    length = if key == "length" then value else parameters.width
                    width = if key == "width" then value else parameters.height
                    height = if key == "height" then value else parameters.depth

                    mesh.geometry = new THREE.BoxGeometry length, width, height

                else if mesh.class == "sphere"

                    radius = if key == "radius" then value else parameters.radius
                    widthSegments = if key == "width-segments" then value else parameters.widthSegments
                    heightSegments = if key == "height-segments" then value else parameters.heightSegments

                    mesh.geometry = new THREE.SphereGeometry radius, widthSegments, heightSegments

                else if mesh.class == "cylinder" or mesh.class.split("-")[1] == "prism"

                    length = if key == "length" then value : parameters.height
                    positiveRadius = if key == "radius-positive" then value else parameters.radiusTop
                    negativeRadius = if key == "radius-negative" then value else parameters.radiusBottom
                    radialSegments = if key == "radius-segments" then value else parameters.radialSegments

                    mesh.geometry = new THREE.CylinderGeometry positiveRadius, negativeRadius, length, radialSegments

                else if mesh.class == "cone" or mesh.class.split("-")[1] == "pyramid"

                    height = if key == "height" then value else parameters.height
                    radius = if key == "radius" then value else parameters.radiusBottom
                    radialSegments = if key == "radius-segments" then value else parameters.radialSegments

                    mesh.geometry = new THREE.CylinderGeometry 0, radius, height, radialSegments

                else if mesh.class == "torus"

                    radius = if key == "radius" then value else parameters.radius
                    thickness = if key == "thickness" then value else parameters.tube
                    radialSegments = if key == "radius-segments" then value else parameters.radialSegments
                    tubularSegments = if key == "tube-segments" then value else parameters.tubularSegments

                    mesh.geometry = new THREE.TorusGeometry radius, thickness, radialSegments, tubularSegments

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

removeMesh = (mesh) ->

    if mesh.lock != "locked"

        $("body").css "cursor", ""
        $("#canvas").css "cursor", ""

        events.removeEventListener mesh, "mouseover"
        events.removeEventListener mesh, "mousemove"
        events.removeEventListener mesh, "mouseout"
        events.removeEventListener mesh, "mousedown"

        events.removeEventListener mesh, "click"
        events.removeEventListener mesh, "dblclick"
        events.removeEventListener mesh, "contextmenu"

        if events.operation.mesh == mesh then clearMeshOperation()

        updateMeshesPanel "remove", mesh
        localStore.removeMeshes mesh

        mesh.geometry.dispose()
        mesh.material.dispose()

        scene.remove mesh