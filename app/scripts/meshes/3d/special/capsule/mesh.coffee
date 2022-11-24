newCapsule = (radius = 5, length = 5, radialSegments = 42, capSegments = 42, position = [0, 0, 0], type = "normal", color = blackThree) ->

    geometry = new CapsuleGeometry radius: radius, length: length, radialSegments: radialSegments, capSegments: capSegments
    material = new MeshMaterial type, color: color

    capsule = new THREE.Mesh geometry, material

    capsule.position.set position[0], position[1], position[2]

    capsule.class = "capsule"
    capsule.name = "Capsule"

    return capsule

addCapsule = (radius = 5, length = 5, radialSegments = 42, capSegments = 42, position = [0, 0, 0], type = "normal", color = blackThree) ->

    return addMesh newCapsule radius, length, radialSegments, capSegments, position, type, color
