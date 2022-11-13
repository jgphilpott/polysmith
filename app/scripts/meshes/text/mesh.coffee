newText = (text = "Text", font = "ubuntu", size = 12, height = 3, bevel = false, position = [0, 0, 0], type = "normal", color = blackThree, center = true) ->

    mesh = new THREE.Mesh()

    geometry = new TextGeometry mesh, text, font, size, height, {bevel: bevel, center: center}
    material = new MeshMaterial type, color

    mesh.geometry = geometry
    mesh.material = material

    mesh.position.set position[0], position[1], position[2]
    mesh.rotation.z = deg$rad 180

    mesh.class = "text"
    mesh.name = "Text"

    return mesh

addText = (text = "Text", font = "ubuntu", size = 12, height = 3, bevel = false, position = [0, 0, 0], type = "normal", color = blackThree, center = true) ->

    return addMesh newText text, font, size, height, bevel, position, type, color, center
