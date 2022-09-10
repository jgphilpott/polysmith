polygen = (collar = false) ->

    cutoutSize = 25

    shaftLength = 22
    shaftRadius = 2.5

    cutLength = 18
    cutDepth = 0.5

    collarLength = 2
    collarRadius = 12

    shaft = newCylinder shaftLength, shaftRadius, shaftRadius
    cutout = newBox shaftLength, shaftLength, shaftLength, [0, shaftLength - cutLength, (shaftLength / 2 + shaftRadius) - cutDepth]

    shaft = cut(shaft, cutout).rotateX(deg$rad(- 90))

    cutout = newBox cutoutSize / 2, cutoutSize * 2, cutoutSize, [0, cutoutSize / 2, - (cutoutSize / 2)]

    if collar

        collar = newCylinder(collarLength, collarRadius, collarRadius, [0, collarLength / 2, 0]).rotateX(deg$rad(- 90))
        shaft.position.set 0, (shaftLength / 2) + collarLength, 0
        cutout = cut cut(cutout, shaft), collar
        data.scene.add cutout

    else

        shaft.position.set 0, shaftLength / 2, 0
        cutout = cut cutout, shaft
        data.scene.add cutout
