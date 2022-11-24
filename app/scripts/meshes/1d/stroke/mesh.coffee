newStroke = (vertices = [[10, 10, 10], [-10, -10, -10]], type = "thick", color = blackThree, linewidth = 1, dashed = false, dashSize = 3, gapSize = 2) ->

    geometry = new StrokeGeometry vertices: vertices
    material = new LineMaterial type, color: color, linewidth: linewidth, dashed: dashed, dashSize: dashSize, gapSize: gapSize

    stroke = new LineThickMesh(geometry, material).computeLineDistances()

    stroke.class = "stroke"
    stroke.name = "Stroke"

    return stroke

addStroke = (vertices = [[10, 10, 10], [-10, -10, -10]], type = "thick", color = blackThree, linewidth = 1, dashed = false, dashSize = 3, gapSize = 2) ->

    return addMesh newStroke vertices, type, color, linewidth, dashed, dashSize, gapSize
