polygen = (degree = 10, size = 50) ->

    data.title = "Overhang Test (" + degree + "° Steps)"

    steps = (90 / degree) - 1

    thickness = 5

    base = newBox size, size, thickness, [ - (size / 2), 0, - (thickness / 2)]

    archExterior = newCylinder(size, size, size, (steps + 1) * 4).rotateY(deg$rad(45 / (steps + 1)))
    archInterior = newCylinder(size + 1, size - thickness, size - thickness, (steps + 1) * 4).rotateY(deg$rad(45 / (steps + 1)))

    archXcleanup = newBox size * 4, size * 4, size * 4, [size * 2, 0, 0]
    archZcleanup = newBox size * 4, size * 4, size * 4, [0, 0, - (size * 2)]

    arch = cut archExterior, archInterior
    arch = cut cut(arch, archXcleanup), archZcleanup

    data.scene.add join(arch, base)