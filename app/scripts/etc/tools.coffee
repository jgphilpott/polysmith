clone = (object) ->

    return JSON.parse JSON.stringify object

equal = (object1, object2) ->

    return JSON.stringify(object1) is JSON.stringify(object2)

calculatePercent = (min, max, value) ->

    return ((value - min) / (max - min)) * 100

signedVolumeOfTriangle = (p1, p2, p3) ->

    return p1.dot(p2.cross(p3)) / 6.0

getCenterPoint = (start, stop) ->

    return

        x: (stop.x - start.x) / 2 + start.x
        y: (stop.y - start.y) / 2 + start.y
        z: (stop.z - start.z) / 2 + start.z

# Credit: https://stackoverflow.com/a/17411276/1544937
circumpoint = (angle, radius) ->

    radians = deg$rad angle

    sin = Math.sin radians
    cos = Math.cos radians

    return [sin * radius, cos * radius]

# Credit: https://stackoverflow.com/a/5624139/1544937
component2hex = (component) ->

    hex = component.toString 16

    return if hex.length is 1 then "0" + hex else hex

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

            if clicks is 1

                setTimeout(() ->

                    if clicks is 1

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

            if index isnt i

                this[i] = element

            i++

    this.length = i

    return this

serializeMesh = (mesh) ->

    mesh.updateMatrix()
    meshJSON = mesh.toJSON()

    meshJSON.metadata.name = mesh.name
    meshJSON.metadata.lock = mesh.lock
    meshJSON.metadata.class = mesh.class
    meshJSON.metadata.style = mesh.material.style
    meshJSON.metadata.wireframe = mesh.material.wireframe

    return meshJSON

deserializeMesh = (meshJSON) ->

    loader = new THREE.ObjectLoader()

    mesh = loader.parse meshJSON

    mesh.name = meshJSON.metadata.name
    mesh.lock = meshJSON.metadata.lock
    mesh.class = meshJSON.metadata.class
    mesh.material.style = meshJSON.metadata.style
    mesh.material.wireframe = meshJSON.metadata.wireframe

    mesh.geometry = new Geometry "refresh", geometry: mesh.geometry

    return mesh
