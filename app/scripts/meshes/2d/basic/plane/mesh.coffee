newPlane = (width = 10, height = 10, position = [0, 0, 0], type = "normal", color = blackThree) ->

    geometry = new PlaneGeometry width: width, height: height
    material = new MeshMaterial type, color: color

    plane = new THREE.Mesh geometry, material

    plane.position.set position[0], position[1], position[2]

    plane.class = "plane"
    plane.name = "Plane"

    return plane

addPlane = (width = 10, height = 10, position = [0, 0, 0], type = "normal", color = blackThree) ->

    return addMesh newPlane width, height, position, type, color
