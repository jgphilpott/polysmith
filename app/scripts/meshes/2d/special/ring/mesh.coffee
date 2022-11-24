newRing = (innerRadius = 5, outerRadius = 10, radialSegments = 42, position = [0, 0, 0], type = "normal", color = blackThree) ->

    geometry = new RingGeometry innerRadius: innerRadius, outerRadius: outerRadius, radialSegments: radialSegments
    material = new MeshMaterial type, color: color

    ring = new THREE.Mesh geometry, material

    ring.position.set position[0], position[1], position[2]

    ring.class = "ring"
    ring.name = "Ring"

    return ring

addRing = (innerRadius = 5, outerRadius = 10, radialSegments = 42, position = [0, 0, 0], type = "normal", color = blackThree) ->

    return addMesh newRing innerRadius, outerRadius, radialSegments, position, type, color
