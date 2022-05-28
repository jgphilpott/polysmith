// Link: https://threejs.org/docs/#api/en/cameras/PerspectiveCamera
export function addPerspectiveCamera() {

  camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, scale / 1000, scale * 10)

  camera.up.set(0, 0, 1)

  let position = settings.camera.position
  let target = settings.camera.target

  camera.position.set(position.x, position.y, position.z)
  camera.lookAt(target.x, target.y, target.z)
  camera.target = target

  return camera

}