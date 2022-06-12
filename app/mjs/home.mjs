import {setup} from "./libs/etc/setup.mjs"

import {newBox, addBox} from "./libs/geometries/boxes.mjs"
import {newCircle, addCircle} from "./libs/geometries/circles.mjs"
import {newCone, addCone} from "./libs/geometries/cones.mjs"
import {newCylinder, addCylinder} from "./libs/geometries/cylinders.mjs"
import {newKnot, addKnot} from "./libs/geometries/knots.mjs"
import {newLine, addLine} from "./libs/geometries/lines.mjs"
import {newLine2, addLine2} from "./libs/geometries/lines2.mjs"
import {newPlane, addPlane} from "./libs/geometries/planes.mjs"
import {newQuadrilateral, addQuadrilateral} from "./libs/geometries/quadrilaterals.mjs"
import {newRing, addRing} from "./libs/geometries/rings.mjs"
import {newSphere, addSphere} from "./libs/geometries/spheres.mjs"
import {newText, addText} from "./libs/geometries/text.mjs"
import {newTorus, addTorus} from "./libs/geometries/toruses.mjs"
import {newTriangle, addTriangle} from "./libs/geometries/triangles.mjs"
import {newTube, addTube} from "./libs/geometries/tubes.mjs"

import {exportFile} from "./libs/files/export.mjs"
import {importFile} from "./libs/files/import.mjs"

import {addMesh} from "./panels/mesh.mjs"

$(document).ready(function() {

  setup()

  box = addBox
  circle = addCircle
  cone = addCone
  cylinder = addCylinder
  knot = addKnot
  line = addLine
  line2 = addLine2
  plane = addPlane
  quadrilateral = addQuadrilateral
  ring = addRing
  sphere = addSphere
  text = addText
  torus = addTorus
  triangle = addTriangle
  tube = addTube

  //|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|//
  //  Paste Generator Function Below  |//
  //|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|//
  //  ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓  |//

  function generator() {}

  generator()

})