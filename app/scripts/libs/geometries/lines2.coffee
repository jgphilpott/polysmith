line2Geometry = (vertices = [[10, 10, 10], [-10, -10, -10]]) ->

    positions = []

    for vertex in vertices

        positions.push vertex[0], vertex[1], vertex[2]

    return new LineGeometry().setPositions positions

newLine2 = (vertices = [[10, 10, 10], [-10, -10, -10]], type = "thick", color = blackThree, linewidth = 1, dashed = false, dashSize = 3, gapSize = 2) ->

    geometry = line2Geometry vertices
    material = new LineMaterial type, color, linewidth, dashed, dashSize, gapSize

    line = new LineMesh(geometry, material).computeLineDistances()

    line.class = "line2"
    line.name = "Thick Line"

    return line

addLine2 = (vertices = [[10, 10, 10], [-10, -10, -10]], type = "thick", color = blackThree, linewidth = 1, dashed = false, dashSize = 3, gapSize = 2) ->

    return addMesh newLine2 vertices, type, color, linewidth, dashed, dashSize, gapSize
