newTriangle = (v1 = [0, 0, 10 * Math.sqrt(3) / 4], v2 = [0, 5, -10 * Math.sqrt(3) / 4], v3 = [0, -5, -10 * Math.sqrt(3) / 4], material = "normal", color = blackThree) ->

  geometry = new THREE.Geometry()

  geometry.vertices.push new THREE.Vector3 v1[0], v1[1], v1[2]
  geometry.vertices.push new THREE.Vector3 v2[0], v2[1], v2[2]
  geometry.vertices.push new THREE.Vector3 v3[0], v3[1], v3[2]

  geometry.faces.push new THREE.Face3 0, 1, 2

  triangle = new THREE.Mesh new THREE.BufferGeometry().fromGeometry(geometry), meshMaterial(material, color)

  triangle.class = "triangle"
  triangle.name = "Triangle"

  return triangle

addTriangle = (v1 = [0, 0, 10 * Math.sqrt(3) / 4], v2 = [0, 5, -10 * Math.sqrt(3) / 4], v3 = [0, -5, -10 * Math.sqrt(3) / 4], material = "normal", color = blackThree) ->

  return window.addMesh newTriangle v1, v2, v3, material, color
