drawMetabox = (type, object, event) ->

    metabox = $ "#metabox"

    mouse = new THREE.Vector2()
    raycaster = new THREE.Raycaster()

    mouse.x = (event.clientX / window.innerWidth) * 2 - 1
    mouse.y = - (event.clientY / window.innerHeight) * 2 + 1

    raycaster.setFromCamera mouse, camera
    intersects = raycaster.intersectObjects scene.children

    switch type

        when "draw"

            metabox.append "<h4 id='name'>" + object.name + "</h4>"

            metabox.append "<div id='object' class='databox'></div>"
            metabox.append "<div id='event' class='databox'></div>"

            objectBox = metabox.find "#object.databox"
            eventBox = metabox.find "#event.databox"

            objectBox.append "<p class='title'>Object</p>"
            objectBox.append "<p id='type' class='meta'><span class='label'>Type:</span> <span class='value'>" + object.class.replace("-", " ").replace(/\b\w/g, (char) -> return char.toUpperCase()) + "</span></p>"
            objectBox.append "<p id='surface' class='meta'><span class='label'>Surface:</span> <span class='value'>" + format(object.surface, "area", settings.general.unit[settings.general.scale] + "Sq", 2, 0, settings.general.language) + "</span></p>"
            objectBox.append "<p id='volume' class='meta'><span class='label'>Volume:</span> <span class='value'>" + format(object.volume, "volume", settings.general.unit[settings.general.scale] + "Cu", 2, 0, settings.general.language) + "</span></p>"

            eventBox.append "<p class='title'>Event</p>"
            eventBox.append "<p id='x' class='intersection'><span class='label'>X</span> <span class='value'>" + format(intersects[0].point.x, "length", settings.general.unit[settings.general.scale], 2, 0, settings.general.language) + "</span></p>"
            eventBox.append "<p id='y' class='intersection'><span class='label'>Y</span> <span class='value'>" + format(intersects[0].point.y, "length", settings.general.unit[settings.general.scale], 2, 0, settings.general.language) + "</span></p>"
            eventBox.append "<p id='z' class='intersection'><span class='label'>Z</span> <span class='value'>" + format(intersects[0].point.z, "length", settings.general.unit[settings.general.scale], 2, 0, settings.general.language) + "</span></p>"

        when "update"

            xIntersection = metabox.find "#x.intersection span.value"
            yIntersection = metabox.find "#y.intersection span.value"
            zIntersection = metabox.find "#z.intersection span.value"

            xIntersection.text format intersects[0].point.x, "length", settings.general.unit[settings.general.scale], 2, 0, settings.general.language
            yIntersection.text format intersects[0].point.y, "length", settings.general.unit[settings.general.scale], 2, 0, settings.general.language
            zIntersection.text format intersects[0].point.z, "length", settings.general.unit[settings.general.scale], 2, 0, settings.general.language

    return metabox

eraseMetabox = () ->

    metabox = $ "#metabox"

    metabox.find("*").remove()

    return metabox
