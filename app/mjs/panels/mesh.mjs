import {contextMenu} from "./context.mjs"
import {dragable} from "../libs/etc/events.mjs"
import {focus} from "../libs/controls/focus.mjs"

import {addBox} from "../libs/geometries/boxes.mjs"
import {addCylinder} from "../libs/geometries/cylinders.mjs"
import {addSphere} from "../libs/geometries/spheres.mjs"

export function addMeshPanel(mesh) {

  if ($("#mesh." + mesh.uuid + "").length == 0) {

    $("body").append("<div id='mesh' class='panel " + mesh.uuid + "'><h3>Mesh</h3></div>")

    let panel = $("#mesh." + mesh.uuid + "")

    let coordinates = world2screenCoordinates(mesh.position.x, mesh.position.y, mesh.position.z)

    panel.css({top: coordinates.y, left: coordinates.x})

    panel.append("<p><b>Type:</b> " + mesh.class.replace(/\b\w/g, function(char) { return char.toUpperCase() }) + "</p>")
    panel.append("<p><b>Surface:</b> " + mesh.surface.toFixed(2) + "</p>")
    panel.append("<p><b>Volume:</b> " + mesh.volume.toFixed(2) + "</p>")

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

    $("#mesh." + mesh.uuid + " input").mousedown(function(event) {
      event.stopPropagation()
    })

    $("#mesh." + mesh.uuid + " input").keydown(function(event) {
      event.stopPropagation()
    })

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

export function addMesh(type, position=[0, 0, 0]) {

  let mesh = null

  switch (type) {

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

  data.events.addEventListener(mesh, "mouseover", function(event) { $("body").css("cursor", "url('app/imgs/icons/cursors/grab.png'), grab") })
  data.events.addEventListener(mesh, "mouseout", function(event) { $("body").css("cursor", "") })
  data.events.addEventListener(mesh, "mousedown", function(event) { dragMesh(mesh, event.origDomEvent) })

  data.events.addEventListener(mesh, "dblclick", function(event) { focus({x: mesh.position.x, y: mesh.position.y, z: mesh.position.z}) })
  data.events.addEventListener(mesh, "contextmenu", function(event) { contextMenu("mesh", mesh, event.origDomEvent) })

  mesh.position.x = position[0]
  mesh.position.y = position[1]
  mesh.position.z = position[2]

  mesh.surface = getSurfaceArea(mesh)
  mesh.volume = getVolume(mesh)
  mesh.class = type

  return mesh

}

export function updateMesh(mesh, type, key, value) {

  let input = $("#mesh." + mesh.uuid + " #" + type + "-" + key + " input")

  if (value > input.attr("max")) { value = input.attr("max") }
  if (value < input.attr("min")) { value = input.attr("min") }

  input.val(value)

  if (type == "rotation") { value = degree2radian(value) }

  mesh[type][key] = value

}

export function dragMesh(mesh, event) {

  function drag(event) {

    let max = 300
    let min = -300

    $("body").css("cursor", "url('app/imgs/icons/cursors/grabbing.png'), grabbing")

    let coordinates = screen2worldCoordinates(event.clientX, event.clientY, mesh.position.z)

    if (coordinates.x > max) { coordinates.x = max}
    if (coordinates.x < min) { coordinates.x = min}

    if (coordinates.y > max) { coordinates.y = max}
    if (coordinates.y < min) { coordinates.y = min}

    $("#mesh." + mesh.uuid + " #position-x input").val(coordinates.x.toFixed(2))
    $("#mesh." + mesh.uuid + " #position-y input").val(coordinates.y.toFixed(2))

    mesh.position.x = coordinates.x
    mesh.position.y = coordinates.y

  }

  function stop(event) {

    $("body").css("cursor", "url('app/imgs/icons/cursors/grab.png'), grab")

    document.onmousemove = null
    document.onmouseup = null

  }

  document.onmousemove = drag
  document.onmouseup = stop

}

export function removeMesh(mesh) {

  $("#mesh." + mesh.uuid + "").remove()

  data.events.removeEventListener(mesh, "dblclick")
  data.events.removeEventListener(mesh, "contextmenu")

  data.scene.remove(mesh)

}
