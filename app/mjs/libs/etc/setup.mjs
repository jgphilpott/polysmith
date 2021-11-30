import {black, white} from "../colors/grayscale.mjs"

import {addAmbientLight} from "../lights/ambient.mjs"
import {addDirectionalLight} from "../lights/directional.mjs"
import {addHemisphereLight} from "../lights/hemisphere.mjs"
import {addPointLight} from "../lights/point.mjs"
import {addSpotLight} from "../lights/spot.mjs"

import {addPerspectiveCamera} from "../cameras/perspective.mjs"

import {addDragControls} from "../controls/drag.mjs"
import {addFlyControls} from "../controls/fly.mjs"
import {addZoomControls} from "../controls/zoom.mjs"

import {addEvents} from "../etc/events.mjs"
import {addAxes} from "../draw/axes.mjs"

export function setup(scale=100) {

  data.name = "poly"
  data.scale = scale
  data.meshes = []

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

  addAmbientLight()
  addPointLight()

  addPerspectiveCamera()

  addDragControls()
  addFlyControls()
  addZoomControls()

  addEvents()
  addAxes()

  function animate() {

    requestAnimationFrame(animate)

    data.renderer.render(data.scene, data.camera)

  }

  animate()

}
