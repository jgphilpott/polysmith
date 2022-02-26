function generator(collar=false) {

  let cutoutSize = 25

  let shaftLength = 22
  let shaftRadius = 2.5

  let cutLength = 18
  let cutDepth = 0.5

  let collarLength = 2
  let collarRadius = 12

  let shaft = newCylinder(shaftLength, shaftRadius, shaftRadius)
  let cut = newBox(shaftLength, shaftLength, shaftLength, [0, shaftLength - cutLength, (shaftLength / 2 + shaftRadius) - cutDepth])

  shaft = cutMesh(shaft, cut).rotateX(tools.degree2radian(-90))

  let cutout = newBox(cutoutSize / 2, cutoutSize * 2, cutoutSize, [0, cutoutSize / 2, -(cutoutSize / 2)])

  if (collar) {

    collar = newCylinder(collarLength, collarRadius, collarRadius, [0, collarLength / 2, 0]).rotateX(tools.degree2radian(-90))
    shaft.position.set(0, (shaftLength / 2) + collarLength, 0)
    cutout = cutMesh(cutMesh(cutout, shaft), collar)
    data.scene.add(cutout)

  } else {

    shaft.position.set(0, shaftLength / 2, 0)
    cutout = cutMesh(cutout, shaft)
    data.scene.add(cutout)

  }

}