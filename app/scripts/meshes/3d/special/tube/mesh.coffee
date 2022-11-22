newTube = (vertices = [[10, 10, 10], [-10, -10, -10]], radius = 1, radialSegments = 42, tubularSegments = 42, closed = false, type = "normal", color = blackThree) ->

    geometry = new TubeGeometry vertices: vertices, radius: radius, radialSegments: radialSegments, tubularSegments: tubularSegments, closed: closed
    material = new MeshMaterial type, color

    tube = new THREE.Mesh geometry, material

    tube.class = "tube"
    tube.name = "Tube"

    return tube

addTube = (vertices = [[10, 10, 10], [-10, -10, -10]], radius = 1, radialSegments = 42, tubularSegments = 42, closed = false, type = "normal", color = blackThree) ->

    return addMesh newTube vertices, radius, radialSegments, tubularSegments, closed, type, color
