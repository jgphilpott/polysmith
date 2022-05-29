// Credit: https://stackoverflow.com/a/64777515/1544937
const chunkArray = (a, n) => [...Array(Math.ceil(a.length / n))].map((_, i) => a.slice(n * i, n + n * i))

function calculatePercent(min, max, value) { return (value - min) / (max - min) * 100 }

function signedVolumeOfTriangle(p1, p2, p3) { return p1.dot(p2.cross(p3)) / 6.0 }

// Credit: https://stackoverflow.com/a/5624139/1544937
function component2hex(component) {

  let hex = component.toString(16)

  return hex.length == 1 ? "0" + hex : hex

}

// Credit: https://stackoverflow.com/a/5624139/1544937
function rgb2hex(r, g, b) {

  return "#" + component2hex(r) + component2hex(g) + component2hex(b)

}

// Credit: https://stackoverflow.com/a/5624139/1544937
function hex2rgb(hex) {

  let result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex)

  return result ? {r: parseInt(result[1], 16), g: parseInt(result[2], 16), b: parseInt(result[3], 16) } : null

}

// Credit: http://gist.github.com/399624
// The click event will be fired with a small delay but will not fire upon a double click.
$.fn.clickSingleDouble = function(single_click_callback, double_click_callback, delay=333) {
  return this.each(function() {
    let clicks = 0, self = this
    jQuery(this).click(function(event) {
      clicks++
      if (clicks == 1) {
        setTimeout(function() {
          if (clicks == 1) {
            single_click_callback.call(self, event)
          } else {
            double_click_callback.call(self, event)
          }
          clicks = 0
        }, delay)
      }
    })
  })
}

// Credit: https://stackoverflow.com/a/57067151/1544937
Array.prototype.filterInPlace = function(condition, item) {

    let i = 0

    this.forEach((element, index) => {

        if (condition.call(item, element, index, this)) {

            if (index !== i) this[i] = element

            i++

        }

    })

    this.length = i

    return this

}

function clearMeshOperation() {

  let operationIcons = $("#mesh.panel img.operation")

  operationIcons.toArray().forEach(icon => {

    if (!$(icon).hasClass("disabled")) $(icon).attr("src", "/app/imgs/panels/ops/default/" + icon.id + ".png")

  })

  $("#canvas").css("cursor", "")

  events.operation.mesh = null
  events.operation.key = null

}

function centerX(boundingBox) { return - boundingBox.min.x - (Math.abs(boundingBox.max.x - boundingBox.min.x) / 2) }
function centerY(boundingBox) { return - boundingBox.min.y - (Math.abs(boundingBox.max.y - boundingBox.min.y) / 2) }
function centerZ(boundingBox) { return - boundingBox.min.z - (Math.abs(boundingBox.max.z - boundingBox.min.z) / 2) }

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

// Credit: https://stackoverflow.com/a/13091694/1544937
function screen2worldCoordinates(x, y, zTarget=0) {

  let vector = new THREE.Vector3()
  let coordinates = new THREE.Vector3()

  vector.set((x / window.innerWidth) * 2 - 1, - (y / window.innerHeight) * 2 + 1, 0)

  vector.unproject(camera)

  vector.sub(camera.position).normalize()

  let distance = (zTarget - camera.position.z) / vector.z

  coordinates.copy(camera.position).add(vector.multiplyScalar(distance))

  return coordinates

}

// Credit: https://stackoverflow.com/a/36706930/1544937
function world2screenCoordinates(x, y, z) {

  let halfWidth = window.innerWidth / 2
  let halfHeight = window.innerHeight / 2

  let coordinates = new THREE.Vector3(x, y, z)

  coordinates.project(camera)

  coordinates.x = (coordinates.x * halfWidth) + halfWidth
  coordinates.y = - (coordinates.y * halfHeight) + halfHeight

  return new THREE.Vector2(coordinates.x, coordinates.y)

}

// Credit: https://stackoverflow.com/a/50937272/1544937
function getSurfaceArea(mesh) {

  let surface = 0
  let geometry = mesh.geometry

  if (geometry.faces && geometry.vertices) {

    for (let i = 0; i < geometry.faces.length; i++) {

      let v1 = geometry.vertices[geometry.faces[i].a]
      let v2 = geometry.vertices[geometry.faces[i].b]
      let v3 = geometry.vertices[geometry.faces[i].c]

      let p1 = new THREE.Vector3(v1.x, v1.y, v1.z)
      let p2 = new THREE.Vector3(v2.x, v2.y, v2.z)
      let p3 = new THREE.Vector3(v3.x, v3.y, v3.z)

      let triangle = new THREE.Triangle(p1, p2, p3)
      let area = triangle.getArea()

      surface += area

    }

  } else if (geometry.attributes.position.array) {

    let faces = chunkArray(geometry.attributes.position.array, 9)

    for (let i = 0; i < faces.length; i++) {

      let vertices = chunkArray(faces[i], 3)

      let v1 = vertices[0]
      let v2 = vertices[1]
      let v3 = vertices[2]

      let p1 = new THREE.Vector3(v1[0], v1[1], v1[2])
      let p2 = new THREE.Vector3(v2[0], v2[1], v2[2])
      let p3 = new THREE.Vector3(v3[0], v3[1], v3[2])

      let triangle = new THREE.Triangle(p1, p2, p3)
      let area = triangle.getArea()

      surface += area

    }

  }

  return surface

}

// Credit: https://discourse.threejs.org/t/volume-of-three-buffergeometry/5109
function getVolume(mesh) {

  let volume = 0
  let geometry = mesh.geometry

  let p1 = new THREE.Vector3()
  let p2 = new THREE.Vector3()
  let p3 = new THREE.Vector3()

  if (!geometry.isBufferGeometry) {

    try {

      geometry = new THREE.BufferGeometry().fromGeometry(geometry)

    } catch (error) {

      console.warn("The 'geometry' must be an indexed or non-indexed buffer geometry.")

      return volume

    }

  }

  let isIndexed = geometry.index !== null
  let position = geometry.attributes.position

  if (!isIndexed) {

    let faces = position.count / 3

    for (let i = 0; i < faces; i++) {

      p1.fromBufferAttribute(position, i * 3 + 0)
      p2.fromBufferAttribute(position, i * 3 + 1)
      p3.fromBufferAttribute(position, i * 3 + 2)

      volume += signedVolumeOfTriangle(p1, p2, p3)

    }

  } else {

    let index = geometry.index
    let faces = index.count / 3

    for (let i = 0; i < faces; i++) {

      p1.fromBufferAttribute(position, index.array[i * 3 + 0])
      p2.fromBufferAttribute(position, index.array[i * 3 + 1])
      p3.fromBufferAttribute(position, index.array[i * 3 + 2])

      volume += signedVolumeOfTriangle(p1, p2, p3)

    }

  }

  return volume

}