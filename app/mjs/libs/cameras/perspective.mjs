// Link: https://threejs.org/docs/#api/en/cameras/PerspectiveCamera
export function addPerspectiveCamera() {

  let camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, scale / 1000, scale * 10)

  let position = settings.camera.position
  let target = settings.camera.target

  camera.up.set(0, 0, 1)
  camera.target = target

  camera.position.set(position.x, position.y, position.z)
  camera.lookAt(target.x, target.y, target.z)

  return camera

}