newDodecahedron = (radius = 5, detail = 0, position = [0, 0, 0], type = "normal", color = blackThree) ->

    geometry = new DodecahedronGeometry radius, detail
    material = new MeshMaterial type, color

    dodecahedron = new THREE.Mesh geometry, material

    dodecahedron.position.set position[0], position[1], position[2]

    dodecahedron.class = "dodecahedron"
    dodecahedron.name = "Dodecahedron"

    return dodecahedron

addDodecahedron = (radius = 5, detail = 0, position = [0, 0, 0], type = "normal", color = blackThree) ->

    return addMesh newDodecahedron radius, detail, position, type, color
