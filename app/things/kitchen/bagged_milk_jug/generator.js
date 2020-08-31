function generator(language="english") {

  let topAngle = 7

  let height = 200
  let thickness = 2

  let topRadius = 45
  let bottomRadius = 40
  let radialSegments = 18

  let cylinderOffset = 15

  let handleThickness = 10
  let handleHeight = 100
  let handleRadius = 12
  let handleAngle = 55

  let frontInteriorCylinder = newCylinder(height, topRadius, bottomRadius, [cylinderOffset, thickness, 0], black, radialSegments)
  let frontExteriorCylinder = newCylinder(height, topRadius + thickness, bottomRadius + thickness, [cylinderOffset, 0, 0], black, radialSegments)

  let backInteriorCylinder = newCylinder(height, topRadius, bottomRadius, [-cylinderOffset, thickness, 0], black, radialSegments)
  let backExteriorCylinder = newCylinder(height, topRadius + thickness, bottomRadius + thickness, [-cylinderOffset, 0, 0], black, radialSegments)

  let cleanup = newBox(cylinderOffset * 2, height, topRadius * 3, [0, thickness, 0])

  let frontCylinder = cutMesh(cutMesh(cutMesh(frontExteriorCylinder, frontInteriorCylinder), backInteriorCylinder), cleanup)
  let backCylinder = cutMesh(cutMesh(cutMesh(backExteriorCylinder, backInteriorCylinder), frontInteriorCylinder), cleanup)

  let wallAngle = tools.degree2radian(trig.angle4sides(null, height, topRadius - bottomRadius))
  let wallOffset = bottomRadius + ((topRadius - bottomRadius) / 2) + (thickness / 2)
  let leftWall = newBox(cylinderOffset * 2, height, thickness, [0, thickness / 2, -wallOffset]).rotateX(-wallAngle)
  let rightWall = newBox(cylinderOffset * 2, height, thickness, [0, thickness / 2, wallOffset]).rotateX(wallAngle)

  let base = newBox(cylinderOffset * 2, thickness, (bottomRadius + thickness) * 2, [0, -(height / 2)  + (thickness / 2), 0])

  let topCutOffset = (height / 2) + (topRadius / 2) - trig.side4angle(topAngle, null, cylinderOffset + topRadius + thickness, true) - 1
  let topCut = newBox(topRadius * 4, topRadius, topRadius * 4, [0, topCutOffset, 0]).rotateZ(tools.degree2radian(topAngle))

  let jug = cutMesh(joinMesh(joinMesh(joinMesh(joinMesh(frontCylinder, backCylinder), leftWall), rightWall), base), topCut)

  let handleShaft = newCylinder(handleHeight, handleRadius, handleRadius, [-(cylinderOffset + bottomRadius + thickness + (handleRadius * 3)), 0, 0], black, radialSegments * 10)
  let handleCleanup = newBox(handleRadius * 4, handleHeight * 2, handleRadius * 4, [-(cylinderOffset + bottomRadius + thickness + (handleRadius * 5)), 0, 0])

  let handleTopSupport = cutMesh(newBox(handleThickness, handleHeight, handleRadius * 2, [-(cylinderOffset + topRadius + (handleRadius * 2)), -handleThickness, 0]).rotateZ(tools.degree2radian(-handleAngle)), handleCleanup)
  let handleBottomSupport = cutMesh(newBox(handleThickness, handleHeight, handleRadius * 2, [-(cylinderOffset + topRadius + (handleRadius * 2)), handleThickness, 0]).rotateZ(tools.degree2radian(handleAngle)), handleCleanup)

  let handleTopCleanup = newBox(handleThickness * 2, handleHeight, handleRadius * 3, [-(cylinderOffset + topRadius + (handleRadius * 2) + (handleThickness * 1.5)), -(handleThickness * 2), 0]).rotateZ(tools.degree2radian(-handleAngle))
  let handleBottomCleanup = newBox(handleThickness * 2, handleHeight, handleRadius * 3, [-(cylinderOffset + topRadius + (handleRadius * 2) + (handleThickness * 1.5)), handleThickness * 2, 0]).rotateZ(tools.degree2radian(handleAngle))

  let handle = cutMesh(cutMesh(cutMesh(joinMesh(joinMesh(handleShaft, handleTopSupport), handleBottomSupport), handleTopCleanup), handleBottomCleanup), backInteriorCylinder)

  if (language == "afrikaans") {

    addText("MELK", 8, 6)

  } else if (language == "cantonese") {

    addText("牛奶", 12, 6, false, "unifont")

  } else if (language == "czech") {

    addText("MLÉKO", 8, 3)

  } else if (language == "dutch") {

    addText("MELK", 10, 3)

  } else if (language == "english") {

    addText("MILK", 12, 2)

  } else if (language == "french") {

    addText("LAIT", 12, 4)

  } else if (language == "german") {

    addText("MILCH", 9, 3)

  } else if (language == "greek") {

    addText("ΓΑΛΑ", 10, 4)

  } else if (language == "hungarian") {

    addText("TEJ", 12, 7)

  } else if (language == "icelandic") {

    addText("Mjólk", 9, 7)

  } else if (language == "irish") {

    addText("BAINNE", 7, 3.14)

  } else if (language == "italian") {

    addText("LATTE", 8, 4)

  } else if (language == "japanese") {

    addText("牛乳", 12, 6, false, "unifont")

  } else if (language == "korean") {

    addText("우유", 12, 6, false, "unifont")

  } else if (language == "latin") {

    addText("LATEX", 8, 4)

  } else if (language == "mandarin") {

    addText("牛奶", 12, 6, false, "unifont")

  } else if (language == "polish") {

    addText("MLEKO", 8, 3)

  } else if (language == "portuguese") {

    addText("LEITE", 10, 3)

  } else if (language == "punjabi") {

    addText("ਦੁੱਧ", 12, 5, false, "unifont")

  } else if (language == "russian") {

    addText("МОЛОКО", 6.5, 3)

  } else if (language == "spanish") {

    addText("LECHE", 8, 3)

  } else if (language == "swahili") {

    addText("MILIKI", 9, 4)

  } else if (language == "swedish") {

    addText("MJÖLK", 7, 5)

  } else if (language == "turkish") {

    addText("SÜT", 11, 6)

  } else if (language == "vietnamese") {

    addText("SỮA", 10, 6)

  } else if (language == "zulu") {

    addText("UBISI", 10, 4)

  } else {

    addText("")

  }

  sleep(1000).then(() => {

    let text = data.meshes[0].rotateY(tools.degree2radian(handleAngle - 90))

    let boundingBox = tools.getBoundingBox(text)

    text.position.set(tools.centerX(boundingBox) - (cylinderOffset + bottomRadius + thickness + (handleRadius * 1.8)), tools.centerY(boundingBox), tools.centerZ(boundingBox) + (handleHeight / 2.5))

    let milkJug = joinMesh(jug, handle)

    data.scene.add(milkJug.rotateX(tools.degree2radian(90)))

  })

}
