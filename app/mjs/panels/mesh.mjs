import {updateMeshesPanel} from "./meshes.mjs"
import {addPanelEvents} from "../libs/etc/events.mjs"
import {addMeshEvents} from "../libs/etc/events.mjs"

let holdTimeout = null
let holdInterval = null

window.addMesh = addMesh
window.updateMesh = updateMesh
window.removeMesh = removeMesh

export function addMeshPanel(mesh, coordinates=null) {

  let panel = $("#mesh." + mesh.uuid + "")

  if (panel.length == 0) {

    $("body").append("<div id='mesh' class='panel " + mesh.uuid + "'><img class='close' src='/app/imgs/panels/nav/close.png'></div>")

    panel = $("#mesh." + mesh.uuid + "")

    if (coordinates) panel.css({left: coordinates.x, top: coordinates.y})

    panel.append("<h3 id='name'><span contenteditable='true'></span></h3>")
    let name = panel.find("#name span"); name[0].innerText = mesh.name
    if (mesh.name == "") name.css("display", "none")

    panel.css("z-index", events.zIndex + 1)

    panel.data("mesh", mesh)

    let operations = "<div id='operations' class='controls'>"
    let colors = "<div id='colors' class='controls'>"
    let tools = "<div id='tools' class='controls'>"
    let meta = "<div id='meta' class='controls'>"

    let joinStatus = mesh.lock == "locked" ? "disabled" : events.operation.mesh == mesh && events.operation.key == "join" ? "selected" : "default"
    let cutStatus = mesh.lock == "locked" ? "disabled" : events.operation.mesh == mesh && events.operation.key == "cut" ? "selected" : "default"
    let intersectStatus = mesh.lock == "locked" ? "disabled" : events.operation.mesh == mesh && events.operation.key == "intersect" ? "selected" : "default"

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

    tools += "<img title='Visibility' id='eye' class='tool' src='/app/imgs/panels/visibility/" + (mesh.material.opacity < 0.5 ? "hidden" : "visible") + ".png'>"
    tools += "<div id='visibility' class='tool slider'></div>"
    tools += "<img title='Lock' id='lock' class='tool' src='/app/imgs/panels/lock/" + mesh.lock + ".png'>"
    tools += "<img title='Trash' id='trash' class='tool' src='/app/imgs/panels/tools/trash.png'>"

    meta += "<p id='type'><b>Type:</b> <span>" + mesh.class.replace("-", " ").replace(/\b\w/g, function(char) { return char.toUpperCase() }) + "</span></p>"
    meta += "<p id='surface'><b>Surface:</b> <span>" + mesh.surface.toFixed(2) + "</span></p>"
    meta += "<p id='volume'><b>Volume:</b> <span>" + mesh.volume.toFixed(2) + "</span></p>"

    panel.append(operations + "</div>")
    panel.append(colors + "</div>")
    panel.append(tools + "</div>")
    panel.append(meta + "</div>")

    panel.find("#" + mesh.material.style + ".color").addClass("selected")

    panel.find("#visibility.slider").slider({min: 0, max: 100, value: mesh.material.opacity * 100, start: sliderStart, slide: sliderSlide, stop: sliderStop})

    let geometriesWithProperties = ["box", "cylinder", "sphere", "prism", "pyramid", "cone", "torus"]

    if (geometriesWithProperties.includes(mesh.class) || geometriesWithProperties.includes(mesh.class.split("-")[1])) {

      panel.append("<div id='properties' class='controls'><div class='head'><img class='fold' src='/app/imgs/panels/nav/fold.png'><h4>Properties</h4></div><div class='body'></div></div>")

    }

    panel.append("<div id='position' class='controls'><div class='head'><img class='fold' src='/app/imgs/panels/nav/fold.png'><h4>Position</h4></div><div class='body'></div></div>")
    panel.append("<div id='rotation' class='controls'><div class='head'><img class='fold' src='/app/imgs/panels/nav/fold.png'><h4>Rotation</h4></div><div class='body'></div></div>")
    panel.append("<div id='scale' class='controls'><div class='head'><img class='fold' src='/app/imgs/panels/nav/fold.png'><h4>Scale</h4></div><div class='body'></div></div>")

    let properties = panel.find("#properties .body")
    let position = panel.find("#position .body")
    let rotation = panel.find("#rotation .body")
    let scale = panel.find("#scale .body")

    if (geometriesWithProperties.includes(mesh.class) || geometriesWithProperties.includes(mesh.class.split("-")[1])) {

      let regularStep = 1
      let regularMin = 1
      let regularMax = data.scale * 3

      let radialStep = 0.5
      let radialMin = 0.5
      let radialMax = data.scale * 1.5

      let segmentsStep = 1
      let segmentsMin = 3
      let segmentsMax = 100

      if (mesh.class == "box") {

        properties.append("<span id='properties-length'><label>Length</label> <input type=number step=" + regularStep + " min=" + regularMin + " max=" + regularMax + "><button id='plus'>+</button><button id='minus'>-</button></span>")
        properties.append("<span id='properties-width'><label>Width</label> <input type=number step=" + regularStep + " min=" + regularMin + " max=" + regularMax + "><button id='plus'>+</button><button id='minus'>-</button></span>")
        properties.append("<span id='properties-height'><label>Height</label> <input type=number step=" + regularStep + " min=" + regularMin + " max=" + regularMax + "><button id='plus'>+</button><button id='minus'>-</button></span>")

        properties.find("#properties-length input").val(mesh.geometry.parameters.width.toFixed(2))
        properties.find("#properties-width input").val(mesh.geometry.parameters.height.toFixed(2))
        properties.find("#properties-height input").val(mesh.geometry.parameters.depth.toFixed(2))

      }  else if (mesh.class == "sphere") {

        properties.append("<span id='properties-radius'><label><p>Radius</p> <input type=number step=" + radialStep + " min=" + radialMin + " max=" + radialMax + "><button id='plus'>+</button><button id='minus'>-</button></label></span>")
        properties.append("<span id='properties-width-segments'><label><p>Width Segments</p> <input type=number step=" + segmentsStep + " min=" + segmentsMin + " max=" + segmentsMax + "><button id='plus'>+</button><button id='minus'>-</button></label></span>")
        properties.append("<span id='properties-height-segments'><label><p>Height Segments</p> <input type=number step=" + segmentsStep + " min=" + segmentsMin + " max=" + segmentsMax + "><button id='plus'>+</button><button id='minus'>-</button></label></span>")

        properties.find("#properties-radius input").val(mesh.geometry.parameters.radius.toFixed(2))
        properties.find("#properties-width-segments input").val(mesh.geometry.parameters.widthSegments)
        properties.find("#properties-height-segments input").val(mesh.geometry.parameters.heightSegments)

      } else if (mesh.class == "cylinder" || mesh.class.split("-")[1] == "prism") {

        properties.append("<span id='properties-length'><label><p>Length</p> <input type=number step=" + regularStep + " min=" + regularMin + " max=" + regularMax + "><button id='plus'>+</button><button id='minus'>-</button></label></span>")
        properties.append("<span id='properties-radius-positive'><label><p>Positive Radius</p> <input type=number step=" + radialStep + " min=" + radialMin + " max=" + radialMax + "><button id='plus'>+</button><button id='minus'>-</button></label></span>")
        properties.append("<span id='properties-radius-negative'><label><p>Negative Radius</p> <input type=number step=" + radialStep + " min=" + radialMin + " max=" + radialMax + "><button id='plus'>+</button><button id='minus'>-</button></label></span>")

        properties.find("#properties-length input").val(mesh.geometry.parameters.height.toFixed(2))
        properties.find("#properties-radius-positive input").val(mesh.geometry.parameters.radiusTop.toFixed(2))
        properties.find("#properties-radius-negative input").val(mesh.geometry.parameters.radiusBottom.toFixed(2))

        if (mesh.class == "cylinder") {

          properties.append("<span id='properties-radius-segments'><label><p>Radial Segments</p> <input type=number step=" + segmentsStep + " min=" + segmentsMin + " max=" + segmentsMax + "><button id='plus'>+</button><button id='minus'>-</button></label></span>")

          properties.find("#properties-radius-segments input").val(mesh.geometry.parameters.radialSegments)

        }

      } else if (mesh.class.split("-")[1] == "pyramid") {

        properties.append("<span id='properties-height'><label>Height</label> <input type=number step=" + regularStep + " min=" + regularMin + " max=" + regularMax + "><button id='plus'>+</button><button id='minus'>-</button></span>")
        properties.append("<span id='properties-radius'><label>Radius</label> <input type=number step=" + radialStep + " min=" + radialMin + " max=" + radialMax + "><button id='plus'>+</button><button id='minus'>-</button></span>")

        properties.find("#properties-height input").val(mesh.geometry.parameters.height.toFixed(2))
        properties.find("#properties-radius input").val(mesh.geometry.parameters.radiusBottom.toFixed(2))

      } else if (mesh.class == "cone") {

        properties.append("<span id='properties-height'><label><p>Height</p> <input type=number step=" + regularStep + " min=" + regularMin + " max=" + regularMax + "><button id='plus'>+</button><button id='minus'>-</button></label></span>")
        properties.append("<span id='properties-radius'><label><p>Radius</p> <input type=number step=" + radialStep + " min=" + radialMin + " max=" + radialMax + "><button id='plus'>+</button><button id='minus'>-</button></label></span>")
        properties.append("<span id='properties-radius-segments'><label><p>Radial Segments</p> <input type=number step=" + segmentsStep + " min=" + segmentsMin + " max=" + segmentsMax + "><button id='plus'>+</button><button id='minus'>-</button></label></span>")

        properties.find("#properties-height input").val(mesh.geometry.parameters.height.toFixed(2))
        properties.find("#properties-radius input").val(mesh.geometry.parameters.radiusBottom.toFixed(2))
        properties.find("#properties-radius-segments input").val(mesh.geometry.parameters.radialSegments)

      } else if (mesh.class == "torus") {

        properties.append("<span id='properties-thickness'><label><p>Thickness</p> <input type=number step=" + radialStep + " min=" + radialMin + " max=" + radialMax + "><button id='plus'>+</button><button id='minus'>-</button></label></span>")
        properties.append("<span id='properties-radius'><label><p>Radius</p> <input type=number step=" + radialStep + " min=" + radialMin + " max=" + radialMax + "><button id='plus'>+</button><button id='minus'>-</button></label></span>")
        properties.append("<span id='properties-tube-segments'><label><p>Tubular Segments</p> <input type=number step=" + segmentsStep + " min=" + segmentsMin + " max=" + segmentsMax + "><button id='plus'>+</button><button id='minus'>-</button></label></span>")
        properties.append("<span id='properties-radius-segments'><label><p>Radial Segments</p> <input type=number step=" + segmentsStep + " min=" + segmentsMin + " max=" + segmentsMax + "><button id='plus'>+</button><button id='minus'>-</button></label></span>")

        properties.find("#properties-thickness input").val(mesh.geometry.parameters.tube.toFixed(2))
        properties.find("#properties-radius input").val(mesh.geometry.parameters.radius.toFixed(2))
        properties.find("#properties-tube-segments input").val(mesh.geometry.parameters.tubularSegments)
        properties.find("#properties-radius-segments input").val(mesh.geometry.parameters.radialSegments)

      }

      if (mesh.class == "box" || mesh.class.split("-")[1] == "pyramid") {

        properties.find("label").css("width", "45px")
        properties.find("input").css("width", "90px")

      } else if (mesh.class == "cylinder" || mesh.class == "sphere" || mesh.class == "cone" || mesh.class == "torus" || mesh.class.split("-")[1] == "prism") {

        properties.find("label").css("margin", "3px 5px")
        properties.find("label p").css("margin", "0px 5px")
        properties.find("label p").css("text-align", "left")
        properties.find("input").css("width", "145px")

      }

    }

    let positionStep = 1
    let positionMin = -data.scale * 3
    let positionMax = data.scale * 3

    let rotationStep = 1
    let rotationMin = -360
    let rotationMax = 360

    let scaleStep = 0.1
    let scaleMin = 0
    let scaleMax = 100

    position.append("<span id='position-x'><label id='x'>X</label> <input type=number step=" + positionStep + " min=" + positionMin + " max=" + positionMax + "><button id='plus'>+</button><button id='minus'>-</button></span>")
    position.append("<span id='position-y'><label id='y'>Y</label> <input type=number step=" + positionStep + " min=" + positionMin + " max=" + positionMax + "><button id='plus'>+</button><button id='minus'>-</button></span>")
    position.append("<span id='position-z'><label id='z'>Z</label> <input type=number step=" + positionStep + " min=" + positionMin + " max=" + positionMax + "><button id='plus'>+</button><button id='minus'>-</button></span>")

    rotation.append("<span id='rotation-x'><label id='x'>X</label> <input type=number step=" + rotationStep + " min=" + rotationMin + " max=" + rotationMax + "><button id='plus'>+</button><button id='minus'>-</button></span>")
    rotation.append("<span id='rotation-y'><label id='y'>Y</label> <input type=number step=" + rotationStep + " min=" + rotationMin + " max=" + rotationMax + "><button id='plus'>+</button><button id='minus'>-</button></span>")
    rotation.append("<span id='rotation-z'><label id='z'>Z</label> <input type=number step=" + rotationStep + " min=" + rotationMin + " max=" + rotationMax + "><button id='plus'>+</button><button id='minus'>-</button></span>")

    scale.append("<span id='scale-x'><label id='x'>X</label> <input type=number step=" + scaleStep + " min=" + scaleMin + " max=" + scaleMax + "><button id='plus'>+</button><button id='minus'>-</button></span>")
    scale.append("<span id='scale-y'><label id='y'>Y</label> <input type=number step=" + scaleStep + " min=" + scaleMin + " max=" + scaleMax + "><button id='plus'>+</button><button id='minus'>-</button></span>")
    scale.append("<span id='scale-z'><label id='z'>Z</label> <input type=number step=" + scaleStep + " min=" + scaleMin + " max=" + scaleMax + "><button id='plus'>+</button><button id='minus'>-</button></span>")

    position.find("#position-x input").val(mesh.position.x.toFixed(2))
    position.find("#position-y input").val(mesh.position.y.toFixed(2))
    position.find("#position-z input").val(mesh.position.z.toFixed(2))

    rotation.find("#rotation-x input").val(radian2degree(mesh.rotation.x).toFixed(2))
    rotation.find("#rotation-y input").val(radian2degree(mesh.rotation.y).toFixed(2))
    rotation.find("#rotation-z input").val(radian2degree(mesh.rotation.z).toFixed(2))

    scale.find("#scale-x input").val(mesh.scale.x.toFixed(2))
    scale.find("#scale-y input").val(mesh.scale.y.toFixed(2))
    scale.find("#scale-z input").val(mesh.scale.z.toFixed(2))

    if (mesh.lock == "locked") {

      panel.find("#name span").addClass("disabled")

      panel.find(".operation").addClass("disabled")
      panel.find(".color").addClass("disabled")
      panel.find(".slider").slider("disable")
      panel.find(".tool").not("#lock").addClass("disabled")

      panel.find("input").addClass("disabled")
      panel.find("button").addClass("disabled")

    }

    panel.find("#name span").keypress(function(event) { event.stopPropagation() })
    panel.find("#name span").keydown(function(event) { event.stopPropagation() })
    panel.find("#name span").keyup(function(event) { event.stopPropagation(); if (mesh.lock != "locked") updateMesh(mesh, "name", "mesh", $(this)[0].innerText) })

    panel.find("#name span").dblclick(function(event) { event.stopPropagation(); if (mesh.lock != "locked") document.execCommand("selectAll") })
    panel.find("#name span").mousedown(function(event) { event.stopPropagation(); if (mesh.lock == "locked") event.preventDefault() })
    panel.find("#name span").mouseup(function(event) { event.stopPropagation() })

    panel.find("#name span").blur(function(event) { event.stopPropagation(); if (mesh.lock != "locked") updateMesh(mesh, "name", null, $(this)[0].innerText, true) })

    panel.find(".operation").click(function(event) { event.stopPropagation(); if (mesh.lock != "locked") updateMesh(mesh, "operation", this.id, "setup") })
    panel.find(".operation").mousedown(function(event) { event.stopPropagation() }).mouseup(function(event) { event.stopPropagation() })

    panel.find(".color").click(function(event) { event.stopPropagation(); if (mesh.lock != "locked") updateMesh(mesh, "color", null, this.id, true) })
    panel.find(".color").mousedown(function(event) { event.stopPropagation() }).mouseup(function(event) { event.stopPropagation() })

    panel.find("#eye").click(function(event) { event.stopPropagation(); if (mesh.lock != "locked") updateMesh(mesh, "visibility", "eye", this.src, true) })
    panel.find("#lock").click(function(event) { event.stopPropagation(); updateMesh(mesh, "lock") })
    panel.find("#trash").click(function(event) { event.stopPropagation(); if (mesh.lock != "locked") removeMesh(mesh) })
    panel.find(".tool").mousedown(function(event) { event.stopPropagation() }).mouseup(function(event) { event.stopPropagation() })

    panel.find(".fold, h4").click(function(event) { event.stopPropagation(); foldPanel(this) }).mousedown(function(event) { event.stopPropagation() }).mouseup(function(event) { event.stopPropagation() })

    panel.find("input").keypress(function(event) { event.stopPropagation(); if (event.keyCode == 13) this.blur() })
    panel.find("input").keydown(function(event) { event.stopPropagation(); if (mesh.lock == "locked") event.preventDefault() })
    panel.find("input").keyup(function(event) { event.stopPropagation(); let id = $(this).closest("span").attr("id"); updateMesh(mesh, id.split("-")[0], id.split("-").splice(1).join("-"), Number($(this).val())) })
    panel.find("input").change(function(event) { event.stopPropagation(); let id = $(this).closest("span").attr("id"); updateMesh(mesh, id.split("-")[0], id.split("-").splice(1).join("-"), Number($(this).val()), "temp") })

    panel.find("input").dblclick(function(event) { event.stopPropagation(); if (mesh.lock != "locked") document.execCommand("selectAll") })
    panel.find("input").mousedown(function(event) { event.stopPropagation(); if (mesh.lock == "locked") event.preventDefault() })
    panel.find("input").mouseup(function(event) { event.stopPropagation() })

    panel.find("input").blur(function(event) { event.stopPropagation(); let id = $(this).closest("span").attr("id"); updateMesh(mesh, id.split("-")[0], id.split("-").splice(1).join("-"), Number($(this).val()), true) })

    panel.find("button").mousedown(function(event) {

      event.stopPropagation()

      if (mesh.lock != "locked") {

        let operation = $(this).attr("id")
        let selection = $(this).closest("span").attr("id")
        let input = $(this).closest("span").find("input")
        let step = Number(input.attr("step"))

        step = operation == "plus" ? step : operation == "minus" ? -step : 0

        function updateButton() {

          let value = Number(input.val()) + step

          updateMesh(mesh, selection.split("-")[0], selection.split("-").splice(1).join("-"), value, "temp")

        }

        holdTimeout = setTimeout(function() {

          holdInterval = setInterval(function() { updateButton() }, 100)

        }, 1000)

        updateButton()

      }

    }).mouseup(function(event) {

      this.blur()

      event.stopPropagation()

      clearTimeout(holdTimeout)
      clearInterval(holdInterval)

      $(this).closest("span").find("input").blur()

    })

    sliderStyle(panel.find(".slider"))

    addPanelEvents(panel)

  }

}

export function addMesh(mesh=null, properties={}) {

  if (!mesh && properties.class) {

    switch (properties.class) {

      case "box":

        mesh = newBox()
        mesh.rotation.x = degree2radian(0)

        break

      case "cylinder":

        mesh = newCylinder()
        mesh.rotation.x = degree2radian(90)

        break

      case "sphere":

        mesh = newSphere()
        mesh.rotation.x = degree2radian(90)

        break

      case "triangular-prism":

        mesh = newCylinder(10, 5, 5, 3)
        mesh.rotation.x = degree2radian(0)

        break

      case "rectangular-prism":

        mesh = newCylinder(10, 5, 5, 4)
        mesh.rotation.x = degree2radian(0)

        break

      case "pentagonal-prism":

        mesh = newCylinder(10, 5, 5, 5)
        mesh.rotation.x = degree2radian(0)

        break

      case "hexagonal-prism":

        mesh = newCylinder(10, 5, 5, 6)
        mesh.rotation.x = degree2radian(0)

        break

      case "heptagonal-prism":

        mesh = newCylinder(10, 5, 5, 7)
        mesh.rotation.x = degree2radian(0)

        break

      case "octagonal-prism":

        mesh = newCylinder(10, 5, 5, 8)
        mesh.rotation.x = degree2radian(0)

        break

      case "triangular-pyramid":

        mesh = newCylinder(10, 0, 5, 3)
        mesh.rotation.x = degree2radian(90)

        break

      case "rectangular-pyramid":

        mesh = newCylinder(10, 0, 5, 4)
        mesh.rotation.x = degree2radian(90)

        break

      case "pentagonal-pyramid":

        mesh = newCylinder(10, 0, 5, 5)
        mesh.rotation.x = degree2radian(90)

        break

      case "cone":

        mesh = newCylinder(10, 0, 5, 42)
        mesh.rotation.x = degree2radian(90)

        break

      case "torus":

        mesh = newTorus()
        mesh.rotation.y = degree2radian(90)

        break

    }

  }

  if (mesh) {

    mesh.name = "name" in properties ? properties.name : mesh.name ? mesh.name : "Unnamed"
    mesh.lock = "lock" in properties ? properties.lock : mesh.lock ? mesh.lock : "unlocked"
    mesh.class = "class" in properties ? properties.class : mesh.class ? mesh.class : "custom"

    mesh.material.style = "style" in properties ? properties.style : mesh.material.style ? mesh.material.style : "multi"

    if (properties.position) {

      mesh.position.x = properties.position.x ? properties.position.x : properties.position._x ? properties.position._x : 0
      mesh.position.y = properties.position.y ? properties.position.y : properties.position._y ? properties.position._y : 0
      mesh.position.z = properties.position.z ? properties.position.z : properties.position._z ? properties.position._z : 0

    }

    if (properties.rotation) {

      mesh.rotation.x = properties.rotation.x ? properties.rotation.x : properties.rotation._x ? properties.rotation._x : 0
      mesh.rotation.y = properties.rotation.y ? properties.rotation.y : properties.rotation._y ? properties.rotation._y : 0
      mesh.rotation.z = properties.rotation.z ? properties.rotation.z : properties.rotation._z ? properties.rotation._z : 0

    }

    updateMetrics(mesh)
    addMeshEvents(mesh)

    localMeshes("add", mesh)
    updateMeshesPanel("add", mesh)

    scene.add(mesh)

  }

  return mesh

}

export function updateMesh(mesh, type, key=null, value=null, save=false) {

  let panel = $("#mesh." + mesh.uuid + "")

  if (type == "name" && mesh.lock != "locked") {

    value = value.trim()

    mesh.name = value

    if (save) localMeshes("update", mesh)

    let meshPanelName = $("#mesh." + mesh.uuid + " #name span")
    let meshesPanelName = $("#meshes.table tr#" + mesh.uuid + " .name span")

    if (meshPanelName[0] && key != "mesh") meshPanelName[0].innerText = value
    if (meshesPanelName[0] && key != "meshes") meshesPanelName[0].innerText = value

    value == "" && key != "mesh" ? meshPanelName.css("display", "none") : meshPanelName.css("display", "block")

  } else if (type == "operation") {

    let operationIcon = panel.find("#" + key + ".operation")
    let operationIcons = $("#mesh.panel img.operation")

    operationIcons.toArray().forEach(icon => {

      if (!$(icon).hasClass("disabled")) $(icon).attr("src", "/app/imgs/panels/ops/default/" + icon.id + ".png")

    })

    if (value == "setup" && mesh.lock != "locked") {

      operationIcon.attr("src", "/app/imgs/panels/ops/selected/" + key + ".png")

      $("#canvas").css("cursor", "copy")

      events.operation.mesh = mesh
      events.operation.key = key

    } else if (events.operation.key && !camera.dragged) {

      if (events.operation.mesh.uuid != mesh.uuid) {

        let morphed = morph(key, events.operation.mesh, mesh)

        if (morphed) {

          events.operation.mesh.class = "custom"
          events.operation.mesh.geometry = morphed.geometry

          updateMetrics(events.operation.mesh)
          localMeshes("update", events.operation.mesh)

          $("#mesh." + events.operation.mesh.uuid + " #properties.controls").remove()

        }

      }

      $("#canvas").css("cursor", "")

      events.operation.mesh = null
      events.operation.key = null

    }

  } else if (type == "color" && mesh.lock != "locked") {

    let color = null
    let opacity = mesh.material.opacity
    let material = value == "multi" ? "normal" : "standard"

    panel.find(".color").removeClass("selected")
    panel.find("#" + value + ".color").addClass("selected")

    if (["red", "orange", "yellow", "green", "blue", "purple", "pink"].includes(value)) {
      color = rainbowThree[value + "Three"]
    } else if (["white", "gray", "black"].includes(value)) {
      color = grayscaleThree[value + "Three"]
    } else {
      color = blackThree
    }

    mesh.material.dispose()
    mesh.material = meshMaterial(material, color)
    mesh.material.opacity = opacity
    mesh.material.style = value

    if (save) localMeshes("update", mesh)

  } else if (type == "visibility" && mesh.lock != "locked") {

    if (key == "eye") {

      let visibility = /[^/]*$/.exec(value)[0].split(".")[0]
      let slider = panel.find("#visibility.slider")

      if (visibility == "visible") {

        panel.find("#eye").attr("src", "/app/imgs/panels/visibility/hidden.png")

        mesh.material.opacity = 0

        slider.slider("value", 0)
        sliderFill(slider)

      } else if (visibility == "hidden") {

        panel.find("#eye").attr("src", "/app/imgs/panels/visibility/visible.png")

        mesh.material.opacity = 1

        slider.slider("value", 100)
        sliderFill(slider)

      }

    }

    if (save) localMeshes("update", mesh)

  } else if (type == "lock") {

    let meshPanel = $("#mesh." + mesh.uuid + "")
    let meshesTableRow = $("#meshes.table tr#" + mesh.uuid + "")

    if (mesh.lock == "locked") {

      mesh.lock = "unlocked"

      composer.outlinePass.visibleEdgeColor.set(blackThree)

      meshPanel.find("#join.operation").attr("src", "/app/imgs/panels/ops/default/join.png")
      meshPanel.find("#cut.operation").attr("src", "/app/imgs/panels/ops/default/cut.png")
      meshPanel.find("#intersect.operation").attr("src", "/app/imgs/panels/ops/default/intersect.png")

      meshPanel.find("#name span").removeClass("disabled")
      meshPanel.find(".operation").removeClass("disabled")
      meshPanel.find(".color").removeClass("disabled")

      meshPanel.find("#eye").removeClass("disabled")
      meshPanel.find("#visibility").removeClass("disabled").slider("enable")
      meshPanel.find("#lock").attr("src", "/app/imgs/panels/lock/" + mesh.lock + ".png")
      meshPanel.find("#trash").removeClass("disabled")

      sliderStyle(meshPanel.find("#visibility"))

      meshPanel.find("input").removeClass("disabled")
      meshPanel.find("button").removeClass("disabled")

      meshesTableRow.find(".name span").removeClass("disabled")
      meshesTableRow.find(".lock").attr("src", "/app/imgs/panels/lock/" + mesh.lock + ".png")
      meshesTableRow.find(".trash").removeClass("disabled")

    } else if (mesh.lock == "unlocked") {

      mesh.lock = "locked"

      composer.outlinePass.visibleEdgeColor.set(redThree)

      if (events.operation.mesh == mesh) { clearMeshOperation() }

      meshPanel.find("#join.operation").attr("src", "/app/imgs/panels/ops/disabled/join.png")
      meshPanel.find("#cut.operation").attr("src", "/app/imgs/panels/ops/disabled/cut.png")
      meshPanel.find("#intersect.operation").attr("src", "/app/imgs/panels/ops/disabled/intersect.png")

      meshPanel.find("#name span").addClass("disabled")
      meshPanel.find(".operation").addClass("disabled")
      meshPanel.find(".color").addClass("disabled")

      meshPanel.find("#eye").addClass("disabled")
      meshPanel.find("#visibility").addClass("disabled").slider("disable")
      meshPanel.find("#lock").attr("src", "/app/imgs/panels/lock/" + mesh.lock + ".png")
      meshPanel.find("#trash").addClass("disabled")

      sliderStyle(meshPanel.find("#visibility"))

      meshPanel.find("input").addClass("disabled")
      meshPanel.find("button").addClass("disabled")

      meshesTableRow.find(".name span").addClass("disabled")
      meshesTableRow.find(".lock").attr("src", "/app/imgs/panels/lock/" + mesh.lock + ".png")
      meshesTableRow.find(".trash").addClass("disabled")

    }

    localMeshes("update", mesh)

  } else if ((type == "properties" || type == "position" || type == "rotation" || type == "scale") && mesh.lock != "locked") {

    let input = panel.find("span#" + type + "-" + key + " input")

    let min = Number(input.attr("min"))
    let max = Number(input.attr("max"))

    value = value < min ? min : value > max ? max : key.includes("segments") ? value.toFixed(0) : value

    if (save == "temp" || key.includes("segments") || value == min || value == max) input.val(value)

    switch (type) {

      case "properties":

        mesh.geometry.dispose()

        let parameters = mesh.geometry.parameters

        if (mesh.class == "box") {

          let length = key == "length" ? value : parameters.width
          let width = key == "width" ? value : parameters.height
          let height = key == "height" ? value : parameters.depth

          mesh.geometry = new THREE.BoxGeometry(length, width, height)

        } else if (mesh.class == "sphere") {

          let radius = key == "radius" ? value : parameters.radius
          let widthSegments = key == "width-segments" ? value : parameters.widthSegments
          let heightSegments = key == "height-segments" ? value : parameters.heightSegments

          mesh.geometry = new THREE.SphereGeometry(radius, widthSegments, heightSegments)

        } else if (mesh.class == "cylinder" || mesh.class.split("-")[1] == "prism") {

          let length = key == "length" ? value : parameters.height
          let positiveRadius = key == "radius-positive" ? value : parameters.radiusTop
          let negativeRadius = key == "radius-negative" ? value : parameters.radiusBottom
          let radialSegments = key == "radius-segments" ? value : parameters.radialSegments

          mesh.geometry = new THREE.CylinderGeometry(positiveRadius, negativeRadius, length, radialSegments)

        } else if (mesh.class == "cone" || mesh.class.split("-")[1] == "pyramid") {

          let height = key == "height" ? value : parameters.height
          let radius = key == "radius" ? value : parameters.radiusBottom
          let radialSegments = key == "radius-segments" ? value : parameters.radialSegments

          mesh.geometry = new THREE.CylinderGeometry(0, radius, height, radialSegments)

        } else if (mesh.class == "torus") {

          let radius = key == "radius" ? value : parameters.radius
          let thickness = key == "thickness" ? value : parameters.tube
          let radialSegments = key == "radius-segments" ? value : parameters.radialSegments
          let tubularSegments = key == "tube-segments" ? value : parameters.tubularSegments

          mesh.geometry = new THREE.TorusGeometry(radius, thickness, radialSegments, tubularSegments)

        }

        updateMetrics(mesh)

        break

      case "position":

        mesh[type][key] = value

        mesh.updateMatrix()

        break

      case "rotation":

        mesh[type][key] = degree2radian(value)

        mesh.updateMatrix()

        break

      case "scale":

        mesh[type][key] = value

        updateMetrics(mesh)

        break

    }

    if (save === true) localMeshes("update", mesh)

  }

}

export function removeMesh(mesh) {

  if (mesh.lock != "locked") {

    $("body").css("cursor", "")
    $("#canvas").css("cursor", "")

    events.removeEventListener(mesh, "mouseover")
    events.removeEventListener(mesh, "mousemove")
    events.removeEventListener(mesh, "mouseout")
    events.removeEventListener(mesh, "mousedown")

    events.removeEventListener(mesh, "click")
    events.removeEventListener(mesh, "dblclick")
    events.removeEventListener(mesh, "contextmenu")

    if (events.operation.mesh == mesh) { clearMeshOperation() }

    updateMeshesPanel("remove", mesh)
    localMeshes("remove", mesh)

    mesh.geometry.dispose()
    mesh.material.dispose()

    scene.remove(mesh)

  }

}