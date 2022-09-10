polygen = (language = "english") ->

    topAngle = 7

    height = 200
    thickness = 2

    topRadius = 45
    bottomRadius = 40
    radialSegments = 18

    cylinderOffset = 15

    handleThickness = 10
    handleHeight = 100
    handleRadius = 12
    handleAngle = 55

    frontInteriorCylinder = newCylinder height, topRadius, bottomRadius, radialSegments, [cylinderOffset, thickness, 0]
    frontExteriorCylinder = newCylinder height, topRadius + thickness, bottomRadius + thickness, radialSegments, [cylinderOffset, 0, 0]

    backInteriorCylinder = newCylinder height, topRadius, bottomRadius, radialSegments, [-cylinderOffset, thickness, 0]
    backExteriorCylinder = newCylinder height, topRadius + thickness, bottomRadius + thickness, radialSegments, [-cylinderOffset, 0, 0]

    cleanup = newBox cylinderOffset * 2, height, topRadius * 3, [0, thickness, 0]

    frontCylinder = cut(cut(cut(frontExteriorCylinder, frontInteriorCylinder), backInteriorCylinder), cleanup)
    backCylinder = cut(cut(cut(backExteriorCylinder, backInteriorCylinder), frontInteriorCylinder), cleanup)

    wallAngle = deg$rad(angle$sides(null, height, topRadius - bottomRadius))
    wallOffset = bottomRadius + ((topRadius - bottomRadius) / 2) + (thickness / 2)
    leftWall = newBox(cylinderOffset * 2, height, thickness, [0, thickness / 2, -wallOffset]).rotateX(-wallAngle)
    rightWall = newBox(cylinderOffset * 2, height, thickness, [0, thickness / 2, wallOffset]).rotateX(wallAngle)

    base = newBox(cylinderOffset * 2, thickness, (bottomRadius + thickness) * 2, [0, -(height / 2) + (thickness / 2), 0])

    topCutOffset = (height / 2) + (topRadius / 2) - side$angle(topAngle, null, cylinderOffset + topRadius + thickness, true) - 1
    topCut = newBox(topRadius * 4, topRadius, topRadius * 4, [0, topCutOffset, 0]).rotateZ(deg$rad(topAngle))

    jug = cut(join(join(join(join(frontCylinder, backCylinder), leftWall), rightWall), base), topCut)

    handleShaft = newCylinder handleHeight, handleRadius, handleRadius, radialSegments * 10, [-(cylinderOffset + bottomRadius + thickness + (handleRadius * 3)), 0, 0]
    handleCleanup = newBox handleRadius * 4, handleHeight * 2, handleRadius * 4, [-(cylinderOffset + bottomRadius + thickness + (handleRadius * 5)), 0, 0]

    handleTopSupport = cut(newBox(handleThickness, handleHeight, handleRadius * 2, [-(cylinderOffset + topRadius + (handleRadius * 2)), -handleThickness, 0]).rotateZ(deg$rad(-handleAngle)), handleCleanup)
    handleBottomSupport = cut(newBox(handleThickness, handleHeight, handleRadius * 2, [-(cylinderOffset + topRadius + (handleRadius * 2)), handleThickness, 0]).rotateZ(deg$rad(handleAngle)), handleCleanup)

    handleTopCleanup = newBox(handleThickness * 2, handleHeight, handleRadius * 3, [-(cylinderOffset + topRadius + (handleRadius * 2) + (handleThickness * 1.5)), -(handleThickness * 2), 0]).rotateZ deg$rad(-handleAngle)
    handleBottomCleanup = newBox(handleThickness * 2, handleHeight, handleRadius * 3, [-(cylinderOffset + topRadius + (handleRadius * 2) + (handleThickness * 1.5)), handleThickness * 2, 0]).rotateZ deg$rad(handleAngle)

    handle = cut(cut(cut(join(join(handleShaft, handleTopSupport), handleBottomSupport), handleTopCleanup), handleBottomCleanup), backInteriorCylinder)

    if language == "afrikaans"

        addText "MELK", 8, 6

    else if language == "cantonese"

        addText "牛奶", 12, 6, false, "unifont"

    else if language == "czech"

        addText "MLÉKO", 8, 3

    else if language == "dutch"

        addText "MELK", 10, 3

    else if language == "english"

        addText "MILK", 12, 2

    else if language == "french"

        addText "LAIT", 12, 4

    else if language == "german"

        addText "MILCH", 9, 3

    else if language == "greek"

        addText "ΓΑΛΑ", 10, 4

    else if language == "hungarian"

        addText "TEJ", 12, 7

    else if language == "icelandic"

        addText "Mjólk", 9, 7

    else if language == "irish"

        addText "BAINNE", 7, 3.14

    else if language == "italian"

        addText "LATTE", 8, 4

    else if language == "japanese"

        addText "牛乳", 12, 6, false, "unifont"

    else if language == "korean"

        addText "우유", 12, 6, false, "unifont"

    else if language == "latin"

        addText "LATEX", 8, 4

    else if language == "mandarin"

        addText "牛奶", 12, 6, false, "unifont"

    else if language == "polish"

        addText "MLEKO", 8, 3

    else if language == "portuguese"

        addText "LEITE", 10, 3

    else if language == "punjabi"

        addText "ਦੁੱਧ", 12, 5, false, "unifont"

    else if language == "russian"

        addText "МОЛОКО", 6.5, 3

    else if language == "spanish"

        addText "LECHE", 8, 3

    else if language == "swahili"

        addText "MAZIWA", 7, 3

    else if language == "swedish"

        addText "MJÖLK", 7, 5

    else if language == "turkish"

        addText "SÜT", 11, 6

    else if language == "vietnamese"

        addText "SỮA", 10, 6

    else if language == "zulu"

        addText "UBISI", 10, 4

    else

        addText ""

    setTimeout () ->

        text = data.meshes[0].rotateY deg$rad(handleAngle - 90)

        boundingBox = getBoundingBox text

        text.position.set centerX(boundingBox) - (cylinderOffset + bottomRadius + thickness + (handleRadius * 1.8)), centerY(boundingBox), centerZ(boundingBox) + (handleHeight / 2.5)

        milkJug = join jug, handle

        data.scene.add milkJug.rotateX(deg$rad(90))

    , 1000