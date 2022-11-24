newCircle = (radius = 10, radialSegments = 42, position = [0, 0, 0], type = "normal", color = blackThree) ->

    geometry = new CircleGeometry radius: radius, radialSegments: radialSegments
    material = new MeshMaterial type, color: color

    circle = new THREE.Mesh geometry, material

    circle.position.set position[0], position[1], position[2]

    circle.class = "circle"
    circle.name = "Circle"

    return circle

addCircle = (radius = 10, radialSegments = 42, position = [0, 0, 0], type = "normal", color = blackThree) ->

    return addMesh newCircle radius, radialSegments, position, type, color
