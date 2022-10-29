newQuadrilateral = (v1 = [0, 5, 5], v2 = [0, 5, -5], v3 = [0, -5, -5], v4 = [0, -5, 5], type = "normal", color = blackThree) ->

    geometry = new THREE.Geometry()

    geometry.vertices.push new THREE.Vector3 v1[0], v1[1], v1[2]
    geometry.vertices.push new THREE.Vector3 v2[0], v2[1], v2[2]
    geometry.vertices.push new THREE.Vector3 v3[0], v3[1], v3[2]
    geometry.vertices.push new THREE.Vector3 v4[0], v4[1], v4[2]

    geometry.faces.push new THREE.Face3 0, 1, 2
    geometry.faces.push new THREE.Face3 2, 3, 0

    geometry = new THREE.BufferGeometry().fromGeometry geometry
    material = new MeshMaterial type, color

    quadrilateral = new THREE.Mesh geometry, material

    quadrilateral.class = "quadrilateral"
    quadrilateral.name = "Quadrilateral"

    return quadrilateral

addQuadrilateral = (v1 = [0, 5, 5], v2 = [0, 5, -5], v3 = [0, -5, -5], v4 = [0, -5, 5], type = "normal", color = blackThree) ->

    return addMesh newQuadrilateral v1, v2, v3, v4, type, color
