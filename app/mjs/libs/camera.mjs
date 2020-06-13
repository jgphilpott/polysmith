export function addCamera() {

  let camera = new THREE.PerspectiveCamera(75, data.width / data.height, 0.1, 1000)
  camera.position.set(100, 100, 100)
  data.camera = camera

}
