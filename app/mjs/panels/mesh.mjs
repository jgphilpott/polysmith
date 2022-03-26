import {addPanelEvents, dragable} from "../libs/etc/events.mjs"
import {updateMeshesPanel} from "./meshes.mjs"
import {contextMenu} from "./context.mjs"
import {focus} from "../libs/controls/focus.mjs"

import {newBox} from "../libs/geometries/boxes.mjs"
import {newCylinder} from "../libs/geometries/cylinders.mjs"
import {newSphere} from "../libs/geometries/spheres.mjs"
import {newTorus} from "../libs/geometries/toruses.mjs"

import {grayGlass, lightGrayGlass} from "../libs/colors/glass/grayscale.mjs"

import {joinMesh, cutMesh, intersectMesh} from "../../libs/meshOperations.mjs"

export function addMeshPanel(mesh, coordinates=null) {

  let panel = $("#mesh." + mesh.uuid + "")

  if (panel.length == 0) {

    $("body").append("<div id='mesh' class='panel " + mesh.uuid + "'><img class='close' src='/app/imgs/panels/nav/close.png'></div>")

    if (!coordinates) coordinates = world2screenCoordinates(mesh.position.x, mesh.position.y, mesh.position.z)

    $("#mesh." + mesh.uuid + "").css({top: coordinates.y, left: coordinates.x})

    panel = $("#mesh." + mesh.uuid + "")

    panel.append("<h3>Mesh</h3>")

    let operations = "<div id='operations'>"

    let meta = "<div id='meta'>"

    let position = "<div id='position'><h4><b>Position</b></h4>"
    let rotation = "<div id='rotation'><h4><b>Rotation</b></h4>"

    operations += "<img title='Join' id='join' class='operation' src='/app/imgs/panels/ops/join.png'>"
    operations += "<img title='Cut' id='cut' class='operation' src='/app/imgs/panels/ops/cut.png'>"
    operations += "<img title='Intersect' id='intersect' class='operation' src='/app/imgs/panels/ops/intersect.png'>"

    meta += "<p id='type'><b>Type:</b> " + mesh.class.replace(/\b\w/g, function(char) { return char.toUpperCase() }).replace("-", " ") + "</p>"
    meta += "<p id='surface'><b>Surface:</b> " + mesh.surface.toFixed(2) + "</p>"
    meta += "<p id='volume'><b>Volume:</b> " + mesh.volume.toFixed(2) + "</p>"

    position += "<span id='position-x'><label><b id='x'>X</b> <input type=number step=1 min=" + -(scale * 3) + " max=" + scale * 3 + "><button id='plus'>+</button><button id='minus'>-</button></label></span>"
    position += "<span id='position-y'><label><b id='y'>Y</b> <input type=number step=1 min=" + -(scale * 3) + " max=" + scale * 3 + "><button id='plus'>+</button><button id='minus'>-</button></label></span>"
    position += "<span id='position-z'><label><b id='z'>Z</b> <input type=number step=1 min=" + -(scale * 3) + " max=" + scale * 3 + "><button id='plus'>+</button><button id='minus'>-</button></label></span>"

    rotation += "<span id='rotation-x'><label><b id='x'>X</b> <input type=number step=1 min=-360 max=360><button id='plus'>+</button><button id='minus'>-</button></label></span>"
    rotation += "<span id='rotation-y'><label><b id='y'>Y</b> <input type=number step=1 min=-360 max=360><button id='plus'>+</button><button id='minus'>-</button></label></span>"
    rotation += "<span id='rotation-z'><label><b id='z'>Z</b> <input type=number step=1 min=-360 max=360><button id='plus'>+</button><button id='minus'>-</button></label></span>"

    panel.append(operations + "</div>")

    panel.append(meta + "</div>")

    panel.append(position + "</div>")
    panel.append(rotation + "</div>")

    if (mesh.lock == "locked") {

      $("#mesh." + mesh.uuid + " input").addClass("disabled")
      $("#mesh." + mesh.uuid + " button").addClass("disabled")

    }

    $("#mesh." + mesh.uuid + " #position-x input").val(mesh.position.x.toFixed(2))
    $("#mesh." + mesh.uuid + " #position-y input").val(mesh.position.y.toFixed(2))
    $("#mesh." + mesh.uuid + " #position-z input").val(mesh.position.z.toFixed(2))

    $("#mesh." + mesh.uuid + " #rotation-x input").val(radian2degree(mesh.rotation.x).toFixed(2))
    $("#mesh." + mesh.uuid + " #rotation-y input").val(radian2degree(mesh.rotation.y).toFixed(2))
    $("#mesh." + mesh.uuid + " #rotation-z input").val(radian2degree(mesh.rotation.z).toFixed(2))

    $("#mesh." + mesh.uuid + " input").mousedown(function(event) { event.stopPropagation(); if (mesh.lock == "locked") event.preventDefault() })

    $("#mesh." + mesh.uuid + " input").keypress(function(event) { event.stopPropagation(); if (event.keyCode == 13) this.blur() })
    $("#mesh." + mesh.uuid + " input").keydown(function(event) { event.stopPropagation(); if (mesh.lock == "locked") event.preventDefault() })
    $("#mesh." + mesh.uuid + " input").keyup(function(event) {

      let selection = $(this).parent().parent().attr("id").split("-")

      updateMesh(mesh, selection[0], selection[1], Number($(this).val()))

    })

    $("#mesh." + mesh.uuid + " input").on("change", function(event) {

      let selection = $(this).parent().parent().attr("id").split("-")

      updateMesh(mesh, selection[0], selection[1], Number($(this).val()))

    })

    $("#mesh." + mesh.uuid + " button").mousedown(function(event) {

      event.stopPropagation()

      let operation = $(this).attr("id")
      let selection = $(this).parent().parent().attr("id")
      let value = Number($("#mesh." + mesh.uuid + " #" + selection + " input").val())
      let step = Number($("#mesh." + mesh.uuid + " #" + selection + " input").attr("step"))

      if (operation == "plus") {
        value += step
      } else if (operation == "minus") {
        value -= step
      }

      updateMesh(mesh, selection.split("-")[0], selection.split("-")[1], value)

    })

    panel.mouseover(function() { $("#context-menu.panel").remove() })

    addPanelEvents(panel)

  } else {

    setTimeout(function() { panel.css("background", grayGlass) }, 0)
    setTimeout(function() { panel.css("background", lightGrayGlass) }, 100)
    setTimeout(function() { panel.css("background", grayGlass) }, 200)
    setTimeout(function() { panel.css("background", lightGrayGlass) }, 300)

  }

}

export function addMesh(mesh=null, properties={}) {

  if (properties.type) {

    switch (properties.type) {

      case "cube":

        mesh = newBox()
        mesh.rotation.x = degree2radian(0)

        break

      case "cylinder":

        mesh = newCylinder()
        mesh.rotation.x = degree2radian(90)

        break

      case "sphere":

        mesh = newSphere()
        mesh.rotation.x = degree2radian(0)

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

    properties.type ? mesh.class = properties.type : mesh.class = "custom"
    properties.lock ? mesh.lock = properties.lock : mesh.lock = "unlocked"

    events.addEventListener(mesh, "mousemove", function(event) { mesh.lock == "locked" ? $("body").css("cursor", "url('app/imgs/icons/cursors/not-allowed.png'), not-allowed") : $("body").css("cursor", "url('app/imgs/icons/cursors/grab.png'), grab") })
    events.addEventListener(mesh, "mousedown", function(event) { dragable(mesh, event.origDomEvent) })
    events.addEventListener(mesh, "mouseout", function(event) { $("body").css("cursor", "") })

    events.addEventListener(mesh, "click", function(event) { updateMesh(mesh, "operation", events.operation.key, null) })
    events.addEventListener(mesh, "dblclick", function(event) { focus({x: mesh.position.x, y: mesh.position.y, z: mesh.position.z}) })
    events.addEventListener(mesh, "contextmenu", function(event) { contextMenu("mesh", mesh, event.origDomEvent) })

    if (properties.position) {

      mesh.position.x = properties.position.x
      mesh.position.y = properties.position.y
      mesh.position.z = properties.position.z

    }

    mesh.surface = getSurfaceArea(mesh)
    mesh.volume = getVolume(mesh)

    updateMeshesPanel("add", mesh)

    scene.add(mesh)

  }

  return mesh

}

export function updateMesh(mesh, type, key=null, value=null) {

  if ((type == "position" || type == "rotation") && mesh.lock != "locked") {

    let input = $("#mesh." + mesh.uuid + " #" + type + "-" + key + " input")

    if (value > input.attr("max")) { value = input.attr("max") }
    if (value < input.attr("min")) { value = input.attr("min") }

    input.val(value)

    if (type == "rotation") { value = degree2radian(value) }

    mesh[type][key] = value

  } else if (type == "operation" && mesh.lock != "locked") {

    if (value == "setup") {

      $("#canvas").css("cursor", "url('app/imgs/icons/cursors/copy.png'), copy")

      events.operation.mesh = mesh
      events.operation.key = key

    } else if (events.operation.key && !camera.dragged) {

      if (events.operation.mesh.uuid != mesh.uuid) {

        let result = null

        switch (key) {

          case "cut":
            result = cutMesh(events.operation.mesh, mesh)
            break

          case "join":
            result = joinMesh(events.operation.mesh, mesh)
            break

          case "intersect":
            result = intersectMesh(events.operation.mesh, mesh)
            break

        }

        addMesh(result)

        let panel = $("#mesh." + events.operation.mesh.uuid + "")
        if (panel.length) addMeshPanel(result, {x: parseFloat(panel.css("left")), y: parseFloat(panel.css("top"))})

        removeMesh(events.operation.mesh)

      }

      $("#canvas").css("cursor", "")

      events.operation.mesh = null
      events.operation.key = null

    }

  } else if (type == "lock") {

    if (mesh.lock == "locked") {

      mesh.lock = "unlocked"

      $("#mesh." + mesh.uuid + " input").removeClass("disabled")
      $("#mesh." + mesh.uuid + " button").removeClass("disabled")

      $("#meshes.table tr#" + mesh.uuid + " .lock").attr("src", '/app/imgs/panels/lock/unlocked.png')
      $("#meshes.table tr#" + mesh.uuid + " .trash").removeClass("disabled")

    } else if (mesh.lock == "unlocked") {

      mesh.lock = "locked"

      $("#mesh." + mesh.uuid + " input").addClass("disabled")
      $("#mesh." + mesh.uuid + " button").addClass("disabled")

      $("#meshes.table tr#" + mesh.uuid + " .lock").attr("src", '/app/imgs/panels/lock/locked.png')
      $("#meshes.table tr#" + mesh.uuid + " .trash").addClass("disabled")

    }

  }

}

export function removeMesh(mesh) {

  if (mesh.lock != "locked") {

    $("body").css("cursor", "")

    events.removeEventListener(mesh, "mousemove")
    events.removeEventListener(mesh, "mousedown")
    events.removeEventListener(mesh, "mouseout")

    events.removeEventListener(mesh, "click")
    events.removeEventListener(mesh, "dblclick")
    events.removeEventListener(mesh, "contextmenu")

    updateMeshesPanel("remove", mesh)

    scene.remove(mesh)

  }

}