import {contextMenu} from "./context.mjs"
import {dragable} from "../libs/etc/events.mjs"
import {focus} from "../libs/controls/focus.mjs"

import {addBox} from "../libs/geometries/boxes.mjs"
import {addCylinder} from "../libs/geometries/cylinders.mjs"
import {addSphere} from "../libs/geometries/spheres.mjs"

import {joinMesh, cutMesh, intersectMesh} from "../../libs/meshOperations.mjs"

export function addMeshPanel(mesh) {

  if ($("#mesh." + mesh.uuid + "").length == 0) {

    $("body").append("<div id='mesh' class='panel " + mesh.uuid + "'><h3>Mesh</h3></div>")

    let panel = $("#mesh." + mesh.uuid + "")

    let coordinates = world2screenCoordinates(mesh.position.x, mesh.position.y, mesh.position.z)

    panel.css({top: coordinates.y, left: coordinates.x})

    panel.append("<p id='type'><b>Type:</b> " + mesh.class.replace(/\b\w/g, function(char) { return char.toUpperCase() }) + "</p>")
    panel.append("<p id='surface'><b>Surface:</b> " + mesh.surface.toFixed(2) + "</p>")
    panel.append("<p id='volume'><b>Volume:</b> " + mesh.volume.toFixed(2) + "</p>")

    panel.append("<h4><b>Position</b></h4>")
    panel.append("<span id='position-x'><label><b>X</b> <input type=number step=1 min=" + -(data.scale * 3) + " max=" + data.scale * 3 + "><button id='plus'>+</button><button id='minus'>-</button></label></span>")
    panel.append("<span id='position-y'><label><b>Y</b> <input type=number step=1 min=" + -(data.scale * 3) + " max=" + data.scale * 3 + "><button id='plus'>+</button><button id='minus'>-</button></label></span>")
    panel.append("<span id='position-z'><label><b>Z</b> <input type=number step=1 min=" + -(data.scale * 3) + " max=" + data.scale * 3 + "><button id='plus'>+</button><button id='minus'>-</button></label></span>")

    panel.append("<h4><b>Rotation</b></h4>")
    panel.append("<span id='rotation-x'><label><b>X</b> <input type=number step=1 min=-360 max=360><button id='plus'>+</button><button id='minus'>-</button></label></span>")
    panel.append("<span id='rotation-y'><label><b>Y</b> <input type=number step=1 min=-360 max=360><button id='plus'>+</button><button id='minus'>-</button></label></span>")
    panel.append("<span id='rotation-z'><label><b>Z</b> <input type=number step=1 min=-360 max=360><button id='plus'>+</button><button id='minus'>-</button></label></span>")

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

    dragable(panel)

  }

}

export function addMesh(mesh=null, properties={}) {

  if (properties.type) {

    switch (properties.type) {

      case "box":
        mesh = addBox()
        break

      case "cylinder":
        mesh = addCylinder()
        mesh.rotation.x = degree2radian(90)
        break

      case "sphere":
        mesh = addSphere()
        break

    }

  } else if (mesh) { data.scene.add(mesh) }

  data.events.addEventListener(mesh, "mousemove", function(event) { $("body").css("cursor", "url('app/imgs/icons/cursors/grab.png'), grab") })
  data.events.addEventListener(mesh, "mousedown", function(event) { dragable(mesh, event.origDomEvent) })
  data.events.addEventListener(mesh, "mouseout", function(event) { $("body").css("cursor", "") })

  data.events.addEventListener(mesh, "click", function(event) { updateMesh(mesh, "operation", data.events.operation.key, null) })
  data.events.addEventListener(mesh, "dblclick", function(event) { focus({x: mesh.position.x, y: mesh.position.y, z: mesh.position.z}) })
  data.events.addEventListener(mesh, "contextmenu", function(event) { contextMenu("mesh", mesh, event.origDomEvent) })

  properties.type ? mesh.class = properties.type : mesh.class = "custom"

  if (properties.position) {

    mesh.position.x = properties.position.x
    mesh.position.y = properties.position.y
    mesh.position.z = properties.position.z

  }

  mesh.surface = getSurfaceArea(mesh)
  mesh.volume = getVolume(mesh)

  data.meshes.push(mesh)

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
        if (panel.length) { panel.removeClass("" + data.events.operation.mesh.uuid + "").addClass("" + result.uuid + ""); updateMesh(result, "meta") }

        removeMesh(data.events.operation.mesh)

      }

      $("#canvas").css("cursor", "")

      data.events.operation.mesh = null
      data.events.operation.key = null

    }

  } else if (type == "meta") {

    $("#mesh." + mesh.uuid + " #type").html("<b>Type:</b> " + mesh.class.replace(/\b\w/g, function(char) { return char.toUpperCase() }) + "")
    $("#mesh." + mesh.uuid + " #surface").html("<b>Surface:</b> " + mesh.surface.toFixed(2) + "")
    $("#mesh." + mesh.uuid + " #volume").html("<b>Volume:</b> " + mesh.volume.toFixed(2) + "")

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
