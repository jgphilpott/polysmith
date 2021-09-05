function generator(sides=3, size=150) {

  let thickness = 2
  let lipSize = 10

  let plate = newCylinder(thickness + lipSize, size + lipSize, size, [0, 0, 0], black, sides).rotateX(tools.degree2radian(90))
  let lip = newCylinder(thickness + lipSize, size + lipSize - thickness, size - thickness, [0, thickness, 0], black, sides).rotateX(tools.degree2radian(90))

  let cocktail_plate = cutMesh(plate, lip)

  data.scene.add(cocktail_plate)

}
