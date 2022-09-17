addMeshPanel = (mesh, coordinates = null) ->

    panel = $("#mesh." + mesh.uuid + "")

    if panel.length == 0

        $("body").append "<div id='mesh' class='panel " + mesh.uuid + "'><img title='Close' class='close' src='/app/imgs/panels/nav/close.png'></div>"

        holdTimeout = null
        holdInterval = null

        panel = $("#mesh." + mesh.uuid + "")

        if coordinates then panel.css {left: coordinates.x, top: coordinates.y}

        panel.append "<h3 id='name'><span contenteditable='true'></span></h3>"
        name = panel.find("#name span"); name[0].innerText = mesh.name
        if mesh.name == "" then name.css "display", "none"

        panel.css "z-index", events.zIndex += 1

        panel.data "mesh", mesh

        operations = "<div id='operations' class='controls'>"
        colors = "<div id='colors' class='controls'>"
        tools = "<div id='tools' class='controls'>"
        meta = "<div id='meta' class='controls'>"

        joinStatus = if mesh.lock == "locked" then "disabled" else if events.operation.mesh == mesh and events.operation.key == "join" then "selected" else "default"
        cutStatus = if mesh.lock == "locked" then "disabled" else if events.operation.mesh == mesh and events.operation.key == "cut" then "selected" else "default"
        intersectStatus = if mesh.lock == "locked" then "disabled" else if events.operation.mesh == mesh and events.operation.key == "intersect" then "selected" else "default"

        operations += "<img title='Join' id='join' class='operation' src='/app/imgs/panels/ops/" + joinStatus + "/join.png'>"
        operations += "<img title='Cut' id='cut' class='operation' src='/app/imgs/panels/ops/" + cutStatus + "/cut.png'>"
        operations += "<img title='Intersect' id='intersect' class='operation' src='/app/imgs/panels/ops/" + intersectStatus + "/intersect.png'>"

        colors += "<img title='Multi' id='multi' class='color' src='/app/imgs/panels/tools/colors.png'>"
        colors += "<div title='Red' id='red' class='color'></div>"
        colors += "<div title='Orange' id='orange' class='color'></div>"
        colors += "<div title='Yellow' id='yellow' class='color'></div>"
        colors += "<div title='Green' id='green' class='color'></div>"
        colors += "<div title='Blue' id='blue' class='color'></div>"
        colors += "<div title='Purple' id='purple' class='color'></div>"
        colors += "<div title='Pink' id='pink' class='color'></div>"
        colors += "<div title='White' id='white' class='color'></div>"
        colors += "<div title='Gray' id='gray' class='color'></div>"
        colors += "<div title='Black' id='black' class='color'></div>"

        tools += "<img title='Visibility' id='eye' class='tool' src='/app/imgs/panels/visibility/" + (if mesh.material.opacity < 0.5 then "hidden" else "visible") + ".png'>"
        tools += "<div id='visibility' class='tool slider'></div>"
        tools += "<img title='Lock Mesh' id='lock' class='tool' src='/app/imgs/panels/lock/" + mesh.lock + ".png'>"
        tools += "<img title='Delete Mesh' id='trash' class='tool' src='/app/imgs/panels/tools/trash.png'>"

        meta += "<p id='type'><b>Type:</b> <span>" + mesh.class.replace("-", " ").replace(/\b\w/g, (char) -> char.toUpperCase()) + "</span></p>"
        meta += "<p id='surface'><b>Surface:</b> <span>" + format(mesh.surface, "area", settings.general.unit[settings.general.scale] + "Sq", 2, 0, settings.general.language) + "</span></p>"
        meta += "<p id='volume'><b>Volume:</b> <span>" + format(mesh.volume, "volume", settings.general.unit[settings.general.scale] + "Cu", 2, 0, settings.general.language) + "</span></p>"

        panel.append operations + "</div>"
        panel.append colors + "</div>"
        panel.append tools + "</div>"
        panel.append meta + "</div>"

        panel.find("#" + mesh.material.style + ".color").addClass "selected"

        panel.find("#visibility.slider").slider {min: 0, max: 100, value: mesh.material.opacity * 100, start: sliderStart, slide: sliderSlide, stop: sliderStop}

        geometriesWithProperties = ["box", "cylinder", "sphere", "prism", "pyramid", "cone", "torus"]

        if geometriesWithProperties.includes(mesh.class) or geometriesWithProperties.includes(mesh.class.split("-")[1])

            panel.append "<div id='properties' class='controls'><div class='head'><img title='Fold Properties' class='fold' src='/app/imgs/panels/nav/fold.png'><h4>Properties</h4></div><div class='body'></div></div>"

        panel.append "<div id='position' class='controls'><div class='head'><img title='Fold Position' class='fold' src='/app/imgs/panels/nav/fold.png'><h4>Position</h4></div><div class='body'></div></div>"
        panel.append "<div id='rotation' class='controls'><div class='head'><img title='Fold Rotation' class='fold' src='/app/imgs/panels/nav/fold.png'><h4>Rotation</h4></div><div class='body'></div></div>"
        panel.append "<div id='scale' class='controls'><div class='head'><img title='Fold Scale' class='fold' src='/app/imgs/panels/nav/fold.png'><h4>Scale</h4></div><div class='body'></div></div>"

        properties = panel.find "#properties .body"
        position = panel.find "#position .body"
        rotation = panel.find "#rotation .body"
        scale = panel.find "#scale .body"

        if geometriesWithProperties.includes(mesh.class) or geometriesWithProperties.includes(mesh.class.split("-")[1])

            regularStep = 1
            regularMin = 1
            regularMax = data.scale * 3

            radialStep = 0.5
            radialMin = 0.5
            radialMax = data.scale * 1.5

            segmentsStep = 1
            segmentsMin = 3
            segmentsMax = 100

            if mesh.class == "box"

                properties.append "<span id='properties-length'><label>Length</label> <div class='suffix " + settings.general.unit[settings.general.scale] + "'><input type=number step=" + regularStep + " min=" + regularMin + " max=" + regularMax + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"
                properties.append "<span id='properties-width'><label>Width</label> <div class='suffix " + settings.general.unit[settings.general.scale] + "'><input type=number step=" + regularStep + " min=" + regularMin + " max=" + regularMax + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"
                properties.append "<span id='properties-height'><label>Height</label> <div class='suffix " + settings.general.unit[settings.general.scale] + "'><input type=number step=" + regularStep + " min=" + regularMin + " max=" + regularMax + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"

                properties.find("#properties-length input").val mesh.geometry.parameters.width.toFixed(2)
                properties.find("#properties-width input").val mesh.geometry.parameters.height.toFixed(2)
                properties.find("#properties-height input").val mesh.geometry.parameters.depth.toFixed(2)

            else if mesh.class == "sphere"

                properties.append "<span id='properties-radius'><label><p>Radius</p> <div class='suffix " + settings.general.unit[settings.general.scale] + "'><input type=number step=" + radialStep + " min=" + radialMin + " max=" + radialMax + "></div><button id='plus'>+</button><button id='minus'>-</button></label></span>"
                properties.append "<span id='properties-width-segments'><label><p>Width Segments</p> <input type=number step=" + segmentsStep + " min=" + segmentsMin + " max=" + segmentsMax + "><button id='plus'>+</button><button id='minus'>-</button></label></span>"
                properties.append "<span id='properties-height-segments'><label><p>Height Segments</p> <input type=number step=" + segmentsStep + " min=" + segmentsMin + " max=" + segmentsMax + "><button id='plus'>+</button><button id='minus'>-</button></label></span>"

                properties.find("#properties-radius input").val mesh.geometry.parameters.radius.toFixed(2)
                properties.find("#properties-width-segments input").val mesh.geometry.parameters.widthSegments
                properties.find("#properties-height-segments input").val mesh.geometry.parameters.heightSegments

            else if mesh.class == "cylinder" or mesh.class.split("-")[1] == "prism"

                properties.append "<span id='properties-length'><label><p>Length</p> <div class='suffix " + settings.general.unit[settings.general.scale] + "'><input type=number step=" + regularStep + " min=" + regularMin + " max=" + regularMax + "></div><button id='plus'>+</button><button id='minus'>-</button></label></span>"
                properties.append "<span id='properties-radius-positive'><label><p>Positive Radius</p> <div class='suffix " + settings.general.unit[settings.general.scale] + "'><input type=number step=" + radialStep + " min=" + radialMin + " max=" + radialMax + "></div><button id='plus'>+</button><button id='minus'>-</button></label></span>"
                properties.append "<span id='properties-radius-negative'><label><p>Negative Radius</p> <div class='suffix " + settings.general.unit[settings.general.scale] + "'><input type=number step=" + radialStep + " min=" + radialMin + " max=" + radialMax + "></div><button id='plus'>+</button><button id='minus'>-</button></label></span>"

                properties.find("#properties-length input").val mesh.geometry.parameters.height.toFixed(2)
                properties.find("#properties-radius-positive input").val mesh.geometry.parameters.radiusTop.toFixed(2)
                properties.find("#properties-radius-negative input").val mesh.geometry.parameters.radiusBottom.toFixed(2)

                if mesh.class == "cylinder"

                    properties.append "<span id='properties-radius-segments'><label><p>Radial Segments</p> <input type=number step=" + segmentsStep + " min=" + segmentsMin + " max=" + segmentsMax + "><button id='plus'>+</button><button id='minus'>-</button></label></span>"

                    properties.find("#properties-radius-segments input").val mesh.geometry.parameters.radialSegments

            else if mesh.class.split("-")[1] == "pyramid"

                properties.append "<span id='properties-height'><label>Height</label> <div class='suffix " + settings.general.unit[settings.general.scale] + "'><input type=number step=" + regularStep + " min=" + regularMin + " max=" + regularMax + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"
                properties.append "<span id='properties-radius'><label>Radius</label> <div class='suffix " + settings.general.unit[settings.general.scale] + "'><input type=number step=" + radialStep + " min=" + radialMin + " max=" + radialMax + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"

                properties.find("#properties-height input").val mesh.geometry.parameters.height.toFixed(2)
                properties.find("#properties-radius input").val mesh.geometry.parameters.radiusBottom.toFixed(2)

            else if mesh.class == "cone"

                properties.append "<span id='properties-height'><label><p>Height</p> <div class='suffix " + settings.general.unit[settings.general.scale] + "'><input type=number step=" + regularStep + " min=" + regularMin + " max=" + regularMax + "></div><button id='plus'>+</button><button id='minus'>-</button></label></span>"
                properties.append "<span id='properties-radius'><label><p>Radius</p> <div class='suffix " + settings.general.unit[settings.general.scale] + "'><input type=number step=" + radialStep + " min=" + radialMin + " max=" + radialMax + "></div><button id='plus'>+</button><button id='minus'>-</button></label></span>"
                properties.append "<span id='properties-radius-segments'><label><p>Radial Segments</p> <input type=number step=" + segmentsStep + " min=" + segmentsMin + " max=" + segmentsMax + "><button id='plus'>+</button><button id='minus'>-</button></label></span>"

                properties.find("#properties-height input").val mesh.geometry.parameters.height.toFixed(2)
                properties.find("#properties-radius input").val mesh.geometry.parameters.radiusBottom.toFixed(2)
                properties.find("#properties-radius-segments input").val mesh.geometry.parameters.radialSegments

            else if mesh.class == "torus"

                properties.append "<span id='properties-thickness'><label><p>Thickness</p> <div class='suffix " + settings.general.unit[settings.general.scale] + "'><input type=number step=" + radialStep + " min=" + radialMin + " max=" + radialMax + "></div><button id='plus'>+</button><button id='minus'>-</button></label></span>"
                properties.append "<span id='properties-radius'><label><p>Radius</p> <div class='suffix " + settings.general.unit[settings.general.scale] + "'><input type=number step=" + radialStep + " min=" + radialMin + " max=" + radialMax + "></div><button id='plus'>+</button><button id='minus'>-</button></label></span>"
                properties.append "<span id='properties-tube-segments'><label><p>Tubular Segments</p> <input type=number step=" + segmentsStep + " min=" + segmentsMin + " max=" + segmentsMax + "><button id='plus'>+</button><button id='minus'>-</button></label></span>"
                properties.append "<span id='properties-radius-segments'><label><p>Radial Segments</p> <input type=number step=" + segmentsStep + " min=" + segmentsMin + " max=" + segmentsMax + "><button id='plus'>+</button><button id='minus'>-</button></label></span>"

                properties.find("#properties-thickness input").val mesh.geometry.parameters.tube.toFixed(2)
                properties.find("#properties-radius input").val mesh.geometry.parameters.radius.toFixed(2)
                properties.find("#properties-tube-segments input").val mesh.geometry.parameters.tubularSegments
                properties.find("#properties-radius-segments input").val mesh.geometry.parameters.radialSegments

            if mesh.class == "box" or mesh.class.split("-")[1] == "pyramid"

                properties.find("label").css "width", "45px"
                properties.find("input").css "width", "90px"

            else if mesh.class == "cylinder" or mesh.class == "sphere" or mesh.class == "cone" or mesh.class == "torus" or mesh.class.split("-")[1] == "prism"

                properties.find("label").css "margin", "3px 5px"
                properties.find("label p").css "margin", "0px 5px"
                properties.find("label p").css "text-align", "left"
                properties.find("input").css "width", "145px"

        positionStep = 1
        positionMin = - data.scale * 3
        positionMax = data.scale * 3

        rotationStep = 1
        rotationMin = - 360
        rotationMax = 360

        scaleStep = 0.1
        scaleMin = 0
        scaleMax = 100

        position.append "<span id='position-x'><label id='x'>X</label> <div class='suffix " + settings.general.unit[settings.general.scale] + "'><input type=number step=" + positionStep + " min=" + positionMin + " max=" + positionMax + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"
        position.append "<span id='position-y'><label id='y'>Y</label> <div class='suffix " + settings.general.unit[settings.general.scale] + "'><input type=number step=" + positionStep + " min=" + positionMin + " max=" + positionMax + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"
        position.append "<span id='position-z'><label id='z'>Z</label> <div class='suffix " + settings.general.unit[settings.general.scale] + "'><input type=number step=" + positionStep + " min=" + positionMin + " max=" + positionMax + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"

        rotation.append "<span id='rotation-x'><label id='x'>X</label> <div class='suffix degree'><input type=number step=" + rotationStep + " min=" + rotationMin + " max=" + rotationMax + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"
        rotation.append "<span id='rotation-y'><label id='y'>Y</label> <div class='suffix degree'><input type=number step=" + rotationStep + " min=" + rotationMin + " max=" + rotationMax + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"
        rotation.append "<span id='rotation-z'><label id='z'>Z</label> <div class='suffix degree'><input type=number step=" + rotationStep + " min=" + rotationMin + " max=" + rotationMax + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"

        scale.append "<span id='scale-x'><label id='x'>X</label> <div class='suffix percent'><input type=number step=" + scaleStep + " min=" + scaleMin + " max=" + scaleMax + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"
        scale.append "<span id='scale-y'><label id='y'>Y</label> <div class='suffix percent'><input type=number step=" + scaleStep + " min=" + scaleMin + " max=" + scaleMax + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"
        scale.append "<span id='scale-z'><label id='z'>Z</label> <div class='suffix percent'><input type=number step=" + scaleStep + " min=" + scaleMin + " max=" + scaleMax + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"

        position.find("#position-x input").val mesh.position.x.toFixed(2)
        position.find("#position-y input").val mesh.position.y.toFixed(2)
        position.find("#position-z input").val mesh.position.z.toFixed(2)

        rotation.find("#rotation-x input").val rad$deg(mesh.rotation.x).toFixed(2)
        rotation.find("#rotation-y input").val rad$deg(mesh.rotation.y).toFixed(2)
        rotation.find("#rotation-z input").val rad$deg(mesh.rotation.z).toFixed(2)

        scale.find("#scale-x input").val (mesh.scale.x * 100).toFixed(2)
        scale.find("#scale-y input").val (mesh.scale.y * 100).toFixed(2)
        scale.find("#scale-z input").val (mesh.scale.z * 100).toFixed(2)

        if mesh.lock == "locked"

            panel.find("#name span").addClass "disabled"

            panel.find(".operation").addClass "disabled"
            panel.find(".color").addClass "disabled"
            panel.find(".slider").slider "disable"
            panel.find(".tool").not("#lock").addClass "disabled"

            panel.find("input").addClass "disabled"
            panel.find("button").addClass "disabled"

        panel.find("#name span").keypress (event) -> event.stopPropagation()
        panel.find("#name span").keydown (event) -> event.stopPropagation()
        panel.find("#name span").keyup (event) -> event.stopPropagation(); if mesh.lock != "locked" then updateMesh(mesh, "name", "mesh", $(this)[0].innerText)

        panel.find("#name span").dblclick (event) -> event.stopPropagation(); if mesh.lock != "locked" then document.execCommand("selectAll")
        panel.find("#name span").mousedown (event) -> event.stopPropagation(); if mesh.lock == "locked" then event.preventDefault()
        panel.find("#name span").mouseup (event) -> event.stopPropagation()

        panel.find("#name span").blur (event) -> event.stopPropagation(); if mesh.lock != "locked" then updateMesh(mesh, "name", null, $(this)[0].innerText, true)

        panel.find(".operation").click (event) -> event.stopPropagation(); if mesh.lock != "locked" then updateMesh(mesh, "operation", this.id, "setup")
        panel.find(".operation").on "mousedown mouseup", (event) -> event.stopPropagation()

        panel.find(".color").click (event) -> event.stopPropagation(); if mesh.lock != "locked" then updateMesh(mesh, "color", null, this.id, true)
        panel.find(".color").on "mousedown mouseup", (event) -> event.stopPropagation()

        panel.find("#eye").click (event) -> event.stopPropagation(); if mesh.lock != "locked" then updateMesh(mesh, "visibility", "eye", this.src, true)
        panel.find("#lock").click (event) -> event.stopPropagation(); updateMesh(mesh, "lock")
        panel.find("#trash").click (event) -> event.stopPropagation(); if mesh.lock != "locked" then removeMesh(mesh)
        panel.find(".tool").on "mousedown mouseup", (event) -> event.stopPropagation()

        panel.find(".fold, h4").click (event) -> event.stopPropagation(); foldPanel(this)
        panel.find(".fold, h4").on "mousedown mouseup", (event) -> event.stopPropagation()

        panel.find("input").keypress (event) -> event.stopPropagation(); if event.keyCode == 13 then this.blur()
        panel.find("input").keydown (event) -> event.stopPropagation(); if mesh.lock == "locked" then event.preventDefault()
        panel.find("input").keyup (event) -> event.stopPropagation(); id = $(this).closest("span").attr("id"); updateMesh(mesh, id.split("-")[0], id.split("-").splice(1).join("-"), Number($(this).val()))
        panel.find("input").change (event) -> event.stopPropagation(); id = $(this).closest("span").attr("id"); updateMesh(mesh, id.split("-")[0], id.split("-").splice(1).join("-"), Number($(this).val()), "temp")

        panel.find("input").dblclick (event) -> event.stopPropagation(); if mesh.lock != "locked" then document.execCommand("selectAll")
        panel.find("input").mousedown (event) -> event.stopPropagation(); if mesh.lock == "locked" then event.preventDefault()
        panel.find("input").mouseup (event) -> event.stopPropagation()

        panel.find("input").blur (event) -> event.stopPropagation(); id = $(this).closest("span").attr("id"); updateMesh(mesh, id.split("-")[0], id.split("-").splice(1).join("-"), Number($(this).val()), true)

        panel.find("button").mousedown((event) ->

            event.stopPropagation()

            if mesh.lock != "locked"

                operation = $(this).attr "id"
                selection = $(this).closest("span").attr "id"
                input = $(this).closest("span").find "input"
                step = Number input.attr "step"

                step = if operation == "plus" then step else if operation == "minus" then - step else 0

                updateButton = ->

                    value = Number(input.val()) + step

                    updateMesh mesh, selection.split("-")[0], selection.split("-").splice(1).join("-"), value, "temp"

                holdTimeout = setTimeout ->

                    holdInterval = setInterval (-> updateButton()), 100

                , 1000

                updateButton()

        ).mouseup (event) ->

            this.blur()

            event.stopPropagation()

            clearTimeout holdTimeout
            clearInterval holdInterval

            $(this).closest("span").find("input").blur()

        sliderStyle panel.find ".slider"

        addPanelEvents panel

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

        localMeshes "add", mesh
        updateMeshesPanel "add", mesh

        scene.add mesh

    return mesh

updateMesh = (mesh, type, key = null, value = null, save = false) ->

    panel = $("#mesh." + mesh.uuid + "")

    if type == "name" and mesh.lock != "locked"

        value = value.trim()

        mesh.name = value

        if save then localMeshes "update", mesh

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
                    localMeshes "update", events.operation.mesh

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
        mesh.material = meshMaterial material, color
        mesh.material.wireframe = wireframe
        mesh.material.opacity = opacity
        mesh.material.style = value

        if save then localMeshes "update", mesh

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

        if save then localMeshes "update", mesh

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

        localMeshes "update", mesh

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

        if save == true then localMeshes "update", mesh

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
        localMeshes "remove", mesh

        mesh.geometry.dispose()
        mesh.material.dispose()

        scene.remove mesh
