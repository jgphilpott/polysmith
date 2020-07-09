import {addAxes, removeAxes} from "./axes.mjs"

import {exportSTL} from "./stl.mjs"
import {exportOBJ} from "./obj.mjs"

export function addEvents() {

  $("body").keypress(function(event) {

    // Ctrl + Enter
    if (event.ctrlKey && event.keyCode == 10) {

      removeAxes()
      exportSTL()
      addAxes()

    // Shift + Enter
    } else if (event.shiftKey && event.keyCode == 13) {

      removeAxes()
      exportOBJ()
      addAxes()

    }

  })

}
