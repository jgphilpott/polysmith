newOctahedron = (radius = 5, detail = 0, position = [0, 0, 0], type = "normal", color = blackThree) ->

    geometry = new OctahedronGeometry radius, detail
    material = new MeshMaterial type, color

    octahedron = new THREE.Mesh geometry, material

    octahedron.position.set position[0], position[1], position[2]

    octahedron.class = "octahedron"
    octahedron.name = "Octahedron"

    return octahedron

addOctahedron = (radius = 5, detail = 0, position = [0, 0, 0], type = "normal", color = blackThree) ->

    return addMesh newOctahedron radius, detail, position, type, color
