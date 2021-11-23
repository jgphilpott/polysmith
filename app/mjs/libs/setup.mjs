import {black, white} from "./colors/grayscale.mjs"

import {addLights} from "./lights.mjs"
import {addCamera} from "./cameras.mjs"
import {addControls} from "./controls.mjs"
import {addEvents} from "./events.mjs"
import {addAxes} from "./axes.mjs"

export function setup(scale=100) {

  data.name = "poly"

  let width = $(window).width()
  let height = $(window).height()

  data.width = width
  data.height = height

  let renderer = new THREE.WebGLRenderer()
  renderer.setSize(width, height)
  data.renderer = renderer

  let canvas = document.body.appendChild(renderer.domElement)
  canvas.setAttribute("id", "canvas")
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

    data.renderer.render(data.scene, data.camera)

  }

  animate()

}
