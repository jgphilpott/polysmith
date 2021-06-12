function generator() {

  let cup = null
  let segments = 42

  let depth = tools.inch2mm(6)
  let radius = tools.inch2mm(4.25) / 2
  let thickness = tools.inch2mm(0.1)
  let flagstick = tools.inch2mm(0.75) / 2

  let cupExterior = newCylinder(depth, radius, radius, [0, 0, 0], black, segments)
  let cupInterior = newCylinder(depth, radius - thickness, radius - thickness, [0, 0, 0], black, segments)

  let base = newCylinder(thickness, radius, radius, [0, - (depth / 2) + (depth / 3) + (radius / 4) + (thickness / 2), 0], black, segments)
  let baseTop = newCylinder(radius / 2, radius, 0, [0, - (depth / 2) + (depth / 3) + thickness, 0], black, segments)
  let baseBottom = newCylinder(radius / 2, radius, 0, [0, - (depth / 2) + (depth / 3), 0], black, segments)

  let flagstickExterior = newCylinder(radius / 2, flagstick + thickness, flagstick + thickness, [0, - (depth / 2) + (depth / 3) - (radius / 4), 0], black, segments)
  let flagstickInterior = newCylinder(radius / 2, flagstick, flagstick, [0, - (depth / 2) + (depth / 3) - (radius / 4), 0], black, segments)

  cup = cutMesh(cupExterior, cupInterior)
  base = cutMesh(cutMesh(joinMesh(base, baseBottom), baseTop), flagstickInterior)
  flagstick = cutMesh(cutMesh(flagstickExterior, flagstickInterior), baseTop)

  data.scene.add(cup)
  data.scene.add(base)
  data.scene.add(flagstick)

}
