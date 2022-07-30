function polygen(height=150, topRadius=40, bottomRadius=30, thickness=2, segments=10) {

  let glassInterior = newCylinder(height, topRadius, bottomRadius, [0, 0, 0], black, segments)
  let glassExterior = newCylinder(height, topRadius + thickness, bottomRadius + thickness, [0, -thickness, 0], black, segments)

  let glass = cutMesh(glassExterior, glassInterior)

  glass.rotation.x = tools.degree2radian(90)

  data.scene.add(glass)

}