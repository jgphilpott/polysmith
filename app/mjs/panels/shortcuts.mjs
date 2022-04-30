import {addMesh} from "./mesh.mjs"
import {contextMenu} from "./context.mjs"
import {makeDragable} from "../libs/etc/events.mjs"

export function addShortcutsPanel() {

  $("body").append("<div id='shortcuts' class='panel'><img class='close' src='/app/imgs/panels/nav/close.png'></div>")

  let panel = $("#shortcuts.panel")

  let shapesPanel = $("#shapes.panel")
  let shapesVisible = shapesPanel.css("visibility") == "visible" ? true : false

  panel.append("<img title='Cube' id='cube' class='shape' src='/app/imgs/icons/shapes/basic/cube.png'>")
  panel.append("<img title='Cylinder' id='cylinder' class='shape' src='/app/imgs/icons/shapes/basic/cylinder.png'>")
  panel.append("<img title='Sphere' id='sphere' class='shape' src='/app/imgs/icons/shapes/basic/sphere.png'>")

  panel.append("<img title='Triangular Prism' id='triangular-prism' class='shape' src='/app/imgs/icons/shapes/prisms/prism-3.png'>")
  panel.append("<img title='Rectangular Prism' id='rectangular-prism' class='shape' src='/app/imgs/icons/shapes/prisms/prism-4.png'>")
  panel.append("<img title='Pentagonal Prism' id='pentagonal-prism' class='shape' src='/app/imgs/icons/shapes/prisms/prism-5.png'>")
  panel.append("<img title='Hexagonal Prism' id='hexagonal-prism' class='shape' src='/app/imgs/icons/shapes/prisms/prism-6.png'>")
  panel.append("<img title='Heptagonal Prism' id='heptagonal-prism' class='shape' src='/app/imgs/icons/shapes/prisms/prism-7.png'>")
  panel.append("<img title='Octagonal Prism' id='octagonal-prism' class='shape' src='/app/imgs/icons/shapes/prisms/prism-8.png'>")

  panel.append("<img title='Triangular Pyramid' id='triangular-pyramid' class='shape' src='/app/imgs/icons/shapes/pyramids/pyramid-3.png'>")
  panel.append("<img title='Rectangular Pyramid' id='rectangular-pyramid' class='shape' src='/app/imgs/icons/shapes/pyramids/pyramid-4.png'>")
  panel.append("<img title='Pentagonal Pyramid' id='pentagonal-pyramid' class='shape' src='/app/imgs/icons/shapes/pyramids/pyramid-5.png'>")
  panel.append("<img title='Cone' id='cone' class='shape' src='/app/imgs/icons/shapes/pyramids/pyramid-x.png'>")

  panel.append("<img title='Torus' id='torus' class='shape' src='/app/imgs/icons/shapes/special/torus.png'>")

  panel.append("<img id='toggle' class='nav' src='/app/imgs/panels/nav/" + (shapesVisible ? "x" : "+") + ".png'>")

  panel.find("img.shape").toArray().forEach(shape => {

    makeDragable($(shape))

    $(shape).dblclick(function(event) { addMesh(null, {type: shape.id}) })
    $(shape).contextmenu(function(event) { contextMenu("shortcut", $(shape), event) })

    if (settings.ui.shortcuts.includes(shape.id)) { $(shape).css("display", "block") }

  })

  panel.find("#toggle").click(function(event) {

    shapesVisible = shapesPanel.css("visibility") == "visible" ? true : false

    updateSettings("panels", "shapes", !shapesVisible)

  })

  return panel

}