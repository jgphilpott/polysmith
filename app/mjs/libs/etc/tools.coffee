# Credit: https://stackoverflow.com/a/64777515/1544937
chunkArray = (array, size) ->

    return [...Array Math.ceil array.length / size].map (chunk, index) -> array.slice size * index, size + size * index

calculatePercent = (min, max, value) ->

    return ((value - min) / (max - min)) * 100

signedVolumeOfTriangle = (p1, p2, p3) ->

    return p1.dot(p2.cross(p3)) / 6.0

# Credit: https://stackoverflow.com/a/5624139/1544937
component2hex = (component) ->

    hex = component.toString 16

    return if hex.length == 1 then "0" + hex else hex

# Credit: https://stackoverflow.com/a/5624139/1544937
rgb2hex = (red, green, blue) ->

    return "#" + component2hex(red) + component2hex(green) + component2hex(blue)

# Credit: https://stackoverflow.com/a/5624139/1544937
hex2rgb = (hex) ->

    rgb = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec hex

    return r: parseInt(rgb[1], 16), g: parseInt(rgb[2], 16), b: parseInt(rgb[3], 16)

# Credit: http://gist.github.com/399624
# The click event will be fired with a small delay but will not fire upon a double click.
$.fn.clickSingleDouble = (single_click_callback, double_click_callback, delay = 333) ->

    return this.each () ->

        self = this
        clicks = 0

        jQuery(this).click (event) ->

            clicks++

            if clicks == 1

                setTimeout(() ->

                    if clicks == 1

                        single_click_callback.call(self, event)

                    else

                        double_click_callback.call(self, event)

                    clicks = 0

                , delay)

# Credit: https://stackoverflow.com/a/57067151/1544937
Array.prototype.filterInPlace = (condition, item) ->

    i = 0

    for element, index in this

        if condition.call item, element, index, this

            if index != i

                this[i] = element

            i++

    this.length = i

    return this

centerX = (boundingBox) ->

    return - boundingBox.min.x - (Math.abs(boundingBox.max.x - boundingBox.min.x) / 2)

centerY = (boundingBox) ->

    return - boundingBox.min.y - (Math.abs(boundingBox.max.y - boundingBox.min.y) / 2)

centerZ = (boundingBox) ->

    return - boundingBox.min.z - (Math.abs(boundingBox.max.z - boundingBox.min.z) / 2)

getBoundingBox = (mesh) ->

    if not mesh.geometry.boundingBox

        xVertices = []
        yVertices = []
        zVertices = []

        for vertex in mesh.geometry.vertices

            xVertices.push vertex.x
            yVertices.push vertex.y
            zVertices.push vertex.z

        return

            min: x: minValue(xVertices), y: minValue(yVertices), z: minValue(zVertices)
            max: x: maxValue(xVertices), y: maxValue(yVertices), z: maxValue(zVertices)

    else

        return mesh.geometry.boundingBox

clearMeshOperation = () ->

    operationIcons = $ "#mesh.panel img.operation"

    for icon in operationIcons.toArray()

        if not $(icon).hasClass "disabled"

            $(icon).attr "src", "/app/imgs/panels/ops/default/" + icon.id + ".png"

    $("#canvas").css "cursor", ""

    events.operation.mesh = null
    events.operation.key = null

updateMetrics = (mesh) ->

    mesh.updateMatrix()

    panel = $ "#mesh." + mesh.uuid + ""
    controls = panel.find "#meta.controls"

    mesh.volume = if mesh.class != "line" then getVolume(mesh) else 0
    mesh.surface = if mesh.class != "line" then getSurfaceArea(mesh) else 0

    controls.find("#type span").text mesh.class.replace("-", " ").replace(/\b\w/g, (char) -> return char.toUpperCase())
    controls.find("#surface span").text mesh.surface.toFixed 2
    controls.find("#volume span").text mesh.volume.toFixed 2

# Credit: https://stackoverflow.com/a/13091694/1544937
screen2worldCoordinates = (x, y, zTarget = 0) ->

    vector = new THREE.Vector3()
    coordinates = new THREE.Vector3()

    vector.set (x / window.innerWidth) * 2 - 1, - (y / window.innerHeight) * 2 + 1, 0

    vector.unproject camera

    vector.sub(camera.position).normalize()

    distance = (zTarget - camera.position.z) / vector.z

    coordinates.copy(camera.position).add(vector.multiplyScalar distance)

    return coordinates

# Credit: https://stackoverflow.com/a/36706930/1544937
world2screenCoordinates = (x, y, z) ->

    halfWidth = window.innerWidth / 2
    halfHeight = window.innerHeight / 2

    coordinates = new THREE.Vector3 x, y, z

    coordinates.project camera

    coordinates.x = coordinates.x * halfWidth + halfWidth
    coordinates.y = - coordinates.y * halfHeight + halfHeight

    return new THREE.Vector2 coordinates.x, coordinates.y

# Credit: https://stackoverflow.com/a/50937272/1544937
getSurfaceArea = (mesh) ->

    surface = 0
    geometry = mesh.geometry

    if geometry.faces and geometry.vertices

        for face in geometry.faces

            v1 = geometry.vertices[face.a]
            v2 = geometry.vertices[face.b]
            v3 = geometry.vertices[face.c]

            p1 = new THREE.Vector3(v1.x, v1.y, v1.z).applyMatrix4 mesh.matrix
            p2 = new THREE.Vector3(v2.x, v2.y, v2.z).applyMatrix4 mesh.matrix
            p3 = new THREE.Vector3(v3.x, v3.y, v3.z).applyMatrix4 mesh.matrix

            triangle = new THREE.Triangle p1, p2, p3
            area = triangle.getArea()

            surface += area

    else if geometry.attributes.position.array

        faces = chunkArray geometry.attributes.position.array, 9

        for face in faces

            vertices = chunkArray face, 3

            v1 = vertices[0]
            v2 = vertices[1]
            v3 = vertices[2]

            p1 = new THREE.Vector3(v1[0], v1[1], v1[2]).applyMatrix4 mesh.matrix
            p2 = new THREE.Vector3(v2[0], v2[1], v2[2]).applyMatrix4 mesh.matrix
            p3 = new THREE.Vector3(v3[0], v3[1], v3[2]).applyMatrix4 mesh.matrix

            triangle = new THREE.Triangle p1, p2, p3
            area = triangle.getArea()

            surface += area

    mesh.surface = surface

    return surface

# Credit: https://discourse.threejs.org/t/volume-of-three-buffergeometry/5109
getVolume = (mesh) ->

    volume = 0
    position = null
    geometry = mesh.geometry

    p1 = new THREE.Vector3()
    p2 = new THREE.Vector3()
    p3 = new THREE.Vector3()

    if !geometry.isBufferGeometry

        try

            geometry = new THREE.BufferGeometry().fromGeometry geometry

        catch error

            console.warn "The 'geometry' must be an indexed or non-indexed buffer geometry."

            return volume

    position = geometry.attributes.position

    if geometry.index

        index = geometry.index
        faces = index.count / 3

        for face in [0...faces]

            p1.fromBufferAttribute(position, index.array[face * 3 + 0]).applyMatrix4 mesh.matrix
            p2.fromBufferAttribute(position, index.array[face * 3 + 1]).applyMatrix4 mesh.matrix
            p3.fromBufferAttribute(position, index.array[face * 3 + 2]).applyMatrix4 mesh.matrix

            volume += signedVolumeOfTriangle p1, p2, p3

    else

        faces = position.count / 3

        for face in [0...faces]

            p1.fromBufferAttribute(position, face * 3 + 0).applyMatrix4 mesh.matrix
            p2.fromBufferAttribute(position, face * 3 + 1).applyMatrix4 mesh.matrix
            p3.fromBufferAttribute(position, face * 3 + 2).applyMatrix4 mesh.matrix

            volume += signedVolumeOfTriangle p1, p2, p3

    mesh.volume = volume

    return volume
