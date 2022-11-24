newBox = (length = 10, width = 10, height = 10, position = [0, 0, 0], type = "normal", color = blackThree) ->

    geometry = new BoxGeometry length: length, width: width, height: height
    material = new MeshMaterial type, color: color

    box = new THREE.Mesh geometry, material

    box.position.set position[0], position[1], position[2]

    box.class = "box"
    box.name = "Box"

    return box

addBox = (length = 10, width = 10, height = 10, position = [0, 0, 0], type = "normal", color = blackThree) ->

    return addMesh newBox length, width, height, position, type, color
