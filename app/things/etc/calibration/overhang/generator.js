function polygen(degree=10, size=50) {

  data.title = "Overhang Test (" + degree + "° Steps)"

  let steps = (90 / degree) - 1

  let thickness = 5

  let base = newBox(size, size, thickness, [ - (size / 2), 0, - (thickness / 2)])

  let archExterior = newCylinder(size, size, size, [0, 0, 0], black, (steps + 1) * 4).rotateY(tools.degree2radian(45 / (steps + 1)))
  let archInterior = newCylinder(size + 1, size - thickness, size - thickness, [0, 0, 0], black, (steps + 1) * 4).rotateY(tools.degree2radian(45 / (steps + 1)))

  let archXcleanup = newBox(size * 4, size * 4, size * 4, [size * 2, 0, 0])
  let archZcleanup = newBox(size * 4, size * 4, size * 4, [0, 0, - (size * 2)])

  let arch = cutMesh(archExterior, archInterior)
  arch = cutMesh(cutMesh(arch, archXcleanup), archZcleanup)

  data.scene.add(joinMesh(arch, base))

}