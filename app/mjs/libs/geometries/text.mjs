// Link: https://threejs.org/docs/#api/en/geometries/TextGeometry

import {standardMaterial} from "../materials.mjs"

export function newText(text, size=12, font="ubuntu") {

  let textGeometry = new THREE.TextGeometry(text, {

    "font": font,

    "size": size,
    "height": size / 10,
    "curveSegments": 12,

    "bevelEnabled": true,
    "bevelThickness": 1,
    "bevelSize": 1,
    "bevelOffset": 0,
		"bevelSegments": 3

  })

  return textGeometry

}

export function addText(text, size=12, font="ubuntu") {

  let loader = new THREE.FontLoader()

  loader.load("./app/fonts/" + font + ".json", function (font) {

    let textGeometry = newText(text, size, font)

    let mesh = new THREE.Mesh(textGeometry, standardMaterial)

    data.meshes.push(mesh)
    data.scene.add(mesh)

  })

}
