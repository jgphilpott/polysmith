import {addMesh} from "../../panels/mesh.mjs"
import {newLine} from "../geometries/lines.mjs"

import {exportFile} from "../files/export.mjs"

import {grayGlass, lightGrayGlass} from "../colors/glass/grayscale.mjs"

export function addEvents() {

  events = new THREEx.DomEvents(camera, canvas)

  data.events = events

  events.zIndex = 0
  events.operation = {mesh: null, key: null}

  $(window).on("resize", function() {

    renderer.setSize(window.innerWidth, window.innerHeight)

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

    $("input").blur()

    if (events.operation.key && !camera.dragged) {

      $("body").css("cursor", "")
      $("#canvas").css("cursor", "")

      events.operation.mesh = null
      events.operation.key = null

    }

  })

}

export function addPanelEvents(panel) {

  let queue = false
  let duration = 1000

  let id = panel.attr("id")
  let close = $("#" + id + ".panel .close")

  panel.hover(function(event) {

    events.zIndex += 1

    panel.css("z-index", events.zIndex)

  })

  panel.mouseover(function(event) {
    close.animate({opacity: 1}, {duration: duration, queue: queue})
    panel.animate({backgroundColor: grayGlass}, {duration: duration, queue: queue})
  })

  panel.mouseout(function(event) {
    close.animate({opacity: 0}, {duration: duration, queue: queue})
    panel.animate({backgroundColor: lightGrayGlass}, {duration: duration, queue: queue})
  })

  close.click(function(event) {
    id == "mesh" ? panel.remove() : panel.css("visibility", "hidden")
  })

  dragable(panel)

}

export function dragable(element, origEvent=null) {

  let dragged = null
  let xOffset, yOffset = 0
  let max = scale * 3
  let min = - (scale * 3)

  function start(event) {

    if (element.type != "Mesh") {

      event.stopPropagation()

      if (element.hasClass("panel")) {

        let transform = element.css("transform").replace(/[{()}]/g, "").replace(/[a-zA-Z]/g, "").split(",")

        xOffset = event.clientX - element.position().left + Number(transform[4])
        yOffset = event.clientY - element.position().top + Number(transform[5])

      } else if (element.hasClass("shape")) {

        $("body").append("<img class='ghost-shape' src='" + element.attr("src") + "'>")

        xOffset = event.clientX - element.offset().left
        yOffset = event.clientY - element.offset().top

      }

    } else {

      let coordinates = world2screenCoordinates(element.position.x, element.position.y, element.position.z)

      xOffset = origEvent.clientX - coordinates.x
      yOffset = origEvent.clientY - coordinates.y

      tooltips.distanceLines = []

    }

    document.onmousemove = drag
    document.onmouseup = stop

  }

  function drag(event) {

    dragged = true

    let eventX = event.clientX - xOffset
    let eventY = event.clientY - yOffset

    if (element.type != "Mesh") {

      event.stopPropagation()

      if (element.hasClass("panel")) {

        element.css({top: eventY, left: eventX})

        element.css("cursor", "url('app/imgs/icons/cursors/grabbing.png'), grabbing")
        element.children("*").css("cursor", "url('app/imgs/icons/cursors/grabbing.png'), grabbing")

      } else if (element.hasClass("shape")) {

        $(".ghost-shape").css({top: eventY, left: eventX})
        $("body").css("cursor", "url('app/imgs/icons/cursors/grabbing.png'), grabbing")

      }

    } else {

      $("body").css("cursor", "url('app/imgs/icons/cursors/grabbing.png'), grabbing")

      let coordinates = screen2worldCoordinates(eventX, eventY, element.position.z)

      if (coordinates.x > max) { coordinates.x = max}
      if (coordinates.x < min) { coordinates.x = min}

      if (coordinates.y > max) { coordinates.y = max}
      if (coordinates.y < min) { coordinates.y = min}

      $("#mesh." + element.uuid + " #position-x input").val(coordinates.x.toFixed(2))
      $("#mesh." + element.uuid + " #position-y input").val(coordinates.y.toFixed(2))

      element.position.x = coordinates.x
      element.position.y = coordinates.y

      for (let i = 0; i < tooltips.distanceLines.length; i++) { scene.remove(tooltips.distanceLines[i]) }

      let xDistanceLine = newLine([[0, coordinates.y, coordinates.z], [coordinates.x, coordinates.y, coordinates.z]], "dashed")
      let yDistanceLine = newLine([[coordinates.x, 0, coordinates.z], [coordinates.x, coordinates.y, coordinates.z]], "dashed")
      let zDistanceLine = newLine([[coordinates.x, coordinates.y, 0], [coordinates.x, coordinates.y, coordinates.z]], "dashed")

      scene.add(xDistanceLine, yDistanceLine, zDistanceLine)
      tooltips.distanceLines.push(xDistanceLine, yDistanceLine, zDistanceLine)

    }

  }

  function stop(event) {

    if (element.type != "Mesh") {

      event.stopPropagation()

      if (element.hasClass("panel")) {

        element.css("cursor", "")
        element.children("*").css("cursor", "")

      } else if (element.hasClass("shape")) {

        let ghost = $(".ghost-shape")

        if (dragged) {

          let coordinates = screen2worldCoordinates(ghost.offset().left + (ghost.width() / 2), ghost.offset().top + (ghost.height() / 2), 0)

          addMesh(null, {type: element.attr("id"), position: {x: coordinates.x, y: coordinates.y, z: coordinates.z}})

          $("body").css("cursor", "url('app/imgs/icons/cursors/grab.png'), grab")

        }

        ghost.remove()

      }

    } else {

      $("body").css("cursor", "url('app/imgs/icons/cursors/grab.png'), grab")

      for (let i = 0; i < tooltips.distanceLines.length; i++) { scene.remove(tooltips.distanceLines[i]) }

      tooltips.distanceLines = []

    }

    document.onmousemove = null
    document.onmouseup = null

    dragged = null

  }

  element.type != "Mesh" ? element.mousedown(start) : !events.operation.key ? start() : null

}