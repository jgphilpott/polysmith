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

        unit = settings.getSetting "general", "unit"
        scale = settings.getSetting "general", "scale"
        language = settings.getSetting "general", "language"

        operations = "<div id='operations' class='controls'>"
        colors = "<div id='colors' class='controls'>"
        tools = "<div id='tools' class='controls'>"
        meta = "<div id='meta' class='controls'>"

        joinStatus = if mesh.getLock() then "disabled" else if events.operation.mesh is mesh and events.operation.key is "join" then "selected" else "default"
        cutStatus = if mesh.getLock() then "disabled" else if events.operation.mesh is mesh and events.operation.key is "cut" then "selected" else "default"
        intersectStatus = if mesh.getLock() then "disabled" else if events.operation.mesh is mesh and events.operation.key is "intersect" then "selected" else "default"

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
        tools += "<img title='Lock Mesh' id='lock' class='tool' src='/app/imgs/panels/lock/" + (if mesh.getLock() then "locked" else "unlocked") + ".png'>"
        tools += "<img title='Delete Mesh' id='trash' class='tool' src='/app/imgs/panels/tools/trash.png'>"

        meta += "<p id='type'><b>Type:</b> <span>" + mesh.class.replace("-", " ").replace(/\b\w/g, (char) -> char.toUpperCase()) + "</span></p>"
        meta += "<p id='surface'><b>Surface:</b> <span>" + format(mesh.geometry.surface, "area", unit[scale] + "Sq", 2, 0, language) + "</span></p>"
        meta += "<p id='volume'><b>Volume:</b> <span>" + format(mesh.geometry.volume, "volume", unit[scale] + "Cu", 2, 0, language) + "</span></p>"

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

                properties.append "<span id='properties-length'><label>Length</label> <div class='suffix " + unit[scale] + "'><input type=number step=" + regularStep + " min=" + regularMin + " max=" + regularMax + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"
                properties.append "<span id='properties-width'><label>Width</label> <div class='suffix " + unit[scale] + "'><input type=number step=" + regularStep + " min=" + regularMin + " max=" + regularMax + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"
                properties.append "<span id='properties-height'><label>Height</label> <div class='suffix " + unit[scale] + "'><input type=number step=" + regularStep + " min=" + regularMin + " max=" + regularMax + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"

                properties.find("#properties-length input").val mesh.geometry.parameters.width.toFixed 2
                properties.find("#properties-width input").val mesh.geometry.parameters.height.toFixed 2
                properties.find("#properties-height input").val mesh.geometry.parameters.depth.toFixed 2

            else if mesh.class == "sphere"

                properties.append "<span id='properties-radius'><label><p>Radius</p> <div class='suffix " + unit[scale] + "'><input type=number step=" + radialStep + " min=" + radialMin + " max=" + radialMax + "></div><button id='plus'>+</button><button id='minus'>-</button></label></span>"
                properties.append "<span id='properties-width-segments'><label><p>Width Segments</p> <input type=number step=" + segmentsStep + " min=" + segmentsMin + " max=" + segmentsMax + "><button id='plus'>+</button><button id='minus'>-</button></label></span>"
                properties.append "<span id='properties-height-segments'><label><p>Height Segments</p> <input type=number step=" + segmentsStep + " min=" + segmentsMin + " max=" + segmentsMax + "><button id='plus'>+</button><button id='minus'>-</button></label></span>"

                properties.find("#properties-radius input").val mesh.geometry.parameters.radius.toFixed 2
                properties.find("#properties-width-segments input").val mesh.geometry.parameters.widthSegments
                properties.find("#properties-height-segments input").val mesh.geometry.parameters.heightSegments

            else if mesh.class == "cylinder" or mesh.class.split("-")[1] == "prism"

                properties.append "<span id='properties-length'><label><p>Length</p> <div class='suffix " + unit[scale] + "'><input type=number step=" + regularStep + " min=" + regularMin + " max=" + regularMax + "></div><button id='plus'>+</button><button id='minus'>-</button></label></span>"
                properties.append "<span id='properties-radius-positive'><label><p>Positive Radius</p> <div class='suffix " + unit[scale] + "'><input type=number step=" + radialStep + " min=" + radialMin + " max=" + radialMax + "></div><button id='plus'>+</button><button id='minus'>-</button></label></span>"
                properties.append "<span id='properties-radius-negative'><label><p>Negative Radius</p> <div class='suffix " + unit[scale] + "'><input type=number step=" + radialStep + " min=" + radialMin + " max=" + radialMax + "></div><button id='plus'>+</button><button id='minus'>-</button></label></span>"

                properties.find("#properties-length input").val mesh.geometry.parameters.height.toFixed 2
                properties.find("#properties-radius-positive input").val mesh.geometry.parameters.radiusTop.toFixed 2
                properties.find("#properties-radius-negative input").val mesh.geometry.parameters.radiusBottom.toFixed 2

                if mesh.class == "cylinder"

                    properties.append "<span id='properties-radius-segments'><label><p>Radial Segments</p> <input type=number step=" + segmentsStep + " min=" + segmentsMin + " max=" + segmentsMax + "><button id='plus'>+</button><button id='minus'>-</button></label></span>"

                    properties.find("#properties-radius-segments input").val mesh.geometry.parameters.radialSegments

            else if mesh.class.split("-")[1] == "pyramid"

                properties.append "<span id='properties-height'><label>Height</label> <div class='suffix " + unit[scale] + "'><input type=number step=" + regularStep + " min=" + regularMin + " max=" + regularMax + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"
                properties.append "<span id='properties-radius'><label>Radius</label> <div class='suffix " + unit[scale] + "'><input type=number step=" + radialStep + " min=" + radialMin + " max=" + radialMax + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"

                properties.find("#properties-height input").val mesh.geometry.parameters.height.toFixed 2
                properties.find("#properties-radius input").val mesh.geometry.parameters.radiusBottom.toFixed 2

            else if mesh.class == "cone"

                properties.append "<span id='properties-height'><label><p>Height</p> <div class='suffix " + unit[scale] + "'><input type=number step=" + regularStep + " min=" + regularMin + " max=" + regularMax + "></div><button id='plus'>+</button><button id='minus'>-</button></label></span>"
                properties.append "<span id='properties-radius'><label><p>Radius</p> <div class='suffix " + unit[scale] + "'><input type=number step=" + radialStep + " min=" + radialMin + " max=" + radialMax + "></div><button id='plus'>+</button><button id='minus'>-</button></label></span>"
                properties.append "<span id='properties-radius-segments'><label><p>Radial Segments</p> <input type=number step=" + segmentsStep + " min=" + segmentsMin + " max=" + segmentsMax + "><button id='plus'>+</button><button id='minus'>-</button></label></span>"

                properties.find("#properties-height input").val mesh.geometry.parameters.height.toFixed 2
                properties.find("#properties-radius input").val mesh.geometry.parameters.radiusBottom.toFixed 2
                properties.find("#properties-radius-segments input").val mesh.geometry.parameters.radialSegments

            else if mesh.class == "torus"

                properties.append "<span id='properties-thickness'><label><p>Thickness</p> <div class='suffix " + unit[scale] + "'><input type=number step=" + radialStep + " min=" + radialMin + " max=" + radialMax + "></div><button id='plus'>+</button><button id='minus'>-</button></label></span>"
                properties.append "<span id='properties-radius'><label><p>Radius</p> <div class='suffix " + unit[scale] + "'><input type=number step=" + radialStep + " min=" + radialMin + " max=" + radialMax + "></div><button id='plus'>+</button><button id='minus'>-</button></label></span>"
                properties.append "<span id='properties-tube-segments'><label><p>Tubular Segments</p> <input type=number step=" + segmentsStep + " min=" + segmentsMin + " max=" + segmentsMax + "><button id='plus'>+</button><button id='minus'>-</button></label></span>"
                properties.append "<span id='properties-radius-segments'><label><p>Radial Segments</p> <input type=number step=" + segmentsStep + " min=" + segmentsMin + " max=" + segmentsMax + "><button id='plus'>+</button><button id='minus'>-</button></label></span>"

                properties.find("#properties-thickness input").val mesh.geometry.parameters.tube.toFixed 2
                properties.find("#properties-radius input").val mesh.geometry.parameters.radius.toFixed 2
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

        position.append "<span id='position-x'><label id='x'>X</label> <div class='suffix " + unit[scale] + "'><input type=number step=" + positionStep + " min=" + positionMin + " max=" + positionMax + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"
        position.append "<span id='position-y'><label id='y'>Y</label> <div class='suffix " + unit[scale] + "'><input type=number step=" + positionStep + " min=" + positionMin + " max=" + positionMax + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"
        position.append "<span id='position-z'><label id='z'>Z</label> <div class='suffix " + unit[scale] + "'><input type=number step=" + positionStep + " min=" + positionMin + " max=" + positionMax + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"

        rotation.append "<span id='rotation-x'><label id='x'>X</label> <div class='suffix degree'><input type=number step=" + rotationStep + " min=" + rotationMin + " max=" + rotationMax + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"
        rotation.append "<span id='rotation-y'><label id='y'>Y</label> <div class='suffix degree'><input type=number step=" + rotationStep + " min=" + rotationMin + " max=" + rotationMax + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"
        rotation.append "<span id='rotation-z'><label id='z'>Z</label> <div class='suffix degree'><input type=number step=" + rotationStep + " min=" + rotationMin + " max=" + rotationMax + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"

        scale.append "<span id='scale-x'><label id='x'>X</label> <div class='suffix percent'><input type=number step=" + scaleStep + " min=" + scaleMin + " max=" + scaleMax + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"
        scale.append "<span id='scale-y'><label id='y'>Y</label> <div class='suffix percent'><input type=number step=" + scaleStep + " min=" + scaleMin + " max=" + scaleMax + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"
        scale.append "<span id='scale-z'><label id='z'>Z</label> <div class='suffix percent'><input type=number step=" + scaleStep + " min=" + scaleMin + " max=" + scaleMax + "></div><button id='plus'>+</button><button id='minus'>-</button></span>"

        position.find("#position-x input").val mesh.position.x.toFixed 2
        position.find("#position-y input").val mesh.position.y.toFixed 2
        position.find("#position-z input").val mesh.position.z.toFixed 2

        rotation.find("#rotation-x input").val rad$deg(mesh.rotation.x).toFixed 2
        rotation.find("#rotation-y input").val rad$deg(mesh.rotation.y).toFixed 2
        rotation.find("#rotation-z input").val rad$deg(mesh.rotation.z).toFixed 2

        scale.find("#scale-x input").val (mesh.scale.x * 100).toFixed 2
        scale.find("#scale-y input").val (mesh.scale.y * 100).toFixed 2
        scale.find("#scale-z input").val (mesh.scale.z * 100).toFixed 2

        if mesh.getLock()

            panel.find("#name span").addClass "disabled"

            panel.find(".operation").addClass "disabled"
            panel.find(".color").addClass "disabled"
            panel.find(".slider").slider "disable"
            panel.find(".tool").not("#lock").addClass "disabled"

            panel.find("input").addClass "disabled"
            panel.find("button").addClass "disabled"

        panel.find("#name span").keypress (event) -> event.stopPropagation()
        panel.find("#name span").keydown (event) -> event.stopPropagation()
        panel.find("#name span").keyup (event) -> event.stopPropagation(); mesh.setName("mesh", $(this)[0].innerText)

        panel.find("#name span").dblclick (event) -> if not mesh.getLock() then document.execCommand("selectAll")
        panel.find("#name span").mousedown (event) -> event.stopPropagation(); if mesh.getLock() then event.preventDefault()
        panel.find("#name span").mouseup (event) -> event.stopPropagation()

        panel.find("#name span").blur (event) -> event.stopPropagation(); mesh.setName(null, $(this)[0].innerText, true)

        panel.find(".operation").click (event) -> if not mesh.getLock() then mesh.morph this.id, "setup"
        panel.find(".operation").on "mousedown mouseup", (event) -> event.stopPropagation()

        panel.find(".color").click (event) -> mesh.setColor this.id
        panel.find(".color").on "mousedown mouseup", (event) -> event.stopPropagation()

        panel.find("#eye").click (event) -> mesh.setOpacity (if /[^/]*$/.exec(this.src)[0].split(".")[0] is "hidden" then 100 else 0)
        panel.find("#lock").click (event) -> mesh.toggleLock()
        panel.find("#trash").click (event) -> if not mesh.getLock() then mesh.remove()
        panel.find(".tool").on "mousedown mouseup", (event) -> event.stopPropagation()

        panel.find(".fold, h4").click (event) -> foldPanel(this)
        panel.find(".fold, h4").on "mousedown mouseup", (event) -> event.stopPropagation()

        panel.find("input").keypress (event) -> event.stopPropagation(); if event.keyCode == 13 then this.blur()
        panel.find("input").keydown (event) -> event.stopPropagation(); if mesh.getLock() then event.preventDefault()
        panel.find("input").keyup (event) -> event.stopPropagation(); id = $(this).closest("span").attr("id"); updateMesh(mesh, id.split("-")[0], id.split("-").splice(1).join("-"), Number($(this).val()))
        panel.find("input").change (event) -> event.stopPropagation(); id = $(this).closest("span").attr("id"); updateMesh(mesh, id.split("-")[0], id.split("-").splice(1).join("-"), Number($(this).val()), "temp")

        panel.find("input").dblclick (event) -> if not mesh.getLock() then document.execCommand("selectAll")
        panel.find("input").mousedown (event) -> event.stopPropagation(); if mesh.getLock() then event.preventDefault()
        panel.find("input").mouseup (event) -> event.stopPropagation()

        panel.find("input").blur (event) -> event.stopPropagation(); id = $(this).closest("span").attr("id"); updateMesh(mesh, id.split("-")[0], id.split("-").splice(1).join("-"), Number($(this).val()), true)

        panel.find("button").mousedown((event) ->

            event.stopPropagation()

            if not mesh.getLock()

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
