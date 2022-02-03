import {contextMenu} from "./context.mjs"
import {dragable} from "../libs/etc/events.mjs"

import {addBox} from "../libs/geometries/boxes.mjs"
import {addCylinder} from "../libs/geometries/cylinders.mjs"
import {addSphere} from "../libs/geometries/spheres.mjs"

export function addMeshPanel(mesh) {

  $("body").append("<div id='mesh' class='panel'></div>")

  let panel = $("#mesh.panel")

  dragable(panel)

}

export function addMesh(type, position=[0, 0, 0]) {

  let mesh = null

  switch (type) {

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

  data.events.addEventListener(mesh, "contextmenu", function(event) { contextMenu("mesh", mesh, event.origDomEvent) })

  mesh.position.x = position[0]
  mesh.position.y = position[1]
  mesh.position.z = position[2]

  return mesh

}

export function removeMesh() {}
