polygen = (collar = false) ->

    shaftLength = 8
    shaftRadius = 2.5

    cutLength = 6
    cutDepth = 1

    collarLength = 1.5
    collarRadius = 5

    shaft = newCylinder shaftLength, shaftRadius, shaftRadius

    cutOne = newBox shaftLength, shaftLength, shaftLength, [0, shaftLength - cutLength, (shaftLength / 2 + shaftRadius) - cutDepth]
    cutTwo = newBox shaftLength, shaftLength, shaftLength, [0, shaftLength - cutLength, - ((shaftLength / 2 + shaftRadius) - cutDepth)]

    shaft = cut(cut(shaft, cutOne), cutTwo).rotateX(deg$rad(90))

    if collar

        addCylinder(collarLength, collarRadius, collarRadius, [0, 0, collarLength / 2]).rotateX(deg$rad(90))

        shaft.position.set 0, 0, (shaftLength / 2) + collarLength
        data.scene.add shaft

    else

        shaft.position.set 0, 0, shaftLength / 2
        data.scene.add shaft
