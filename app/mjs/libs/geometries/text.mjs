// Link: https://threejs.org/docs/#api/en/geometries/TextGeometry

import {standardMaterial} from "../materials.mjs"

export function newText(text, size=12, height=2, bevel=false, font="arial") {

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

  let textMesh = new THREE.Mesh(textGeometry, standardMaterial())

  return textMesh

}

export function addText(text, size=12, height=2, bevel=false, font="arial") {

  let loader = new THREE.FontLoader()

  loader.load("./app/fonts/" + font + ".json", function (font) {

    let textMesh = newText(text, size, height, bevel, font)

    data.meshes.push(textMesh)
    data.scene.add(textMesh)

  })

}
