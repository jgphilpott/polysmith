newTriangle = (vertices = [[0, 0, 10 * Math.sqrt(3) / 4], [0, -5, -10 * Math.sqrt(3) / 4], [0, 5, -10 * Math.sqrt(3) / 4]], position = [0, 0, 0], type = "normal", color = blackThree) ->

    geometry = new TriangleGeometry vertices: vertices
    material = new MeshMaterial type, color

    triangle = new THREE.Mesh geometry, material

    triangle.position.set position[0], position[1], position[2]

    triangle.class = "triangle"
    triangle.name = "Triangle"

    return triangle

addTriangle = (vertices = [[0, 0, 10 * Math.sqrt(3) / 4], [0, -5, -10 * Math.sqrt(3) / 4], [0, 5, -10 * Math.sqrt(3) / 4]], position = [0, 0, 0], type = "normal", color = blackThree) ->

    return addMesh newTriangle vertices, position, type, color
