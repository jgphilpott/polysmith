function polygen(collar=false) {

  let shaftLength = 22
  let shaftRadius = 2.5

  let cutLength = 18
  let cutDepth = 0.5

  let collarLength = 2
  let collarRadius = 12

  let shaft = newCylinder(shaftLength, shaftRadius, shaftRadius)
  let cut = newBox(shaftLength, shaftLength, shaftLength, [0, shaftLength - cutLength, (shaftLength / 2 + shaftRadius) - cutDepth])

  shaft = cutMesh(shaft, cut).rotateX(tools.deg$rad(90))

  if (collar) {

    collar = newCylinder(collarLength, collarRadius, collarRadius, [0, 0, collarLength / 2]).rotateX(tools.deg$rad(90))
    shaft.position.set(0, 0, (shaftLength / 2) + collarLength)

    data.scene.add(collar)
    data.scene.add(shaft)

  } else {

    shaft.position.set(0, 0, shaftLength / 2)
    data.scene.add(shaft)

  }

}