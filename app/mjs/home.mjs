$(document).ready(function() {

  let white3 = new THREE.Color("rgba(255, 255, 255)")

  let width = $(window).width()
  let height = $(window).height()

  let renderer = new THREE.WebGLRenderer()
  renderer.setSize(width, height)

  let canvas = document.body.appendChild(renderer.domElement)

  let scene = new THREE.Scene()
  scene.background = white3

  let light = new THREE.PointLight(white3, 1)
  light.position.set(10, 10, 10)
  scene.add(light)

  let camera = new THREE.PerspectiveCamera(75, width / height, 0.1, 1000)
  camera.position.set(10, 10, 10)

  let controls = new THREE.OrbitControls(camera, canvas)

  function animate() {

    requestAnimationFrame(animate)

    controls.update()

    renderer.render(scene, camera)

  }

  animate()

})
