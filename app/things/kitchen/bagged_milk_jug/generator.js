function generator(language="english") {

  let topAngle = 7

  let height = 200
  let thickness = 2

  let topRadius = 45
  let bottomRadius = 40
  let radialSegments = 18

  let cylinderOffset = 15

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

  // let handleHeight = 100
  // let handleRadius = 12
  // let handleAngle = 35
  //
  // let handle = newCylinder(handleHeight, handleRadius, handleRadius, [- (offset + bottomRadius + thickness + (handleRadius * 3)), 0, 0]).rotateX(Math.PI / 2)
  //
  // let handleTopSupport = newBox(handleRadius * 8, handleRadius * 2, thickness * 5, [- (offset + bottomRadius + thickness + (handleRadius * 2)), 0, (handleHeight / 2) - (thickness * 2)]).rotateY(- (handleAngle * (Math.PI / 180)))
  // let handleBottomSupport = newBox(handleRadius * 8, handleRadius * 2, thickness * 5, [- (offset + bottomRadius + thickness + (handleRadius * 2)), 0, - ((handleHeight / 2) - (thickness * 2))]).rotateY(handleAngle * (Math.PI / 180))
  //
  // handleTopSupport = cutMesh(handleTopSupport, backInteriorCylinder)
  // handleBottomSupport = cutMesh(handleBottomSupport, backInteriorCylinder)
  //
  // handleTopSupport.position.setZ((handleHeight / 2) - (thickness * 2))
  // handleTopSupport.position.setX(- 1.2)
  // handleBottomSupport.position.setZ(- ((handleHeight / 2) - (thickness * 2)))
  //
  // let handleCleanup = newBox(handleRadius * 4, handleRadius * 4, handleHeight * 2, [- (offset + bottomRadius + thickness + (handleRadius * 5)), 0, 0], red)
  //
  // handleTopSupport = cutMesh(handleTopSupport, handleCleanup)
  // handleBottomSupport = cutMesh(handleBottomSupport, handleCleanup)
  //
  // let handleTopCleanup = newBox(handleRadius * 24, handleRadius * 4, handleRadius * 2, [- (offset + bottomRadius + thickness + (handleRadius * 3)), 0, handleHeight]).rotateY(- (handleAngle * (Math.PI / 180)))
  // let handleBottomCleanup = newBox(handleRadius * 24, handleRadius * 4, handleRadius * 2, [- (offset + bottomRadius + thickness + (handleRadius * 3)), 0, - (handleHeight / 1)]).rotateY(handleAngle * (Math.PI / 180))
  //
  // handle = cutMesh(cutMesh(handle, handleTopCleanup), handleBottomCleanup)
  // handleTopSupport = cutMesh(handleTopSupport, handleTopCleanup)
  // handleBottomSupport = cutMesh(handleBottomSupport, handleBottomCleanup)
  //
  // if (lang == "en") {
  //
  //   let text = addText("MILK")
  //
  // } else if (lang == "fr") {
  //
  //   let text = addText("LAIT")
  //
  // } else {
  //
  //   let text = addText("MILK")
  //
  // }
  //
  // sleep(2000).then(() => {
  //
  //   data.meshes[0].position.set(- (offset + bottomRadius + thickness + (handleRadius * 3.4)), - 6, handleHeight / 2.6)
  //   data.meshes[0].rotateY(- (handleAngle * (Math.PI / 180)))
  //
  // })

  data.scene.add(jug.rotateX(Math.PI / 2))

}
