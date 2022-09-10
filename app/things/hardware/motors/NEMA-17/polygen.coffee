polygen = (collar = false) ->

    shaftLength = 22
    shaftRadius = 2.5

    cutLength = 18
    cutDepth = 0.5

    collarLength = 2
    collarRadius = 12

    shaft = newCylinder shaftLength, shaftRadius, shaftRadius
    cutout = newBox shaftLength, shaftLength, shaftLength, [0, shaftLength - cutLength, (shaftLength / 2 + shaftRadius) - cutDepth]

    shaft = cut(shaft, cutout).rotateX(deg$rad(90))

    if collar

        collar = newCylinder(collarLength, collarRadius, collarRadius, [0, 0, collarLength / 2]).rotateX(deg$rad(90))
        shaft.position.set 0, 0, (shaftLength / 2) + collarLength

        data.scene.add collar
        data.scene.add shaft

    else

        shaft.position.set 0, 0, shaftLength / 2
        data.scene.add shaft
