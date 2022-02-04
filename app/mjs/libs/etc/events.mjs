import {addMesh} from "../../panels/mesh.mjs"

import {exportSTL} from "../files/stl.mjs"
import {exportOBJ} from "../files/obj.mjs"

export function addEvents() {

  data.events = new THREEx.DomEvents(data.camera, data.canvas)

  $("body").keypress(function(event) {

    // Ctrl + Enter
    if (event.ctrlKey && event.keyCode == 10) {

      event.preventDefault()
      event.stopPropagation()

      exportSTL()

    // Shift + Enter
    } else if (event.shiftKey && event.keyCode == 13) {

      event.preventDefault()
      event.stopPropagation()

      exportOBJ()

    }

  })

  $("#canvas").click(function() {
    $("input").blur()
  })

}

export function dragable(element) {

  let dragged = null
  let xOffset, yOffset = 0

  function start(event) {

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

    document.onmousemove = drag
    document.onmouseup = stop

  }

  function drag(event) {

    dragged = true

    event.stopPropagation()

    let eventX = event.clientX - xOffset
    let eventY = event.clientY - yOffset

    if (element.hasClass("panel")) {

      element.css({top: eventY, left: eventX})

      element.css("cursor", "url('app/imgs/icons/cursors/grabbing.png'), grabbing")
      element.children("*").css("cursor", "url('app/imgs/icons/cursors/grabbing.png'), grabbing")

    } else if (element.hasClass("shape")) {

      $(".ghost-shape").css({top: eventY, left: eventX})
      $("body").css("cursor", "url('app/imgs/icons/cursors/grabbing.png'), grabbing")

    }

  }

  function stop(event) {

    event.stopPropagation()

    if (element.hasClass("panel")) {

      element.css("cursor", "")
      element.children("*").css("cursor", "")

    } else if (element.hasClass("shape")) {

      let ghost = $(".ghost-shape")

      if (dragged) {

        let coordinates = screen2worldCoordinates(ghost.offset().left + (ghost.width() / 2), ghost.offset().top + (ghost.height() / 2), 0)

        addMesh(element.attr("id"), [coordinates.x, coordinates.y, coordinates.z])

        $("body").css("cursor", "url('app/imgs/icons/cursors/grab.png'), grab")

      }

      ghost.remove()

    }

    dragged = null

    document.onmousemove = null
    document.onmouseup = null

  }

  element.mousedown(start)

}
