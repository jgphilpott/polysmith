import {localMeshes} from "../files/local.mjs"

import {addPanels} from "../../panels/all.mjs"
import {addEvents} from "../etc/events.mjs"
import {addAxes} from "../draw/axes.mjs"

export function setup() {

  data.scale = scale
  data.meshes = meshes
  data.tooltips = tooltips

  data.settings = settings = getSettings()

  $("#navbar #title span").text(settings.ui.title)

  $("#navbar").css("display", settings.ui.navbar ? "" : "none")
  $("#forkme").css("display", settings.ui.forkme ? "" : "none")
  $("#metabox").css("display", settings.ui.metabox ? "" : "none")
  $("#help").css("display", settings.ui.help ? "" : "none")

  data.renderer = renderer = new THREE.WebGLRenderer({alpha: true, antialias: true, logarithmicDepthBuffer: true})
  renderer.setSize(window.innerWidth, window.innerHeight)
  renderer.setPixelRatio(window.devicePixelRatio)

  data.canvas = canvas = document.body.appendChild(renderer.domElement)
  canvas.setAttribute("id", "canvas")

  data.scene = scene = new THREE.Scene()
  scene.background = whiteThree

  data.lights = lights = []
  lights.push(addPointLight())
  lights.push(addAmbientLight())

  data.camera = camera = addPerspectiveCamera()

  data.controls = controls = addDragControls()
  data.controls = controls = addFlyControls()
  data.controls = controls = addZoomControls()

  data.panels = panels = addPanels()
  data.events = events = addEvents()
  data.axes = axes =addAxes()

  localMeshes("load")

  addComposer()
  animate()

  function addComposer() {

    data.composer = composer = new THREE.EffectComposer(renderer)
    composer.renderPass = new THREE.RenderPass(scene, camera)
    composer.shaderPass = new THREE.ShaderPass(THREE.CopyShader)
    composer.outlinePass = new THREE.OutlinePass(new THREE.Vector2(window.innerWidth, window.innerHeight ), scene, camera)

    composer.outlinePass.hiddenEdgeColor.set(whiteThree)
    composer.outlinePass.visibleEdgeColor.set(blackThree)
    composer.outlinePass.overlayMaterial.blending = THREE.CustomBlending

    composer.addPass(composer.renderPass)
    composer.addPass(composer.shaderPass)
    composer.addPass(composer.outlinePass)

  }

  function animate() {

    requestAnimationFrame(animate)

    composer.render()

  }

  return data

}