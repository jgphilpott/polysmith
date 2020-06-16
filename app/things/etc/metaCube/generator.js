function generator(count=3) {

  let size = 10

  let standardMaterial = new THREE.MeshStandardMaterial({"color": black})

  for (let i = 0; i < count; i++) {

    let boxGeometry = new THREE.BoxGeometry(size, size, size)
    let cylinderGeometry = new THREE.CylinderGeometry(size / 3.33, size / 3.33, size * 2, 42)

    let box = new THREE.Mesh(boxGeometry, standardMaterial)
    let cylinder = new THREE.Mesh(cylinderGeometry, standardMaterial)

    box = cutMesh(box, cylinder)
    cylinder.rotation.x = Math.PI / 2
    box = cutMesh(box, cylinder)
    cylinder.rotation.z = Math.PI / 2
    box = cutMesh(box, cylinder)

    data.scene.add(box)

    size *= 2

  }

}
