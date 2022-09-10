polygen = (collar = false) ->

    cutoutSize = 15

    shaftLength = 8
    shaftRadius = 2.5

    cutLength = 6
    cutDepth = 1

    collarLength = 1.5
    collarRadius = 5

    shaft = newCylinder shaftLength, shaftRadius, shaftRadius

    cutOne = newBox shaftLength, shaftLength, shaftLength, [0, shaftLength - cutLength, (shaftLength / 2 + shaftRadius) - cutDepth]
    cutTwo = newBox shaftLength, shaftLength, shaftLength, [0, shaftLength - cutLength, - ((shaftLength / 2 + shaftRadius) - cutDepth)]

    shaft = cut(cut(shaft, cutOne), cutTwo).rotateX(deg$rad(- 90))

    cutout = newBox(cutoutSize / 2, cutoutSize * 2, cutoutSize, [0, cutoutSize / 2, - (cutoutSize / 2)])

    if collar

        collar = newCylinder(collarLength, collarRadius, collarRadius, [0, collarLength / 2, 0]).rotateX(deg$rad(- 90))
        shaft.position.set(0, (shaftLength / 2) + collarLength, 0)
        cutout = cut(cut(cutout, collar), shaft)
        data.scene.add cutout

    else

        shaft.position.set 0, shaftLength / 2, 0
        cutout = cut cutout, shaft
        data.scene.add cutout
