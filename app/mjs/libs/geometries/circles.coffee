# Link: https://threejs.org/docs/#api/en/geometries/CircleGeometry

newCircle = (radius = 10, radialSegments = 42, position = [0, 0, 0], material = "normal", color = blackThree) ->

    geometry = new THREE.CircleGeometry radius, radialSegments
    circle = new THREE.Mesh geometry, meshMaterial material, color

    circle.position.set position[0], position[1], position[2]

    circle.class = "circle"
    circle.name = "Circle"

    return circle

addCircle = (radius = 10, radialSegments = 42, position = [0, 0, 0], material = "normal", color = blackThree) ->

    return addMesh newCircle radius, radialSegments, position, material, color
