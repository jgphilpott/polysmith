import {addMesh} from "./mesh.mjs"
import {addPanelEvents, dragable} from "../libs/etc/events.mjs"

export function addShapesPanel() {

  $("body").append("<div id='shapes' class='panel'></div>")

  let panel = $("#shapes.panel")

  panel.append("<img class='close' src='/app/imgs/panels/close.png'>")

  panel.append("<img id='box' class='shape' src='/app/imgs/icons/shapes/basic/box.png'>")
  panel.append("<img id='cylinder' class='shape' src='/app/imgs/icons/shapes/basic/cylinder.png'>")
  panel.append("<img id='sphere' class='shape' src='/app/imgs/icons/shapes/basic/sphere.png'>")

  panel.append("<img id='+' class='nav' src='/app/imgs/icons/nav/+.png'>")

  let shapes = $("#shapes.panel img.shape")

  for (let i = 0; i < shapes.length; i++) { dragable($(shapes[i])) }

  shapes.dblclick(function() { addMesh(null, {type: $(this).attr("id")}) })

  addPanelEvents(panel)

}
