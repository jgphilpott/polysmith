function generator() {

  let radius = 54
  let depth = 152.4
  let thickness = 2.54

  let cupExterior = newCylinder(depth, radius, radius)
  let cupInterior = newCylinder(depth, radius - thickness, radius - thickness)

  let cup = cutMesh(cupExterior, cupInterior)

  data.scene.add(cup)

}
