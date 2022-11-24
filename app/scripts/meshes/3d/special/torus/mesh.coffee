newTorus = (radius = 5, thickness = 1, radialSegments = 42, tubularSegments = 42, position = [0, 0, 0], type = "normal", color = blackThree) ->

    geometry = new TorusGeometry radius: radius, thickness: thickness, radialSegments: radialSegments, tubularSegments: tubularSegments
    material = new MeshMaterial type, color: color

    torus = new THREE.Mesh geometry, material

    torus.position.set position[0], position[1], position[2]
    torus.rotation.y = deg$rad 90

    torus.class = "torus"
    torus.name = "Torus"

    return torus

addTorus = (radius = 5, thickness = 1, radialSegments = 42, tubularSegments = 42, position = [0, 0, 0], type = "normal", color = blackThree) ->

    return addMesh newTorus radius, thickness, radialSegments, tubularSegments, position, type, color
