newSphere = (radius = 5, widthSegments = 42, heightSegments = 42, position = [0, 0, 0], type = "normal", color = blackThree) ->

    geometry = new SphereGeometry radius, widthSegments, heightSegments
    material = new MeshMaterial type, color

    sphere = new THREE.Mesh geometry, material

    sphere.position.set position[0], position[1], position[2]
    sphere.rotation.x = deg$rad 90

    sphere.class = "sphere"
    sphere.name = "Sphere"

    return sphere

addSphere = (radius = 5, widthSegments = 42, heightSegments = 42, position = [0, 0, 0], type = "normal", color = blackThree) ->

    return addMesh newSphere radius, widthSegments, heightSegments, position, type, color
