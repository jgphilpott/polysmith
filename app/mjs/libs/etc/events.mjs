import {focus} from "../controls/focus.mjs"
import {newLine} from "../geometries/lines.mjs"
import {exportFile} from "../files/export.mjs"
import {localMeshes} from "../files/local.mjs"
import {contextMenu} from "../../panels/context.mjs"
import {addMesh, updateMesh} from "../../panels/mesh.mjs"

export function addEvents() {

  let events = new THREEx.DomEvents(camera, canvas)

  events.operation = {mesh: null, key: null}
  events.zIndex = 0

  $(window).on("resize", function() {

    let innerWidth = window.innerWidth
    let innerHeight = window.innerHeight

    for (let i = 0; i < axes.length; i++) {

      if (axes[i].type == "Line2") axes[i].material.resolution.set(innerWidth, innerHeight)

    }

    renderer.setSize(innerWidth, innerHeight)
    composer.setSize(innerWidth, innerHeight)

    camera.aspect = innerWidth / innerHeight
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

  $("#navbar #title span").on("keypress keydown keyup", function(event) { event.stopPropagation() }).blur(function(event) {

    let text = $(this)[0].innerText.replace(/[^a-zA-Z0-9-_ ]/g, "").trim()
    let title = text ? text : data.title.toUpperCase()

    updateSettings("ui", "title", title)

    $(this).text(title)

  })

  $("#canvas").mousedown(function(event) {

    window.getSelection().removeAllRanges()

    $("input, [contenteditable]").toArray().forEach(input => { if ($(input).is(":focus")) $(input).blur() })

  }).click(function(event) {

    if (events.operation.key && !camera.dragged) clearMeshOperation()

  })

  $("#navbar, #forkme, #metabox, #help").mouseenter(function(event) {

    composer.outlinePass.selectedObjects = []

    $("#metabox").css("display", "none")

  }).mouseleave(function(event) {

    $("#metabox").css("display", "block")

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
    $("#metabox").css("display", "none")

    panel.css("z-index", events.zIndex)

    if (id == "mesh") {

      let mesh = panel.data("mesh")
      let visibleEdgeColor = mesh.lock == "locked" ? redThree : blackThree

      composer.outlinePass.visibleEdgeColor.set(visibleEdgeColor)
      composer.outlinePass.selectedObjects = [mesh]

    } else {

      composer.outlinePass.selectedObjects = []

    }

    close.animate({opacity: 1}, {duration: duration, queue: queue})
    panel.animate({backgroundColor: grayGlass}, {duration: duration * 3, queue: queue})

  }).mouseleave(function(event) {

    $("#metabox").css("display", "block")

    composer.outlinePass.selectedObjects = []

    close.animate({opacity: 0}, {duration: duration, queue: queue})
    panel.animate({backgroundColor: lightGrayGlass}, {duration: duration * 3, queue: queue})

  })

  close.click(function(event) {

    if (id == "mesh") {

      panel.css("visibility", "hidden")

      $("#meshes.table tr#" + panel.data("mesh").uuid + " .settings").attr("src", "/app/imgs/panels/tools/toggle/off.png")

    } else {

      updateSettings("panels", id, false)

    }

  }).on("mousedown mouseup", function(event) { event.stopPropagation() })

  if (id != "mesh") settings.panels[id] ? panel.css("visibility", "visible") : panel.css("visibility", "hidden")

  makeDragable(panel)

  return panel

}

export function addMeshEvents(mesh) {

  events.addEventListener(mesh, "mouseover", function(event) {

    if (settings.ui.metabox) drawMetabox(mesh, event)

  })

  events.addEventListener(mesh, "mousemove", function(event) {

    if (events.operation.key) {

      events.operation.mesh.uuid == mesh.uuid ? composer.outlinePass.visibleEdgeColor.set(redThree) : composer.outlinePass.visibleEdgeColor.set(greenThree)
      events.operation.mesh.uuid == mesh.uuid ? $("#canvas").css("cursor", "not-allowed") : $("#canvas").css("cursor", "copy")


    } else {

      mesh.lock == "locked" ? composer.outlinePass.visibleEdgeColor.set(redThree) : composer.outlinePass.visibleEdgeColor.set(blackThree)
      mesh.lock == "locked" ? $("#canvas").css("cursor", "not-allowed") : $("#canvas").css("cursor", "grab")


    }

    composer.outlinePass.selectedObjects = [mesh]

    drawMetabox(mesh, event)

  })

  events.addEventListener(mesh, "mouseout", function(event) {

    events.operation.key ? $("#canvas").css("cursor", "copy") : $("#canvas").css("cursor", "")

    composer.outlinePass.selectedObjects = []

    eraseMetabox()

  })

  events.addEventListener(mesh, "mousedown", function(event) {

    if (mesh.lock != "locked") makeDragable(mesh, event.origDomEvent)

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
  let max = scale * 3
  let min = - (scale * 3)
  let xOffset, yOffset = 0

  function start(event) {

    if (element.type == "Mesh") {

      if (element.lock != "locked") {

        let coordinates = world2screenCoordinates(element.position.x, element.position.y, element.position.z)

        xOffset = origEvent.clientX - coordinates.x
        yOffset = origEvent.clientY - coordinates.y

        $("#canvas").css("cursor", "grabbing")

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

        let panel = $("#mesh." + element.uuid + "")
        let coordinates = screen2worldCoordinates(eventX, eventY, element.position.z)

        coordinates.x = coordinates.x < min ? min : coordinates.x > max ? max : coordinates.x
        coordinates.y = coordinates.y < min ? min : coordinates.y > max ? max : coordinates.y

        let xDistanceLine = newLine([[0, coordinates.y, coordinates.z], [coordinates.x, coordinates.y, coordinates.z]], "dashed")
        let yDistanceLine = newLine([[coordinates.x, 0, coordinates.z], [coordinates.x, coordinates.y, coordinates.z]], "dashed")
        let zDistanceLine = newLine([[coordinates.x, coordinates.y, 0], [coordinates.x, coordinates.y, coordinates.z]], "dashed")

        for (let i = 0; i < tooltips.distanceLines.length; i++) { scene.remove(tooltips.distanceLines[i]) }

        tooltips.distanceLines.push(xDistanceLine, yDistanceLine, zDistanceLine)
        scene.add(xDistanceLine, yDistanceLine, zDistanceLine)

        panel.find("#position-x input").val(coordinates.x.toFixed(2))
        panel.find("#position-y input").val(coordinates.y.toFixed(2))

        composer.outlinePass.visibleEdgeColor.set(blackThree)
        composer.outlinePass.selectedObjects = [element]

        element.position.x = coordinates.x
        element.position.y = coordinates.y

      }

    } else {

      event.stopPropagation()

      if (element.hasClass("panel")) {

        element.css("cursor", "grabbing")
        element.find("*").css("cursor", "grabbing")

        element.css({top: eventY, left: eventX})

      } else if (element.hasClass("shape")) {

        $(".ghost-shape").css("cursor", "grabbing")

        $(".ghost-shape").css({top: eventY, left: eventX})

      }

    }

  }

  function stop(event) {

    if (element.type == "Mesh") {

      if (element.lock != "locked") {

        for (let i = 0; i < tooltips.distanceLines.length; i++) { scene.remove(tooltips.distanceLines[i]) }

        $("#canvas").css("cursor", "grab")

        localMeshes("update", element)

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

          composer.outlinePass.visibleEdgeColor.set(blackThree)
          composer.outlinePass.selectedObjects = [mesh]

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