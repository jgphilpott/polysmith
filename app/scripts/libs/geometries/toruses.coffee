# Link: https://threejs.org/docs/#api/en/geometries/TorusGeometry

newTorus = (radius = 5, thickness = 1, radialSegments = 42, tubularSegments = 42, position = [0, 0, 0], material = "normal", color = blackThree) ->

    geometry = new THREE.TorusGeometry radius, thickness, radialSegments, tubularSegments
    torus = new THREE.Mesh geometry, meshMaterial material, color

    torus.position.set position[0], position[1], position[2]
    torus.rotation.y = d$rad 90

    torus.class = "torus"
    torus.name = "Torus"

    return torus

addTorus = (radius = 5, thickness = 1, radialSegments = 42, tubularSegments = 42, position = [0, 0, 0], material = "normal", color = blackThree) ->

    return addMesh newTorus radius, thickness, radialSegments, tubularSegments, position, material, color
