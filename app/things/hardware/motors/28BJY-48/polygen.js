function polygen(collar=false) {

  let shaftLength = 8
  let shaftRadius = 2.5

  let cutLength = 6
  let cutDepth = 1

  let collarLength = 1.5
  let collarRadius = 5

  let shaft = newCylinder(shaftLength, shaftRadius, shaftRadius)

  let cutOne = newBox(shaftLength, shaftLength, shaftLength, [0, shaftLength - cutLength, (shaftLength / 2 + shaftRadius) - cutDepth])
  let cutTwo = newBox(shaftLength, shaftLength, shaftLength, [0, shaftLength - cutLength, - ((shaftLength / 2 + shaftRadius) - cutDepth)])

  shaft = cutMesh(cutMesh(shaft, cutOne), cutTwo).rotateX(tools.deg$rad(90))

  if (collar) {

    addCylinder(collarLength, collarRadius, collarRadius, [0, 0, collarLength / 2]).rotateX(tools.deg$rad(90))

    shaft.position.set(0, 0, (shaftLength / 2) + collarLength)
    data.scene.add(shaft)

  } else {

    shaft.position.set(0, 0, shaftLength / 2)
    data.scene.add(shaft)

  }

}