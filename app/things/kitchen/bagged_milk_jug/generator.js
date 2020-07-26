function generator(lang="en") {

  let offset = 15
  let thickness = 2

  let height = 200

  let topRadius = 45
  let bottomRadius = 40
  let radialSegments = 101

  let frontInteriorCylinder = newCylinder(height, topRadius, bottomRadius, [offset, thickness, 0], black, radialSegments).rotateX(Math.PI / 2)
  let frontExteriorCylinder = newCylinder(height, topRadius + thickness, bottomRadius + thickness, [offset, 0, 0], black, radialSegments).rotateX(Math.PI / 2)
  let backInteriorCylinder = newCylinder(height, topRadius, bottomRadius, [-offset, thickness, 0], black, radialSegments).rotateX(Math.PI / 2)
  let backExteriorCylinder = newCylinder(height, topRadius + thickness, bottomRadius + thickness, [-offset, 0, 0], black, radialSegments).rotateX(Math.PI / 2)

  let frontCylinder = cutMesh(frontExteriorCylinder, frontInteriorCylinder)
  let backCylinder = cutMesh(backExteriorCylinder, backInteriorCylinder)

  data.scene.add(frontCylinder)
  data.scene.add(backCylinder)

}
