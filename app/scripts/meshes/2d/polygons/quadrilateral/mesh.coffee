newQuadrilateral = (vertices = [[0, 5, 5], [0, -5, 5], [0, -5, -5], [0, 5, -5]], position = [0, 0, 0], type = "normal", color = blackThree) ->

    geometry = new QuadrilateralGeometry vertices: vertices
    material = new MeshMaterial type, color: color

    quadrilateral = new THREE.Mesh geometry, material

    quadrilateral.position.set position[0], position[1], position[2]

    quadrilateral.class = "quadrilateral"
    quadrilateral.name = "Quadrilateral"

    return quadrilateral

addQuadrilateral = (vertices = [[0, 5, 5], [0, -5, 5], [0, -5, -5], [0, 5, -5]], position = [0, 0, 0], type = "normal", color = blackThree) ->

    return addMesh newQuadrilateral vertices, position, type, color
