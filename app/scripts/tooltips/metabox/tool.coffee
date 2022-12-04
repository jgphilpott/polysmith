class Metabox

    constructor : () ->

        @box = $("#metabox")

    draw : (type, object, event) ->

        mouse = new THREE.Vector2()
        raycaster = new THREE.Raycaster()

        mouse.x = (event.clientX / window.innerWidth) * 2 - 1
        mouse.y = - (event.clientY / window.innerHeight) * 2 + 1

        raycaster.setFromCamera mouse, camera
        intersects = raycaster.intersectObjects scene.children

        unit = settings.getSetting "general", "unit"
        scale = settings.getSetting "general", "scale"
        language = settings.getSetting "general", "language"

        switch type

            when "draw"

                this.box.append "<h4 id='name'>" + object.name + "</h4>"

                this.box.append "<div id='object' class='databox'></div>"
                this.box.append "<div id='event' class='databox'></div>"

                objectBox = this.box.find "#object.databox"
                eventBox = this.box.find "#event.databox"

                objectBox.append "<p class='title'>Object</p>"
                objectBox.append "<p id='type' class='meta'><span class='label'>Type:</span> <span class='value'>" + object.class.replace("-", " ").replace(/\b\w/g, (char) -> return char.toUpperCase()) + "</span></p>"
                objectBox.append "<p id='surface' class='meta'><span class='label'>Surface:</span> <span class='value'>" + format(object.geometry.surface, "area", unit[scale] + "Sq", 2, 0, language) + "</span></p>"
                objectBox.append "<p id='volume' class='meta'><span class='label'>Volume:</span> <span class='value'>" + format(object.geometry.volume, "volume", unit[scale] + "Cu", 2, 0, language) + "</span></p>"

                eventBox.append "<p class='title'>Event</p>"
                eventBox.append "<p id='x' class='intersection'><span class='label'>X</span> <span class='value'>" + format(intersects[0].point.x, "length", unit[scale], 2, 0, language) + "</span></p>"
                eventBox.append "<p id='y' class='intersection'><span class='label'>Y</span> <span class='value'>" + format(intersects[0].point.y, "length", unit[scale], 2, 0, language) + "</span></p>"
                eventBox.append "<p id='z' class='intersection'><span class='label'>Z</span> <span class='value'>" + format(intersects[0].point.z, "length", unit[scale], 2, 0, language) + "</span></p>"

            when "update"

                xIntersection = this.box.find "#x.intersection span.value"
                yIntersection = this.box.find "#y.intersection span.value"
                zIntersection = this.box.find "#z.intersection span.value"

                xIntersection.text format intersects[0].point.x, "length", unit[scale], 2, 0, language
                yIntersection.text format intersects[0].point.y, "length", unit[scale], 2, 0, language
                zIntersection.text format intersects[0].point.z, "length", unit[scale], 2, 0, language

        return this.box

    erase : () ->

        this.box.find("*").remove()

        return this.box
