# Link: https://threejs.org/docs/#api/en/geometries/PlaneGeometry

newPlane = (width = 10, height = 10, position = [0, 0, 0], material = "normal", color = blackThree) ->

    geometry = new THREE.PlaneGeometry width, height
    plane = new THREE.Mesh geometry, meshMaterial material, color

    plane.position.set position[0], position[1], position[2]

    plane.class = "plane"
    plane.name = "Plane"

    return plane

addPlane = (width = 10, height = 10, position = [0, 0, 0], material = "normal", color = blackThree) ->

    return window.addMesh newPlane width, height, position, material, color
