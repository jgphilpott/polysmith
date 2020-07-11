function generator(dimensions=1) {

  let size = 10
  let cutoutSize = 5
  let sizeMultiplier = 2.5
  let totalSize = size

  for (let i = 0; i < dimensions - 1; i++) {

    totalSize *= sizeMultiplier

  }

  for (let i = 0; i < dimensions; i++) {

    let boxGeometry = new THREE.BoxGeometry(size, size, size)
    let box = new THREE.Mesh(boxGeometry, standardMaterial)

    let boxStandGeometry = new THREE.BoxGeometry(size, size, totalSize / 2)
    let boxStand = new THREE.Mesh(boxStandGeometry, standardMaterial)
    boxStand.position.set(0, 0, -totalSize / 4)
    box = joinMesh(box, boxStand)

    let cutOneGeometry = new THREE.BoxGeometry(totalSize + 1, cutoutSize, cutoutSize)
    let cutTwoGeometry = new THREE.BoxGeometry(cutoutSize, totalSize + 1, cutoutSize)
    let cutThreeGeometry = new THREE.BoxGeometry(cutoutSize, cutoutSize, totalSize + 1)

    let cutOne = new THREE.Mesh(cutOneGeometry, standardMaterial)
    let cutTwo = new THREE.Mesh(cutTwoGeometry, standardMaterial)
    let cutThree = new THREE.Mesh(cutThreeGeometry, standardMaterial)

    cutOne.rotateX(Math.PI / 4)
    cutTwo.rotateY(Math.PI / 4)
    cutThree.rotateZ(Math.PI / 4)

    box = cutMesh(box, cutOne)
    box = cutMesh(box, cutTwo)
    box = cutMesh(box, cutThree)

    data.scene.add(box)

    size *= sizeMultiplier
    cutoutSize *= sizeMultiplier

  }

}
