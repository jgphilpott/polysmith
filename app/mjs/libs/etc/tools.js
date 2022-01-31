function minValue(values=[]) {
  return Math.min.apply(null, values)
}

function maxValue(values=[]) {
  return Math.max.apply(null, values)
}

function absMinValue(values=[]) {
  return Math.min.apply(null, values.map(Math.abs))
}

function absMaxValue(values=[]) {
  return Math.max.apply(null, values.map(Math.abs))
}

function mm2inch(mm) {
  return mm / 25.4
}

function inch2mm(inch) {
  return inch * 25.4
}

function degree2radian(degree) {
  return degree * (Math.PI / 180)
}

function radian2degree(radian) {
  return radian * (180 / Math.PI)
}

function getBoundingBox(mesh) {

  if (!mesh.geometry.boundingBox) {

    let xVertices = []
    let yVertices = []
    let zVertices = []

    for (let i = 0; i < mesh.geometry.vertices.length; i++) {

      xVertices.push(mesh.geometry.vertices[i].x)
      yVertices.push(mesh.geometry.vertices[i].y)
      zVertices.push(mesh.geometry.vertices[i].z)

    }

    return {

      "min": {"x": minValue(xVertices), "y": minValue(yVertices), "z": minValue(zVertices)},
      "max": {"x": maxValue(xVertices), "y": maxValue(yVertices), "z": maxValue(zVertices)}

    }

  } else {

    return mesh.geometry.boundingBox

  }

}

function centerX(boundingBox) {
  return - boundingBox.min.x - (Math.abs(boundingBox.max.x - boundingBox.min.x) / 2)
}

function centerY(boundingBox) {
  return - boundingBox.min.y - (Math.abs(boundingBox.max.y - boundingBox.min.y) / 2)
}

function centerZ(boundingBox) {
  return - boundingBox.min.z - (Math.abs(boundingBox.max.z - boundingBox.min.z) / 2)
}

function surfaceArea(mesh) {

  let surface = 0

  for (let i = 0; i < mesh.geometry.faces.length; i++) {

    let v1 = mesh.geometry.vertices[mesh.geometry.faces[i].a]
    let v2 = mesh.geometry.vertices[mesh.geometry.faces[i].b]
    let v3 = mesh.geometry.vertices[mesh.geometry.faces[i].c]

    let p1 = new THREE.Vector3(v1.x, v1.y, v1.z)
    let p2 = new THREE.Vector3(v2.x, v2.y, v2.z)
    let p3 = new THREE.Vector3(v3.x, v3.y, v3.z)

    let triangle = new THREE.Triangle(p1, p2, p3)

    let area = triangle.getArea()

    surface += area

  }

  return surface

}
