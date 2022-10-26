# Link: https://threejs.org/docs/#api/en/geometries/ExtrudeGeometry

newImage = (image = "image", type = "normal", color = blackThree, center = true, x = 0, y = 0, z = 0, rotateX = 0, rotateY = 0, rotateZ = 0) ->

    shapes = []

    params =

        steps: 3
        depth: 10

        bevelEnabled: false
        bevelThickness: 1
        bevelSize: 1
        bevelOffset: 0
        bevelSegments: 3

    for path in image.paths

        Array.prototype.push.apply shapes, path.toShapes()

    geometry = new THREE.ExtrudeBufferGeometry shapes, params
    material = new MeshMaterial type, color

    if center

        geometry.center()

    imageMesh = new THREE.Mesh geometry, material

    imageMesh.rotateX deg$rad rotateX
    imageMesh.rotateY deg$rad rotateY
    imageMesh.rotateZ deg$rad rotateZ

    imageMesh.position.set x, y, z

    imageMesh.class = "image"
    imageMesh.name = "Image"

    return imageMesh

addImage = (image = "image", type = "normal", color = blackThree, center = true, x = 0, y = 0, z = 0, rotateX = 0, rotateY = 0, rotateZ = 0) ->

    loader = new THREE.SVGLoader()

    loader.load "./app/imgs/icons/shapes/special/" + image + ".svg", (file) ->

        addMesh newImage file, type, color, center, x, y, z, rotateX, rotateY, rotateZ
