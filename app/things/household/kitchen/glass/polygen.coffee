polygen = (height = 150, topRadius = 40, bottomRadius = 30, thickness = 2, segments = 10) ->

    glassInterior = newCylinder height, topRadius, bottomRadius, segments, [0, 0, 0]
    glassExterior = newCylinder height, topRadius + thickness, bottomRadius + thickness, segments, [0, 0, - thickness]

    glass = cut glassExterior, glassInterior

    glass.rotation.x = deg$rad 90

    addMesh glass