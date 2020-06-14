function generator() {

  let geometry = new THREE.BoxGeometry(50, 50, 50)
  let material = new THREE.MeshStandardMaterial({"color": black})
  let cube = new THREE.Mesh(geometry, material)

  geometry = new THREE.SphereGeometry(25, 42, 42)
  material = new THREE.MeshStandardMaterial({"color": black})
  let sphere = new THREE.Mesh(geometry, material)
  sphere.position.set(25, 25, 25)

  data.scene.add(cube)
  data.scene.add(sphere)

}
