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

  let holeRadius = (radius - thickness - flagstick) / 2
  let holeCutter = newBox(radius * 2, depth, radius * 2, [0, 0, - radius])
  let holeExteriorRadius = cutMesh(cupExterior, newCylinder(depth, flagstick + (holeRadius * 1.5), flagstick + (holeRadius * 1.5), [0, 0, 0], black, segments))
  let holeInteriorRadius = newCylinder(depth, flagstick + (holeRadius / 2), flagstick + (holeRadius / 2), [0, 0, 0], black, segments)

  holeCutter.rotation.y = tools.degree2radian(-30)
  let holeOne = cutMesh(cupExterior, holeCutter)
  holeCutter.rotation.y = tools.degree2radian(30)
  holeOne = cutMesh(cutMesh(intersectMesh(holeOne, holeCutter), holeExteriorRadius), holeInteriorRadius)

  holeCutter.rotation.y = tools.degree2radian(-150)
  let holeTwo = cutMesh(cupExterior, holeCutter)
  holeCutter.rotation.y = tools.degree2radian(-90)
  holeTwo = cutMesh(cutMesh(intersectMesh(holeTwo, holeCutter), holeExteriorRadius), holeInteriorRadius)

  holeCutter.rotation.y = tools.degree2radian(150)
  let holeThree = intersectMesh(cupExterior, holeCutter)
  holeCutter.rotation.y = tools.degree2radian(90)
  holeThree = cutMesh(cutMesh(cutMesh(holeThree, holeCutter), holeExteriorRadius), holeInteriorRadius)

  cup = cutMesh(cupExterior, cupInterior)
  base = cutMesh(cutMesh(cutMesh(cutMesh(cutMesh(joinMesh(base, baseBottom), baseTop), flagstickInterior), holeOne), holeTwo), holeThree)
  flagstick = cutMesh(cutMesh(flagstickExterior, flagstickInterior), baseTop)

  data.scene.add(cup)
  data.scene.add(base)
  data.scene.add(flagstick)

}
