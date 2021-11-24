// Link: https://threejs.org/docs/#api/en/geometries/TextGeometry

import * as tools from "../tools.mjs"
import {meshMaterial} from "../materials/mesh.mjs"

export function newText(text, size=12, height=2, bevel=false, font="ubuntu", center=true, x=0, y=0, z=0, rotateX=0, rotateY=0, rotateZ=0) {

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

  let textMesh = new THREE.Mesh(textGeometry, meshMaterial("basic"))

  return textMesh

}

export function addText(text, size=12, height=2, bevel=false, font="ubuntu", center=true, x=0, y=0, z=0, rotateX=0, rotateY=0, rotateZ=0) {

  let loader = new THREE.FontLoader()

  loader.load("./app/fonts/" + font + ".json", function (font) {

    let textMesh = newText(text, size, height, bevel, font, center, x, y, z, rotateX, rotateY, rotateZ)

    textMesh.rotateX(tools.degree2radian(rotateX))
    textMesh.rotateY(tools.degree2radian(rotateY))
    textMesh.rotateZ(tools.degree2radian(rotateZ))

    textMesh.position.set(x, y, z)

    data.meshes.push(textMesh)
    data.scene.add(textMesh)

  })

}
