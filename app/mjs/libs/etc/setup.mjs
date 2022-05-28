import {localMeshes} from "../files/local.mjs"
import {black, white} from "../colors/three/grayscale.js"

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

  settings = getSettings()

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

  data.camera = addPerspectiveCamera()

  addPostProcessing()

  addDragControls()
  addFlyControls()
  addZoomControls()

  data.panels = addPanels()
  data.events = addEvents()
  data.axes = addAxes()

  animate()

  localMeshes("load")

  function animate() {

    requestAnimationFrame(animate)

    data.composer.render()

  }

  function addPostProcessing() {

    data.composer = new THREE.EffectComposer(renderer)
    data.renderPass = new THREE.RenderPass(scene, camera)
    data.shaderPass = new THREE.ShaderPass(THREE.CopyShader)
    data.outlinePass = new THREE.OutlinePass(new THREE.Vector2(window.innerWidth, window.innerHeight ), scene, camera)

    data.outlinePass.overlayMaterial.blending = THREE.CustomBlending
    data.outlinePass.visibleEdgeColor.set("#000000")
    data.outlinePass.hiddenEdgeColor.set("#FFFFFF")

    data.composer.addPass(data.renderPass)
    data.composer.addPass(data.shaderPass)
    data.composer.addPass(data.outlinePass)

  }

}