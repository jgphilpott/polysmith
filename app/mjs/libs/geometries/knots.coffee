# Link: https://threejs.org/docs/#api/en/geometries/TorusKnotGeometry

newKnot = (size = 10, thickness = 3, radialSegments = 42, tubularSegments = 42, position = [0, 0, 0], material = "normal", color = blackThree) ->

    geometry = new THREE.TorusKnotGeometry size, thickness, tubularSegments, radialSegments
    knot = new THREE.Mesh geometry, meshMaterial material, color

    knot.position.set position[0], position[1], position[2]

    knot.class = "knot"
    knot.name = "Knot"

    return knot

addKnot = (size = 10, thickness = 3, radialSegments = 42, tubularSegments = 42, position = [0, 0, 0], material = "normal", color = blackThree) ->

    return window.addMesh newKnot size, thickness, radialSegments, tubularSegments, position, material, color
