newIcosahedron = (radius = 5, detail = 0, position = [0, 0, 0], type = "normal", color = blackThree) ->

    geometry = new IcosahedronGeometry radius: radius, detail: detail
    material = new MeshMaterial type, color

    icosahedron = new THREE.Mesh geometry, material

    icosahedron.position.set position[0], position[1], position[2]

    icosahedron.class = "icosahedron"
    icosahedron.name = "Icosahedron"

    return icosahedron

addIcosahedron = (radius = 5, detail = 0, position = [0, 0, 0], type = "normal", color = blackThree) ->

    return addMesh newIcosahedron radius, detail, position, type, color
