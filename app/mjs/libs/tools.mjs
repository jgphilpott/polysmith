export function mm2inch(mm) {
  return mm / 25.4
}

export function inch2mm(inch) {
  return inch * 25.4
}

export function degree2radian(degree) {
  return degree * (Math.PI / 180)
}

export function radian2degree(radian) {
  return radian * (180 / Math.PI)
}

export function getBoundingBox(mesh) {

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

export function centerX(boundingBox) {

  return - boundingBox.min.x - (Math.abs(boundingBox.max.x - boundingBox.min.x) / 2)

}

export function centerY(boundingBox) {

  return - boundingBox.min.y - (Math.abs(boundingBox.max.y - boundingBox.min.y) / 2)

}

export function centerZ(boundingBox) {

  return - boundingBox.min.z - (Math.abs(boundingBox.max.z - boundingBox.min.z) / 2)

}
