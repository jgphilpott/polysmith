import {black, white} from "./colors.mjs"

import {addLights} from "./lights.mjs"
import {addCamera} from "./cameras.mjs"
import {addControls} from "./controls.mjs"
import {addEvents} from "./events.mjs"
import {addAxes} from "./axes.mjs"

export function setup(width, height, scale=150) {

  data.name = "Poly"

  data.width = width
  data.height = height

  let renderer = new THREE.WebGLRenderer()
  renderer.setSize(width, height)
  data.renderer = renderer

  let canvas = document.body.appendChild(renderer.domElement)
  data.canvas = canvas

  let scene = new THREE.Scene()
  scene.background = white
  data.scene = scene

  data.meshes = []

  data.scale = scale

  addLights()
  addCamera()
  addControls()
  addEvents()
  addAxes()

  function animate() {

    requestAnimationFrame(animate)

    data.controls.update()

    data.renderer.render(data.scene, data.camera)

  }

  animate()

}
