function generator(lang="en") {

  let angle = 7
  let offset = 15
  let height = 200
  let thickness = 2

  let topRadius = 45
  let bottomRadius = 40
  let radialSegments = 24

  let cleanup = newBox(offset * 2, topRadius * 3, height, [0, 0, thickness])
  let base = addBox(offset * 2, (bottomRadius + thickness) * 2, thickness, [0, 0, - (height / 2)  + (thickness / 2)])
  let topAngle = newBox(topRadius * 3, topRadius * 3, offset * 2, [0, 0, (height / 2) + offset - ((topRadius + thickness + offset) * Math.tan(angle * (Math.PI / 180)))]).rotateY(- angle * (Math.PI / 180))

  let frontInteriorCylinder = newCylinder(height, topRadius, bottomRadius, [offset, thickness, 0], black, radialSegments).rotateX(Math.PI / 2)
  let frontExteriorCylinder = newCylinder(height, topRadius + thickness, bottomRadius + thickness, [offset, 0, 0], black, radialSegments).rotateX(Math.PI / 2)
  let backInteriorCylinder = newCylinder(height, topRadius, bottomRadius, [- offset, thickness, 0], black, radialSegments).rotateX(Math.PI / 2)
  let backExteriorCylinder = newCylinder(height, topRadius + thickness, bottomRadius + thickness, [- offset, 0, 0], black, radialSegments).rotateX(Math.PI / 2)

  let frontCylinder = cutMesh(cutMesh(cutMesh(cutMesh(frontExteriorCylinder, frontInteriorCylinder), backInteriorCylinder), topAngle), cleanup)
  let backCylinder = cutMesh(cutMesh(cutMesh(cutMesh(backExteriorCylinder, backInteriorCylinder), frontInteriorCylinder), topAngle), cleanup)

  let wallCutTop = 41 * Math.tan(angle * Math.PI / 180)
  let wallCutBottom = (41 + (offset * 2)) * Math.tan(angle * Math.PI / 180)

  let leftInteriorWall = [[offset, topRadius, (height / 2) - wallCutTop], [- offset, topRadius, (height / 2) - wallCutBottom], [- offset, bottomRadius, - (height / 2) + thickness], [offset, bottomRadius, - (height / 2) + thickness]]
  let leftExteriorWall = [[offset, topRadius + thickness, (height / 2) - wallCutTop], [- offset, topRadius + thickness, (height / 2) - wallCutBottom], [- offset, bottomRadius + thickness, - (height / 2) + thickness], [offset, bottomRadius + thickness, - (height / 2) + thickness]]
  let rightInteriorWall = [[offset, - topRadius, (height / 2) - wallCutTop], [- offset, - topRadius, (height / 2) - wallCutBottom], [- offset, - bottomRadius, - (height / 2) + thickness], [offset, - bottomRadius, - (height / 2) + thickness]]
  let rightExteriorWall = [[offset, - (topRadius + thickness), (height / 2) - wallCutTop], [- offset, - (topRadius + thickness), (height / 2) - wallCutBottom], [- offset, - (bottomRadius + thickness), - (height / 2) + thickness], [offset, - (bottomRadius + thickness), - (height / 2) + thickness]]

  data.scene.add(frontCylinder)
  data.scene.add(backCylinder)

  addQuadrilateral(leftInteriorWall[0], leftInteriorWall[1], leftInteriorWall[2], leftInteriorWall[3])
  addQuadrilateral(leftExteriorWall[0], leftExteriorWall[1], leftExteriorWall[2], leftExteriorWall[3])
  addQuadrilateral(leftExteriorWall[0], leftInteriorWall[0], leftInteriorWall[1], leftExteriorWall[1])

  addQuadrilateral(rightInteriorWall[0], rightInteriorWall[1], rightInteriorWall[2], rightInteriorWall[3])
  addQuadrilateral(rightExteriorWall[0], rightExteriorWall[1], rightExteriorWall[2], rightExteriorWall[3])
  addQuadrilateral(rightExteriorWall[0], rightInteriorWall[0], rightInteriorWall[1], rightExteriorWall[1])

}
