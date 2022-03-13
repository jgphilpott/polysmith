import {addPanelEvents, dragable} from "../libs/etc/events.mjs"
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

    panel.append("<p id='type'><b>Type:</b> " + mesh.class.replace(/\b\w/g, function(char) { return char.toUpperCase() }) + "</p>")
    panel.append("<p id='surface'><b>Surface:</b> " + mesh.surface.toFixed(2) + "</p>")
    panel.append("<p id='volume'><b>Volume:</b> " + mesh.volume.toFixed(2) + "</p>")

    let position = ""
    let rotation = ""

    position += "<div id='position'><h4><b>Position</b></h4>"
    position += "<span id='position-x'><label><b>X</b> <input type=number step=1 min=" + -(data.scale * 3) + " max=" + data.scale * 3 + "><button id='plus'>+</button><button id='minus'>-</button></label></span>"
    position += "<span id='position-y'><label><b>Y</b> <input type=number step=1 min=" + -(data.scale * 3) + " max=" + data.scale * 3 + "><button id='plus'>+</button><button id='minus'>-</button></label></span>"
    position += "<span id='position-z'><label><b>Z</b> <input type=number step=1 min=" + -(data.scale * 3) + " max=" + data.scale * 3 + "><button id='plus'>+</button><button id='minus'>-</button></label></span></div>"

    rotation += "<div id='rotation'><h4><b>Rotation</b></h4>"
    rotation += "<span id='rotation-x'><label><b>X</b> <input type=number step=1 min=-360 max=360><button id='plus'>+</button><button id='minus'>-</button></label></span>"
    rotation += "<span id='rotation-y'><label><b>Y</b> <input type=number step=1 min=-360 max=360><button id='plus'>+</button><button id='minus'>-</button></label></span>"
    rotation += "<span id='rotation-z'><label><b>Z</b> <input type=number step=1 min=-360 max=360><button id='plus'>+</button><button id='minus'>-</button></label></span></div>"

    panel.append(position)
    panel.append(rotation)

    $("#mesh." + mesh.uuid + " #position-x input").val(mesh.position.x.toFixed(2))
    $("#mesh." + mesh.uuid + " #position-y input").val(mesh.position.y.toFixed(2))
    $("#mesh." + mesh.uuid + " #position-z input").val(mesh.position.z.toFixed(2))

    $("#mesh." + mesh.uuid + " #rotation-x input").val(radian2degree(mesh.rotation.x).toFixed(2))
    $("#mesh." + mesh.uuid + " #rotation-y input").val(radian2degree(mesh.rotation.y).toFixed(2))
    $("#mesh." + mesh.uuid + " #rotation-z input").val(radian2degree(mesh.rotation.z).toFixed(2))

    $("#mesh." + mesh.uuid + " input").mousedown(function(event) { event.stopPropagation() })

    $("#mesh." + mesh.uuid + " input").keypress(function(event) { event.stopPropagation(); if (event.keyCode == 13) this.blur() })
    $("#mesh." + mesh.uuid + " input").keydown(function(event) { event.stopPropagation() })
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

    data.events.addEventListener(mesh, "mousemove", function(event) { $("body").css("cursor", "url('app/imgs/icons/cursors/grab.png'), grab") })
    data.events.addEventListener(mesh, "mousedown", function(event) { dragable(mesh, event.origDomEvent) })
    data.events.addEventListener(mesh, "mouseout", function(event) { $("body").css("cursor", "") })

    data.events.addEventListener(mesh, "click", function(event) { updateMesh(mesh, "operation", data.events.operation.key, null) })
    data.events.addEventListener(mesh, "dblclick", function(event) { focus({x: mesh.position.x, y: mesh.position.y, z: mesh.position.z}) })
    data.events.addEventListener(mesh, "contextmenu", function(event) { contextMenu("mesh", mesh, event.origDomEvent) })

    if (properties.position) {

      mesh.position.x = properties.position.x
      mesh.position.y = properties.position.y
      mesh.position.z = properties.position.z

    }

    mesh.surface = getSurfaceArea(mesh)
    mesh.volume = getVolume(mesh)

    data.meshes.push(mesh)
    data.scene.add(mesh)

  }

  return mesh

}

export function updateMesh(mesh, type, key=null, value=null) {

  if (type == "position" || type == "rotation") {

    let input = $("#mesh." + mesh.uuid + " #" + type + "-" + key + " input")

    if (value > input.attr("max")) { value = input.attr("max") }
    if (value < input.attr("min")) { value = input.attr("min") }

    input.val(value)

    if (type == "rotation") { value = degree2radian(value) }

    mesh[type][key] = value

  } else if (type == "operation") {

    if (value == "setup") {

      $("#canvas").css("cursor", "url('app/imgs/icons/cursors/copy.png'), copy")

      data.events.operation.mesh = mesh
      data.events.operation.key = key

    } else if (data.events.operation.key && !data.camera.dragged) {

      if (data.events.operation.mesh.uuid != mesh.uuid) {

        let result = null

        switch (key) {

          case "cut":
            result = cutMesh(data.events.operation.mesh, mesh)
            break

          case "join":
            result = joinMesh(data.events.operation.mesh, mesh)
            break

          case "intersect":
            result = intersectMesh(data.events.operation.mesh, mesh)
            break

        }

        addMesh(result)

        let panel = $("#mesh." + data.events.operation.mesh.uuid + "")
        if (panel.length) addMeshPanel(result, {x: parseFloat(panel.css("left")), y: parseFloat(panel.css("top"))})

        removeMesh(data.events.operation.mesh)

      }

      $("#canvas").css("cursor", "")

      data.events.operation.mesh = null
      data.events.operation.key = null

    }

  }

}

export function removeMesh(mesh) {

  $("body").css("cursor", "")

  $("#mesh." + mesh.uuid + "").remove()

  data.meshes = data.meshes.filter(obj => obj.uuid != mesh.uuid)

  data.events.removeEventListener(mesh, "mousemove")
  data.events.removeEventListener(mesh, "mousedown")
  data.events.removeEventListener(mesh, "mouseout")

  data.events.removeEventListener(mesh, "click")
  data.events.removeEventListener(mesh, "dblclick")
  data.events.removeEventListener(mesh, "contextmenu")

  data.scene.remove(mesh)

}