line2Geometry = (vertices = [[10, 10, 10], [-10, -10, -10]]) ->

    positions = []

    for vertex in vertices

        positions.push vertex[0], vertex[1], vertex[2]

    return new LineGeometry().setPositions positions

newLine2 = (vertices = [[10, 10, 10], [-10, -10, -10]], material = "thick", color = blackThree, linewidth = 1, dashed = false, dashSize = 3, gapSize = 2) ->

    line = new LineMesh(line2Geometry(vertices), lineMaterial(material, color, linewidth, dashed, dashSize, gapSize)).computeLineDistances()

    line.class = "line2"
    line.name = "Thick Line"

    return line

addLine2 = (vertices = [[10, 10, 10], [-10, -10, -10]], material = "thick", color = blackThree, linewidth = 1, dashed = false, dashSize = 3, gapSize = 2) ->

    return addMesh newLine2 vertices, material, color, linewidth, dashed, dashSize, gapSize
