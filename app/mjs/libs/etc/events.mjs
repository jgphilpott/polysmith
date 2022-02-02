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

}

export function dragable(element) {

  let xOffset, yOffset = 0

  function start(event) {

    event.preventDefault()
    event.stopPropagation()

    if (element.css("transform") != "none") {

      let translation = element.css("transform").replace(/[{()}]/g, "").replace(/[a-zA-Z]/g, "").split(",")

      xOffset = event.clientX - element.position().left + Number(translation[4])
      yOffset = event.clientY - element.position().top + Number(translation[5])

    } else {

      xOffset = event.clientX - element.position().left
      yOffset = event.clientY - element.position().top

    }

    document.onmousemove = drag
    document.onmouseup = stop

  }

  function drag(event) {

    event.preventDefault()
    event.stopPropagation()

    let eventX = event.clientX - xOffset
    let eventY = event.clientY - yOffset

    element.css({top: eventY, left: eventX})

    element.css("cursor", "url('app/imgs/icons/cursors/grabbing.png'), grabbing")
    element.children("*").css("cursor", "url('app/imgs/icons/cursors/grabbing.png'), grabbing")

  }

  function stop(event) {

    event.preventDefault()
    event.stopPropagation()

    element.css("cursor", "")
    element.children("*").css("cursor", "")

    document.onmouseup = null
    document.onmousemove = null

  }

  element.mousedown(start)

}
