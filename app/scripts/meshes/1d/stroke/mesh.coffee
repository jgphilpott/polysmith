newStroke = (vertices = [[10, 10, 10], [-10, -10, -10]], type = "thick", color = blackThree, thickness = 1, dashed = false, dashSize = 3, gapSize = 2) ->

    geometry = new StrokeGeometry vertices
    material = new LineMaterial type, color, thickness, dashed, dashSize, gapSize

    stroke = new LineThickMesh(geometry, material).computeLineDistances()

    stroke.class = "stroke"
    stroke.name = "Stroke"

    return stroke

addStroke = (vertices = [[10, 10, 10], [-10, -10, -10]], type = "thick", color = blackThree, thickness = 1, dashed = false, dashSize = 3, gapSize = 2) ->

    return addMesh newStroke vertices, type, color, thickness, dashed, dashSize, gapSize
