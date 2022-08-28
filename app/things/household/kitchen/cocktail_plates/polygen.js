function polygen(sides=3, size=75) {

  let thickness = 2
  let lipSize = 10
  let angle, holderDistance, slotDistance = null

  let plate = newCylinder(thickness + lipSize, size + lipSize, size, [0, 0, 0], black, sides).rotateX(tools.d$rad(90))
  let lip = newCylinder(thickness + lipSize, size + lipSize - thickness, size - thickness, [0, thickness, 0], black, sides).rotateX(tools.d$rad(90))

  switch (sides) {

    case 3:
      angle = 60
      holderDistance = 48
      slotDistance = 73
      data.title = "triangle"
      break

    case 4:
      angle = 0
      holderDistance = 55
      slotDistance = 80
      data.title = "square"
      break

    case 5:
      angle = 0
      holderDistance = -58
      slotDistance = -83
      data.title = "pentagon"
      break

    case 6:
      angle = 0
      holderDistance = 58
      slotDistance = 83
      data.title = "hexagon"
      break

    case 7:
      angle = 0
      holderDistance = -60
      slotDistance = -85
      data.title = "heptagon"
      break

    case 8:
      angle = 0
      holderDistance = 60
      slotDistance = 85
      data.title = "octagon"
      break

    case 9:
      angle = 0
      holderDistance = -60
      slotDistance = -85
      data.title = "nonagon"
      break

    case 10:
      angle = 0
      holderDistance = 60
      slotDistance = 85
      data.title = "decagon"
      break

  }

  let glass_holder = newCylinder(lipSize * 2, lipSize, lipSize, [trig.side4angle(angle, holderDistance, null, true), 0, -trig.side4angle(angle, holderDistance, true, null)], black, 42).rotateX(tools.d$rad(90))
  let glass_slot = newBox(lipSize + 1, lipSize * 4, lipSize * 2, [0, slotDistance, 0], black).rotateZ(tools.d$rad(-angle))

  let cocktail_plate = cutMesh(cutMesh(cutMesh(plate, lip), glass_holder), glass_slot)

  data.scene.add(cocktail_plate)

}