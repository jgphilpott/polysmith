function generator() {

  let geometry = new THREE.BoxGeometry(50, 50, 50)
  let material = new THREE.MeshStandardMaterial({"color": black})
  let cube = new THREE.Mesh(geometry, material)

  data.scene.add(cube)

}
