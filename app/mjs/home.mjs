import {setup} from "./libs/setup.mjs"

import * as tools from "./libs/tools.mjs"

import * as calc from "./libs/math/calculus.mjs"
import * as regr from "./libs/math/regression.mjs"
import * as root from "./libs/math/roots.mjs"
import * as trig from "./libs/math/trigonometry.mjs"

import {joinMesh, cutMesh, intersectMesh} from "../libs/meshOperations.mjs"

import {black, white, red, orange, yellow, green, blue, purple, pink} from "./libs/colors.mjs"

import {standardMaterial} from "./libs/materials.mjs"

import {newBox, addBox} from "./libs/geometries/boxes.mjs"
import {newCylinder, addCylinder} from "./libs/geometries/cylinders.mjs"
import {newLine, addLine} from "./libs/geometries/lines.mjs"
import {newQuadrilateral, addQuadrilateral} from "./libs/geometries/quadrilaterals.mjs"
import {newSphere, addSphere} from "./libs/geometries/spheres.mjs"
import {newText, addText} from "./libs/geometries/text.mjs"
import {newTriangle, addTriangle} from "./libs/geometries/triangles.mjs"

import {importOBJ, exportOBJ} from "./libs/files/obj.mjs"
import {importSTL, exportSTL} from "./libs/files/stl.mjs"
import {importSVG} from "./libs/files/svg.mjs"

import {sleep} from "./libs/time.mjs"

$(document).ready(function() {

  let width = $(window).width()
  let height = $(window).height()

  setup(width, height)

  //|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|//
  //  Paste Generator Function Below  |//
  //|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|//
  //  ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓  |//

  function generator() {

  }

  generator()

  console.log(data)

})
