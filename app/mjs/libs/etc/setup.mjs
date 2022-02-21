import {addSettings} from "./settings.mjs"
import {black, white} from "../colors/three/grayscale.mjs"

import {addAmbientLight} from "../lights/ambient.mjs"
import {addDirectionalLight} from "../lights/directional.mjs"
import {addHemisphereLight} from "../lights/hemisphere.mjs"
import {addPointLight} from "../lights/point.mjs"
import {addSpotLight} from "../lights/spot.mjs"

import {addPerspectiveCamera} from "../cameras/perspective.mjs"

import {addDragControls} from "../controls/drag.mjs"
import {addFlyControls} from "../controls/fly.mjs"
import {addZoomControls} from "../controls/zoom.mjs"

import {addPanels} from "../../panels/all.mjs"
import {addEvents} from "../etc/events.mjs"
import {addAxes} from "../draw/axes.mjs"

export function setup() {

  data.name = "Polymaker"

  data.scale = 100
  data.meshes = []
  data.tooltips = {}

  addSettings()

  let renderer = new THREE.WebGLRenderer({alpha: true, antialias: true, logarithmicDepthBuffer: true})
  renderer.setSize(window.innerWidth, window.innerHeight)
  renderer.setPixelRatio(window.devicePixelRatio)
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

  addPanels()
  addEvents()
  addAxes()

  function animate() {

    requestAnimationFrame(animate)

    data.renderer.render(data.scene, data.camera)

  }

  animate()

}
