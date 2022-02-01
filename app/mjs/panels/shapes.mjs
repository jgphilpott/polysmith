import {contextMenu} from "../libs/etc/context.mjs"

import {addBox} from "../libs/geometries/boxes.mjs"
import {addCylinder} from "../libs/geometries/cylinders.mjs"
import {addSphere} from "../libs/geometries/spheres.mjs"

export function addShapesPanel() {

  $("body").append("<div id='shapes' class='panel'></div>")

  let panel = $("#shapes.panel")

  panel.append("<img id='cube' class='shape' src='/app/imgs/icons/shapes/basic/cube.png'>")
  panel.append("<img id='cylinder' class='shape' src='/app/imgs/icons/shapes/basic/cylinder.png'>")
  panel.append("<img id='sphere' class='shape' src='/app/imgs/icons/shapes/basic/sphere.png'>")

  panel.append("<img id='+' class='nav' src='/app/imgs/icons/nav/+.png'>")

  $("#shapes.panel img.shape").dblclick(function() {

    let mesh = null
    let id = $(this).attr("id")

    switch (id) {

      case "cube":
        mesh = addBox()
        break

      case "cylinder":
        mesh = addCylinder()
        break

      case "sphere":
        mesh = addSphere()
        break

    }

    data.events.addEventListener(mesh, "contextmenu", function(event) {
      contextMenu(mesh, event.origDomEvent)
    }, false)

  })

}
