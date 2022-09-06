function polygen(collar=false) {

  let cutoutSize = 15

  let shaftLength = 8
  let shaftRadius = 2.5

  let cutLength = 6
  let cutDepth = 1

  let collarLength = 1.5
  let collarRadius = 5

  let shaft = newCylinder(shaftLength, shaftRadius, shaftRadius)

  let cutOne = newBox(shaftLength, shaftLength, shaftLength, [0, shaftLength - cutLength, (shaftLength / 2 + shaftRadius) - cutDepth])
  let cutTwo = newBox(shaftLength, shaftLength, shaftLength, [0, shaftLength - cutLength, - ((shaftLength / 2 + shaftRadius) - cutDepth)])

  shaft = cutMesh(cutMesh(shaft, cutOne), cutTwo).rotateX(tools.deg$rad(- 90))

  let cutout = newBox(cutoutSize / 2, cutoutSize * 2, cutoutSize, [0, cutoutSize / 2, - (cutoutSize / 2)])

  if (collar) {

    collar = newCylinder(collarLength, collarRadius, collarRadius, [0, collarLength / 2, 0]).rotateX(tools.deg$rad(- 90))
    shaft.position.set(0, (shaftLength / 2) + collarLength, 0)
    cutout = cutMesh(cutMesh(cutout, collar), shaft)
    data.scene.add(cutout)

  } else {

    shaft.position.set(0, shaftLength / 2, 0)
    cutout = cutMesh(cutout, shaft)
    data.scene.add(cutout)

  }

}