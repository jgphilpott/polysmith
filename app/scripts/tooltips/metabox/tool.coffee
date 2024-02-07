class MetaBox

    constructor: ->

        this.add()

        @metabox = $("#metabox")

        @name = this.metabox.find "#name"

        @objectBox = this.metabox.find "#object.databox"
        @eventBox = this.metabox.find "#event.databox"

        @objectType = this.objectBox.find "#type.metadata span.value"
        @objectSurface = this.objectBox.find "#surface.metadata span.value"
        @objectVolume = this.objectBox.find "#volume.metadata span.value"

        @xIntersection = this.eventBox.find "#x.intersection span.value"
        @yIntersection = this.eventBox.find "#y.intersection span.value"
        @zIntersection = this.eventBox.find "#z.intersection span.value"

    add: ->

        template =

            """
            <div id='metabox'>

                <h3 id='name'></h3>

                <div id='object' class='databox'>

                    <h4 class='title'>Object</h4>

                    <p id='type' class='metadata'>

                        <span class='label'>Type:</span> <span class='value'></span>

                    </p>

                    <p id='surface' class='metadata'>

                        <span class='label'>Surface:</span> <span class='value'></span>

                    </p>

                    <p id='volume' class='metadata'>

                        <span class='label'>Volume:</span> <span class='value'></span>

                    </p>

                </div>

                <div id='event' class='databox'>

                    <h4 class='title'>Event</h4>

                    <p id='x' class='intersection'>

                        <span class='label'>X</span> <span class='value'></span>

                    </p>

                    <p id='y' class='intersection'>

                        <span class='label'>Y</span> <span class='value'></span>

                    </p>

                    <p id='z' class='intersection'>

                        <span class='label'>Z</span> <span class='value'></span>

                    </p>

                </div>

            </div>
            """

        $("body").append template

    remove: ->

        this.metabox.remove()

    show: ->

        this.metabox.css "display", "block"

    hide: ->

        this.metabox.css "display", "none"

    update: (mesh, event) ->

        this.show()

        this.name.text mesh.name

        mouse = new THREE.Vector2()
        raycaster = new THREE.Raycaster()

        scale = settings.get "scales.scale"
        areaScale = settings.get "scales.area"
        volumeScale = settings.get "scales.volume"
        lengthScale = settings.get "scales.length"
        language = settings.get "general.language"

        mouse.x = (event.clientX / window.innerWidth) * 2 - 1
        mouse.y = -(event.clientY / window.innerHeight) * 2 + 1

        raycaster.setFromCamera mouse, camera
        intersection = raycaster.intersectObject(mesh)[0].point

        surface = format mesh.geometry.surface, "area", areaScale.unit[scale], areaScale.detail, 0, language
        volume = format mesh.geometry.volume, "volume", volumeScale.unit[scale], volumeScale.detail, 0, language

        xIntersection = format intersection.x, "length", lengthScale.unit[scale], lengthScale.detail, 0, language
        yIntersection = format intersection.y, "length", lengthScale.unit[scale], lengthScale.detail, 0, language
        zIntersection = format intersection.z, "length", lengthScale.unit[scale], lengthScale.detail, 0, language

        this.objectType.text mesh.class.replace("-", " ").titlize()
        this.objectSurface.text if surface then surface else "Unknown"
        this.objectVolume.text if volume then volume else "Unknown"

        this.xIntersection.text if xIntersection then xIntersection else "Unknown"
        this.yIntersection.text if yIntersection then yIntersection else "Unknown"
        this.zIntersection.text if zIntersection then zIntersection else "Unknown"
