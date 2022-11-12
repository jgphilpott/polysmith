newStroke = (vertices = [[10, 10, 10], [-10, -10, -10]], type = "thick", color = blackThree, linewidth = 1, dashed = false, dashSize = 3, gapSize = 2) ->

    geometry = new StrokeGeometry vertices
    material = new LineMaterial type, color, linewidth, dashed, dashSize, gapSize

    line = new LineThickMesh(geometry, material).computeLineDistances()

    line.class = "line2"
    line.name = "Thick Line"

    return line

addStroke = (vertices = [[10, 10, 10], [-10, -10, -10]], type = "thick", color = blackThree, linewidth = 1, dashed = false, dashSize = 3, gapSize = 2) ->

    return addMesh newStroke vertices, type, color, linewidth, dashed, dashSize, gapSize
