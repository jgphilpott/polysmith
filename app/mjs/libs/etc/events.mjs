import {focus} from "../controls/focus.mjs"
import {newLine} from "../geometries/lines.mjs"
import {exportFile} from "../files/export.mjs"
import {localMeshes} from "../files/local.mjs"
import {contextMenu} from "../../panels/context.mjs"
import {addMesh, updateMesh} from "../../panels/mesh.mjs"
import {grayGlass, lightGrayGlass} from "../colors/glass/grayscale.js"

export function addEvents() {

  events = new THREEx.DomEvents(camera, canvas)

  events.operation = {mesh: null, key: null}
  events.zIndex = 0

  $(window).on("resize", function() {

    for (let i = 0; i < axes.length; i++) { if (axes[i].type == "Line2") axes[i].material.resolution.set(window.innerWidth, window.innerHeight) }

    data.renderer.setSize(window.innerWidth, window.innerHeight)
    data.composer.setSize(window.innerWidth, window.innerHeight)

    camera.aspect = window.innerWidth / window.innerHeight
    camera.updateProjectionMatrix()

  })

  $("body").keypress(function(event) {

    // Ctrl + Enter
    if (event.ctrlKey && (event.keyCode == 13 || event.keyCode == 10)) {

      event.preventDefault()
      event.stopPropagation()

      exportFile("stl")

    // Shift + Enter
    } else if (event.shiftKey && event.keyCode == 13) {

      event.preventDefault()
      event.stopPropagation()

      exportFile("obj")

    }

  })

  $("#canvas").click(function(event) {

    if (events.operation.key && !camera.dragged) { clearMeshOperation() }

  })

  $("#canvas").mousedown(function(event) {

    window.getSelection().removeAllRanges()

    $("input").toArray().forEach(input => { if ($(input).is(":focus")) $(input).blur() })
    $("[contenteditable]").toArray().forEach(editor => { if ($(editor).is(":focus")) $(editor).blur() })

  })

  $("#nav, #forkme, .panel").mousemove(function(event) {

    data.outlinePass.selectedObjects = []

  })

  return events

}

export function addPanelEvents(panel) {

  let queue = false
  let duration = 1000

  let id = panel.attr("id")
  let close = panel.find(".close")

  panel.mouseenter(function(event) {

    events.zIndex += 1

    $("#context-menu.panel").remove()

    panel.css("z-index", events.zIndex)

  }).mouseover(function(event) {

    close.animate({opacity: 1}, {duration: duration, queue: queue})
    panel.animate({backgroundColor: grayGlass}, {duration: duration, queue: queue})

  }).mouseout(function(event) {

    close.animate({opacity: 0}, {duration: duration, queue: queue})
    panel.animate({backgroundColor: lightGrayGlass}, {duration: duration, queue: queue})

  })

  close.click(function(event) {

    if (id == "mesh") {

      panel.css("visibility", "hidden")

      let uuid = panel.data("mesh").uuid

      $("#meshes.table tr#" + uuid + " .settings").attr("src", "/app/imgs/panels/tools/toggle/off.png")

    } else {

      updateSettings("panels", id, false)

    }

  }).mousedown(function(event) { event.stopPropagation() }).mouseup(function(event) { event.stopPropagation() })

  if (id != "mesh") settings.panels[id] ? panel.css("visibility", "visible") : panel.css("visibility", "hidden")

  makeDragable(panel)

  return panel

}

export function addMeshEvents(mesh) {

  events.addEventListener(mesh, "mousemove", function(event) {

    if (!events.operation.key) {

      if (mesh.lock == "locked") {

        $("#canvas").css("cursor", "not-allowed")

      } else {

        $("#canvas").css("cursor", "grab")

        data.outlinePass.selectedObjects = [mesh]

      }

    } else {

      events.operation.mesh.uuid == mesh.uuid || mesh.lock == "locked" ? $("#canvas").css("cursor", "not-allowed") : data.outlinePass.selectedObjects = [mesh]

    }

  })

  events.addEventListener(mesh, "mousedown", function(event) {

    if (mesh.lock != "locked") makeDragable(mesh, event.origDomEvent)

  })

  events.addEventListener(mesh, "mouseout", function(event) {

    data.outlinePass.selectedObjects = []

    !events.operation.key ? $("#canvas").css("cursor", "") : $("#canvas").css("cursor", "copy")

  })

  events.addEventListener(mesh, "click", function(event) {

    updateMesh(mesh, "operation", events.operation.key, null, true)

  })

  events.addEventListener(mesh, "dblclick", function(event) {

    focus({x: mesh.position.x, y: mesh.position.y, z: mesh.position.z})

  })

  events.addEventListener(mesh, "contextmenu", function(event) {

    contextMenu("mesh", mesh, event.origDomEvent)

  })

}

export function makeDragable(element, origEvent=null) {

  let dragged = null
  let xOffset, yOffset = 0
  let max = scale * 3
  let min = - (scale * 3)

  function start(event) {

    if (element.type == "Mesh") {

      if (element.lock != "locked") {

        $("#canvas").css("cursor", "grabbing")

        let coordinates = world2screenCoordinates(element.position.x, element.position.y, element.position.z)

        xOffset = origEvent.clientX - coordinates.x
        yOffset = origEvent.clientY - coordinates.y

        tooltips.distanceLines = []

      }

    } else {

      event.stopPropagation()

      $("body").css("cursor", "grabbing")

      if (element.hasClass("panel")) {

        let transform = element.css("transform").replace(/[{()}]/g, "").replace(/[a-zA-Z]/g, "").split(",")

        xOffset = event.clientX - element.position().left + Number(transform[4])
        yOffset = event.clientY - element.position().top + Number(transform[5])

      } else if (element.hasClass("shape")) {

        $("body").append("<img class='ghost-shape' src='" + element.attr("src") + "'>")

        $(".ghost-shape").css("z-index", events.zIndex + 1)

        xOffset = event.clientX - element.offset().left
        yOffset = event.clientY - element.offset().top

      }

    }

    document.onmousemove = drag
    document.onmouseup = stop

  }

  function drag(event) {

    dragged = true

    let eventX = event.clientX - xOffset
    let eventY = event.clientY - yOffset

    if (element.type == "Mesh") {

      if (element.lock != "locked") {

        $("#canvas").css("cursor", "grabbing")

        let coordinates = screen2worldCoordinates(eventX, eventY, element.position.z)

        coordinates.x = coordinates.x < min ? min : coordinates.x > max ? max : coordinates.x
        coordinates.y = coordinates.y < min ? min : coordinates.y > max ? max : coordinates.y

        $("#mesh." + element.uuid + " #position-x input").val(coordinates.x.toFixed(2))
        $("#mesh." + element.uuid + " #position-y input").val(coordinates.y.toFixed(2))

        element.position.x = coordinates.x
        element.position.y = coordinates.y

        for (let i = 0; i < tooltips.distanceLines.length; i++) { scene.remove(tooltips.distanceLines[i]) }

        let xDistanceLine = newLine([[0, coordinates.y, coordinates.z], [coordinates.x, coordinates.y, coordinates.z]], "dashed")
        let yDistanceLine = newLine([[coordinates.x, 0, coordinates.z], [coordinates.x, coordinates.y, coordinates.z]], "dashed")
        let zDistanceLine = newLine([[coordinates.x, coordinates.y, 0], [coordinates.x, coordinates.y, coordinates.z]], "dashed")

        tooltips.distanceLines.push(xDistanceLine, yDistanceLine, zDistanceLine)
        scene.add(xDistanceLine, yDistanceLine, zDistanceLine)

        data.outlinePass.selectedObjects = [element]

      }

    } else {

      event.stopPropagation()

      if (element.hasClass("panel")) {

        element.css({top: eventY, left: eventX})

        element.css("cursor", "grabbing")
        element.find("*").css("cursor", "grabbing")

      } else if (element.hasClass("shape")) {

        $(".ghost-shape").css({top: eventY, left: eventX})
        $("body").css("cursor", "grabbing")

      }

    }

  }

  function stop(event) {

    if (element.type == "Mesh") {

      if (element.lock != "locked") {

        localMeshes("update", element)

        $("#canvas").css("cursor", "grab")

        for (let i = 0; i < tooltips.distanceLines.length; i++) { scene.remove(tooltips.distanceLines[i]) }

        tooltips.distanceLines = []

      }

    } else {

      event.stopPropagation()

      $("body").css("cursor", "")

      if (element.hasClass("panel")) {

        element.css("cursor", "")
        element.find("*").css("cursor", "")

      } else if (element.hasClass("shape")) {

        let ghost = $(".ghost-shape")

        if (dragged) {

          let coordinates = screen2worldCoordinates(ghost.offset().left + (ghost.width() / 2), ghost.offset().top + (ghost.height() / 2), 0)

          let x = coordinates.x < min ? min : coordinates.x > max ? max : coordinates.x
          let y = coordinates.y < min ? min : coordinates.y > max ? max : coordinates.y
          let z = coordinates.z < min ? min : coordinates.z > max ? max : coordinates.z

          let mesh = addMesh(null, {name: element.attr("title"), class: element.attr("id"), position: {x: x, y: y, z: z}})

          data.outlinePass.selectedObjects = [mesh]

          $("#canvas").css("cursor", "grab")

        }

        ghost.remove()

      }

    }

    document.onmousemove = null
    document.onmouseup = null

    dragged = null

  }

  element.type != "Mesh" ? element.mousedown(start) : !events.operation.key ? start() : null

}