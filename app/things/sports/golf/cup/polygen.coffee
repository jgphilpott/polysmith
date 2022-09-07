polygen = () ->

    cup = null

    radius = 54
    depth = 152.4
    thickness = 2.5
    flagstick = 15

    cupExterior = newCylinder depth, radius, radius, 256
    cupInterior = newCylinder depth, radius - thickness, radius - thickness, 256

    baseTop = newCylinder radius / 2, 0, radius, 64, [0, 0, depth / 4]
    baseBottom = newCylinder radius / 2, 0, radius, 64, [0, 0, depth / 4 - thickness]
    baseSupport = newCylinder thickness, radius, radius, 64, [0, 0, (depth / 4 ) - (radius / 4)]
    baseSupport = cut baseSupport, baseBottom

    flagstickExterior = newCylinder radius / 2, flagstick + thickness, flagstick + thickness, 64, [0, 0, depth / 3]
    flagstickInterior = newCylinder radius / 2, flagstick, flagstick, 64, [0, 0,  depth / 3]

    flagstickExterior = cut flagstickExterior, flagstickInterior
    flagstickExterior = cut flagstickExterior, baseTop
    baseTop = cut baseTop, flagstickInterior
    base = cut baseTop, baseBottom

    holeCutterHalf = newBox radius * 2, radius * 2, radius * 2, [radius, 0, 0]
    holeCutterExterior = newCylinder radius / 2, radius - thickness - 7, radius - thickness - 7, 64, [0, 0, depth / 4]
    holeCutterInterior = newCylinder radius / 2, flagstick + thickness + 7, flagstick + thickness + 7, 64, [0, 0, depth / 4]
    holeCutter = cut holeCutterExterior, holeCutterInterior

    wall = newBox radius - thickness, thickness, radius / 2, [- radius / 2, 0, depth / 4]
    support = newCylinder radius / 2, thickness, thickness, 64, [- (radius + flagstick) / 2, 0, depth / 4]
    wallSupport = cut cut(join(wall, support), baseBottom), flagstickInterior

    flagstickExterior = join flagstickExterior, wallSupport
    flagstickExterior.rotateY deg$rad 120
    flagstickExterior = join flagstickExterior, wallSupport
    flagstickExterior.rotateY deg$rad 120
    flagstickExterior = join flagstickExterior, wallSupport

    holeCutter = cut holeCutter, holeCutterHalf
    holeCutter.rotateY deg$rad 120
    holeCutter = cut holeCutter, holeCutterHalf

    base = cut base, holeCutter
    holeCutter.rotateY deg$rad 120
    base = cut base, holeCutter
    holeCutter.rotateY deg$rad 120
    base = cut base, holeCutter

    cup = cut cupExterior, cupInterior

    addMesh flagstickExterior
    addMesh baseSupport
    addMesh base
    addMesh cup