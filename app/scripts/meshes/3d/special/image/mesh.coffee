newImage = (file = "image", depth = 3, bevel = false, position = [0, 0, 0], type = "normal", color = blackThree, center = true) ->

    mesh = new THREE.Mesh()

    geometry = new ImageGeometry mesh, file, depth, {bevelEnabled: bevel, center: center}
    material = new MeshMaterial type, color

    mesh.geometry = geometry
    mesh.material = material

    mesh.position.set position[0], position[1], position[2]

    mesh.class = "image"
    mesh.name = "Image"

    return mesh

addImage = (file = "image", depth = 3, bevel = false, position = [0, 0, 0], type = "normal", color = blackThree, center = true) ->

    return addMesh newImage file, depth, bevel, position, type, color, center
