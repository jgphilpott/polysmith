function generator(lang="en") {

  let angle = 7
  let offset = 15
  let height = 200
  let thickness = 2

  let topRadius = 45
  let bottomRadius = 40
  let radialSegments = 24

  let base = addBox(offset * 2, (bottomRadius + thickness) * 2, thickness, [0, 0, - (height / 2)  + (thickness / 2)])

  let frontInteriorCylinder = newCylinder(height, topRadius, bottomRadius, [offset, thickness, 0], black, radialSegments).rotateX(Math.PI / 2)
  let frontExteriorCylinder = newCylinder(height, topRadius + thickness, bottomRadius + thickness, [offset, 0, 0], black, radialSegments).rotateX(Math.PI / 2)
  let backInteriorCylinder = newCylinder(height, topRadius, bottomRadius, [-offset, thickness, 0], black, radialSegments).rotateX(Math.PI / 2)
  let backExteriorCylinder = newCylinder(height, topRadius + thickness, bottomRadius + thickness, [-offset, 0, 0], black, radialSegments).rotateX(Math.PI / 2)

  let topAngle = newBox(topRadius * 3, topRadius * 3, offset * 2, [0, 0, (height / 2) + offset - ((topRadius + thickness + offset) * Math.tan(angle * (Math.PI / 180)))]).rotateY(- angle * (Math.PI / 180))
  let cleanup = newBox(offset * 2, topRadius * 3, height, [0, 0, thickness])

  let frontCylinder = cutMesh(cutMesh(cutMesh(cutMesh(frontExteriorCylinder, frontInteriorCylinder), backInteriorCylinder), topAngle), cleanup)
  let backCylinder = cutMesh(cutMesh(cutMesh(cutMesh(backExteriorCylinder, backInteriorCylinder), frontInteriorCylinder), topAngle), cleanup)

  data.scene.add(frontCylinder)
  data.scene.add(backCylinder)

}
