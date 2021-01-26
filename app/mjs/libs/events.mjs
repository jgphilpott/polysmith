import {exportSTL} from "./files/stl.mjs"
import {exportOBJ} from "./files/obj.mjs"

export function addEvents() {

  data.events = new THREEx.DomEvents(data.camera, data.canvas)

  $("body").keypress(function(event) {

    // Ctrl + Enter
    if (event.ctrlKey && event.keyCode == 10) {

      exportSTL()

    // Shift + Enter
    } else if (event.shiftKey && event.keyCode == 13) {

      exportOBJ()

    }

  })

}
