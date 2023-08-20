log = console.log
info = console.info
warn = console.warn
error = console.error

console.log = -> null
console.info = -> null
console.warn = -> null
console.error = -> null

clone = (object) -> _.clone object
omit = (object, keys) -> _.omit object, keys
equal = (object1, object2) -> _.isEqual object1, object2

sleep = (time) ->

    new Promise (resolve) ->

        window.setTimeout resolve, time

getCenterPoint = (point1, point2) ->

    x: (point2.x - point1.x) / 2 + point1.x
    y: (point2.y - point1.y) / 2 + point1.y
    z: (point2.z - point1.z) / 2 + point1.z

calculatePercent = (min, max, value) ->

    ((value - min) / (max - min)) * 100

signedVolumeOfTriangle = (p1, p2, p3) ->

    p1.dot(p2.cross(p3)) / 6

interpreter = (type, category, value) ->

    unit = settings.get "scales." + category + ".unit"
    defaultUnit = settings.scales.defaults()[category].unit

    if type is "convert" then return convert[category][defaultUnit][unit] value
    if type is "invert" then return convert[category][unit][defaultUnit] value

vectorInterpreter = (type, category, vector) ->

    vector.x = interpreter type, category, vector.x
    vector.y = interpreter type, category, vector.y
    vector.z = interpreter type, category, vector.z

    return vector

adaptor = (type, category, value) ->

    scale = settings.get "general.scale"
    unit = settings.get "scales." + category + ".unit"

    defaultScale = settings.general.defaults().scale
    defaultUnit = settings.scales.defaults()[category].unit

    if type is "convert" then return convert[category][defaultUnit[defaultScale]][unit[scale]] value
    if type is "invert" then return convert[category][unit[scale]][defaultUnit[defaultScale]] value

vectorAdaptor = (type, category, vector) ->

    vector.x = adaptor type, category, vector.x
    vector.y = adaptor type, category, vector.y
    vector.z = adaptor type, category, vector.z

    return vector

# Credit: https://stackoverflow.com/a/17411276/1544937
circumpoint = (angle, radius) ->

    radians = deg$rad angle

    sin = Math.sin radians
    cos = Math.cos radians

    return [sin * radius, cos * radius]

# Credit: https://stackoverflow.com/a/5624139/1544937
component$hex = (component) ->

    hex = component.toString 16

    return if hex.length is 1 then "0" + hex else hex

# Credit: https://stackoverflow.com/a/5624139/1544937
rgb$hex = (red, green, blue) ->

    return "#" + component$hex(red) + component$hex(green) + component$hex(blue)

# Credit: https://stackoverflow.com/a/5624139/1544937
hex$rgb = (hex) ->

    rgb = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec hex

    return r: parseInt(rgb[1], 16), g: parseInt(rgb[2], 16), b: parseInt(rgb[3], 16)
