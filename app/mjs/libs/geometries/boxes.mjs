// Link: https://threejs.org/docs/#api/en/geometries/BoxGeometry

import {black, white, grayscale} from "../colors/grayscale.mjs"
import {red, orange, yellow, green, blue, purple, pink, rainbow} from "../colors/rainbow.mjs"

import {standardMaterial} from "../materials.mjs"

export function newBox(width=10, height=10, depth=10, position=[0, 0, 0], color=black) {

  let geometry = new THREE.BoxGeometry(width, height, depth)
  let box = new THREE.Mesh(geometry, standardMaterial(color))

  box.position.set(position[0], position[1], position[2])

  return box

}

export function addBox(width=10, height=10, depth=10, position=[0, 0, 0], color=black) {

  let box = newBox(width, height, depth, position, color)

  data.scene.add(box)

  return box

}
