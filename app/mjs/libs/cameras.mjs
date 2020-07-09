export function addCamera(position=data.scale) {

  let camera = new THREE.PerspectiveCamera(75, data.width / data.height, 0.1, 1000)
  camera.position.set(position, position, position)
  camera.up.set(0, 0, 1)
  data.camera = camera

}
