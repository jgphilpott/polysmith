newKnot = (radius = 10, thickness = 3, radialSegments = 42, tubularSegments = 42, position = [0, 0, 0], type = "normal", color = blackThree) ->

    geometry = new TorusKnotGeometry radius: radius, thickness: thickness, radialSegments: radialSegments, tubularSegments: tubularSegments
    material = new MeshMaterial type, color

    knot = new THREE.Mesh geometry, material

    knot.position.set position[0], position[1], position[2]

    knot.class = "knot"
    knot.name = "Knot"

    return knot

addKnot = (radius = 10, thickness = 3, radialSegments = 42, tubularSegments = 42, position = [0, 0, 0], type = "normal", color = blackThree) ->

    return addMesh newKnot radius, thickness, radialSegments, tubularSegments, position, type, color
