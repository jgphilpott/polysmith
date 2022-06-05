// Link: https://threejs.org/docs/#examples/en/geometries/TextGeometry

import {addMesh} from "../../panels/mesh.mjs"
import {meshMaterial} from "../materials/mesh.mjs"

export function newText(text="", size=12, height=3, bevel=false, font="ubuntu", material="normal", color=blackThree, center=true, x=0, y=0, z=0, rotateX=0, rotateY=0, rotateZ=0) {

  let textGeometry = new THREE.TextGeometry(text, {

    "font": font,

    "size": size,
    "height": height,
    "curveSegments": 12,

    "bevelEnabled": bevel,
    "bevelThickness": 1,
    "bevelSize": 1,
    "bevelOffset": 0,
  	"bevelSegments": 3

  })

  if (center) {textGeometry.center()}

  let textMesh = new THREE.Mesh(textGeometry, meshMaterial(material, color))

  textMesh.rotateX(degree2radian(rotateX))
  textMesh.rotateY(degree2radian(rotateY))
  textMesh.rotateZ(degree2radian(rotateZ))

  textMesh.position.set(x, y, z)

  textMesh.class = "text"
  textMesh.name = "Text"

  return textMesh

}

export function addText(text="", size=12, height=3, bevel=false, font="ubuntu", material="normal", color=blackThree, center=true, x=0, y=0, z=0, rotateX=0, rotateY=0, rotateZ=0) {

  let loader = new THREE.FontLoader()

  loader.load("./app/fonts/JSON/" + font + ".json", function(font) {

    addMesh(newText(text, size, height, bevel, font, material, color, center, x, y, z, rotateX, rotateY, rotateZ))

  })

}