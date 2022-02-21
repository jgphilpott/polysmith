import {addPanelEvents} from "../libs/etc/events.mjs"

export function addGeometriesPanel() {

  $("body").append("<div id='geometries' class='panel'><h3>Geometries</h3></div>")

  let panel = $("#geometries.panel")

  panel.append("<img class='close' src='/app/imgs/panels/close.png'>")

  panel.append("<h4 id='basic'>Basic</h4>")
  panel.append("<img title='Cube' id='cube' class='shape' src='/app/imgs/icons/shapes/basic/cube.png'>")
  panel.append("<img title='Cylinder' id='cylinder' class='shape' src='/app/imgs/icons/shapes/basic/cylinder.png'>")
  panel.append("<img title='Sphere' id='sphere' class='shape' src='/app/imgs/icons/shapes/basic/sphere.png'>")

  panel.append("<h4 id='prisms'>Prisms</h4>")
  panel.append("<img title='Triangular Prism' id='triangular-prism' class='shape' src='/app/imgs/icons/shapes/prisms/prism-3.png'>")
  panel.append("<img title='Rectangular Prism' id='rectangular-prism' class='shape' src='/app/imgs/icons/shapes/prisms/prism-4.png'>")
  panel.append("<img title='Pentagonal Prism' id='pentagonal-prism' class='shape' src='/app/imgs/icons/shapes/prisms/prism-5.png'>")
  panel.append("<img title='Hexagonal Prism' id='hexagonal-prism' class='shape' src='/app/imgs/icons/shapes/prisms/prism-6.png'>")
  panel.append("<img title='Heptagonal Prism' id='heptagonal-prism' class='shape' src='/app/imgs/icons/shapes/prisms/prism-7.png'>")
  panel.append("<img title='Octagonal Prism' id='octagonal-prism' class='shape' src='/app/imgs/icons/shapes/prisms/prism-8.png'>")
  // panel.append("<img title='Cylinder Prism' id='cylinder-prism' class='shape' src='/app/imgs/icons/shapes/prisms/prism-x.png'>")

  panel.append("<h4 id='pyramids'>Pyramids</h4>")
  panel.append("<img title='Triangular Pyramid' id='triangular-pyramid' class='shape' src='/app/imgs/icons/shapes/pyramids/pyramid-3.png'>")
  panel.append("<img title='Rectangular Pyramid' id='rectangular-pyramid' class='shape' src='/app/imgs/icons/shapes/pyramids/pyramid-4.png'>")
  panel.append("<img title='Pentagonal Pyramid' id='pentagonal-pyramid' class='shape' src='/app/imgs/icons/shapes/pyramids/pyramid-5.png'>")
  panel.append("<img title='Cone' id='cone' class='shape' src='/app/imgs/icons/shapes/pyramids/pyramid-x.png'>")

  panel.append("<h4 id='special'>Special</h4>")
  // panel.append("<img title='Dome' id='dome' class='shape' src='/app/imgs/icons/shapes/special/dome.png'>")
  // panel.append("<img title='Star' id='star' class='shape' src='/app/imgs/icons/shapes/special/star.png'>")
  panel.append("<img title='Torus' id='torus' class='shape' src='/app/imgs/icons/shapes/special/torus.png'>")

  addPanelEvents(panel)

}
