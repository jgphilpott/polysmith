import {addMesh} from "./mesh.mjs"
import {contextMenu} from "./context.mjs"
import {addPanelEvents, dragable} from "../libs/etc/events.mjs"

import {grayGlass, lightGrayGlass} from "../libs/colors/glass/grayscale.mjs"

export function addShortcutPanel() {

  $("body").append("<div id='shortcut' class='panel'><img class='close' src='/app/imgs/panels/nav/close.png'></div>")

  let panel = $("#shortcut.panel")

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

  panel.append("<img id='+' class='nav' src='/app/imgs/panels/nav/+.png'>")

  let shortcuts = $("#shortcut.panel img.shape")

  for (let i = 0; i < shortcuts.length; i++) { dragable($(shapes[i])) }

  shortcuts.dblclick(function(event) { addMesh(null, {type: $(this).attr("id")}) })
  shortcuts.contextmenu(function(event) { contextMenu("shortcut", $(this), event) })

  $("#shortcut.panel .nav").click(function(event) {

    let shapesPanel = $("#shapes.panel")

    if (shapesPanel.css("visibility") == "hidden") {

      shapesPanel.css("visibility", "visible")

    } else if (shapesPanel.css("visibility") == "visible") {

      setTimeout(function() { shapesPanel.css("background", grayGlass) }, 0)
      setTimeout(function() { shapesPanel.css("background", lightGrayGlass) }, 100)
      setTimeout(function() { shapesPanel.css("background", grayGlass) }, 200)
      setTimeout(function() { shapesPanel.css("background", lightGrayGlass) }, 300)

    }

  })

  addPanelEvents(panel)

}