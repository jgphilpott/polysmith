# Link: https://threejs.org/docs/#api/en/objects/Line

lineGeometry = (vertices = [[10, 10, 10], [-10, -10, -10]]) ->

  geometry = new THREE.Geometry()

  for vertex in vertices

    geometry.vertices.push new THREE.Vector3 vertex[0], vertex[1], vertex[2]

  return geometry

newLine = (vertices = [[10, 10, 10], [-10, -10, -10]], material = "basic", color = blackThree, linewidth = 1, dashed = false, dashSize = 3, gapSize = 2) ->

  line = new THREE.Line(lineGeometry(vertices), lineMaterial(material, color, linewidth, dashed, dashSize, gapSize)).computeLineDistances()

  line.class = "line"
  line.name = "Line"

  return line

addLine = (vertices = [[10, 10, 10], [-10, -10, -10]], material = "basic", color = blackThree, linewidth = 1, dashed = false, dashSize = 3, gapSize = 2) ->

  return window.addMesh newLine vertices, material, color, linewidth, dashed, dashSize, gapSize
