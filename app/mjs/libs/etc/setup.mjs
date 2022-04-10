import {getSettings} from "./settings.mjs"
import {localMeshes} from "../files/local.mjs"
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

  data.scale = scale
  data.meshes = meshes
  data.tooltips = tooltips

  data.settings = getSettings()

  renderer = new THREE.WebGLRenderer({alpha: true, antialias: true, logarithmicDepthBuffer: true})
  renderer.setSize(window.innerWidth, window.innerHeight)
  renderer.setPixelRatio(window.devicePixelRatio)
  data.renderer = renderer

  canvas = document.body.appendChild(renderer.domElement)
  canvas.setAttribute("id", "canvas")
  data.canvas = canvas

  scene = new THREE.Scene()
  scene.background = white
  data.scene = scene

  lights = []
  lights.push(addAmbientLight())
  lights.push(addPointLight())
  data.lights = lights

  camera = addPerspectiveCamera()
  data.camera = camera

  addDragControls()
  addFlyControls()
  addZoomControls()

  addPanels()
  addEvents()
  addAxes()

  animate()

  localMeshes("load")

  function animate() {

    requestAnimationFrame(animate)

    renderer.render(scene, camera)

  }

}