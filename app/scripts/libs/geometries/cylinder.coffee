# Link: https://threejs.org/docs/#api/en/geometries/CylinderGeometry

newCylinder = (length = 10, positiveRadius = 5, negativeRadius = 5, radialSegments = 42, position = [0, 0, 0], type = "normal", color = blackThree) ->

    geometry = new THREE.CylinderGeometry positiveRadius, negativeRadius, length, radialSegments
    material = new MeshMaterial type, color

    cylinder = new THREE.Mesh geometry, material

    cylinder.position.set position[0], position[1], position[2]
    cylinder.rotation.x = deg$rad 90

    cylinder.class = "cylinder"
    cylinder.name = "Cylinder"

    return cylinder

addCylinder = (length = 10, positiveRadius = 5, negativeRadius = 5, radialSegments = 42, position = [0, 0, 0], type = "normal", color = blackThree) ->

    return addMesh newCylinder length, positiveRadius, negativeRadius, radialSegments, position, type, color
