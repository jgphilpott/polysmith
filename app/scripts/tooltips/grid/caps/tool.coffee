class Caps

    constructor: ->

        @active = null

        @centroid = null

        @xMin = null
        @xMax = null

        @yMin = null
        @yMax = null

        @zMin = null
        @zMax = null

    add: (save = false) ->

        if not this.active

            this.active = true

            this.addCentroid save

            this.addX printer.getSizeX(), save
            this.addY printer.getSizeY(), save
            this.addZ printer.getSizeZ(), save

        if save then settings.set "tooltips.grid.caps", true

    remove: (save = false) ->

        if this.active

            this.active = false

            this.removeCentroid save

            this.removeX save
            this.removeY save
            this.removeZ save

        if save then settings.set "tooltips.grid.caps", false

    reset: ->

        defaults = settings.tooltips.defaults().grid.caps

        settings.set "tooltips.grid.caps", defaults

    refresh: ->

        this.remove()
        this.add()

    addCentroid: (save = true) ->

        if settings.get("tooltips.grid.axes.x") or settings.get("tooltips.grid.axes.y") or settings.get("tooltips.grid.axes.z")

            if not this.centroid and settings.get "tooltips.grid.caps"

                this.centroid = new Sphere radius: 1, thetaSegments: 24, phiSegments: 24, position: {x: 0, y: 0, z: 0}, material: "basic", color: blackThree, panel: false

                this.addEvents this.centroid

                scene.add this.centroid

    removeCentroid: (save = true) ->

        if this.centroid

            this.centroid.geometry.dispose()
            this.centroid.material.dispose()

            this.removeEvents this.centroid

            scene.remove this.centroid

            this.centroid = null

    addX: (size = printer.getSizeX(), save = true) ->

        if settings.get "tooltips.grid.axes.x"

            size = adaptor "invert", "length", size

            if not this.xMin and not this.xMax and settings.get "tooltips.grid.caps"

                this.xMin = new Sphere radius: 1, thetaSegments: 24, phiSegments: 24, position: {x: -size / 2, y: 0, z: 0}, material: "basic", color: redThree, panel: false
                this.xMax = new Sphere radius: 1, thetaSegments: 24, phiSegments: 24, position: {x: size / 2, y: 0, z: 0}, material: "basic", color: greenThree, panel: false

                this.addEvents this.xMin; this.addEvents this.xMax

                scene.add this.xMin, this.xMax

    removeX: (save = true) ->

        if this.xMin and this.xMax

            this.xMin.geometry.dispose(); this.xMax.geometry.dispose()
            this.xMin.material.dispose(); this.xMax.material.dispose()

            this.removeEvents this.xMin; this.removeEvents this.xMax

            scene.remove this.xMin, this.xMax

            this.xMin = null; this.xMax = null

    addY: (size = printer.getSizeY(), save = true) ->

        if settings.get "tooltips.grid.axes.y"

            size = adaptor "invert", "length", size

            if not this.yMin and not this.yMax and settings.get "tooltips.grid.caps"

                this.yMin = new Sphere radius: 1, thetaSegments: 24, phiSegments: 24, position: {x: 0, y: -size / 2, z: 0}, material: "basic", color: redThree, panel: false
                this.yMax = new Sphere radius: 1, thetaSegments: 24, phiSegments: 24, position: {x: 0, y: size / 2, z: 0}, material: "basic", color: greenThree, panel: false

                this.addEvents this.yMin; this.addEvents this.yMax

                scene.add this.yMin, this.yMax

    removeY: (save = true) ->

        if this.yMin and this.yMax

            this.yMin.geometry.dispose(); this.yMax.geometry.dispose()
            this.yMin.material.dispose(); this.yMax.material.dispose()

            this.removeEvents this.yMin; this.removeEvents this.yMax

            scene.remove this.yMin, this.yMax

            this.yMin = null; this.yMax = null

    addZ: (size = printer.getSizeZ(), save = true) ->

        if settings.get "tooltips.grid.axes.z"

            size = adaptor "invert", "length", size

            if not this.zMin and not this.zMax and settings.get "tooltips.grid.caps"

                this.zMin = new Sphere radius: 1, thetaSegments: 24, phiSegments: 24, position: {x: 0, y: 0, z: -size / 2}, material: "basic", color: redThree, panel: false
                this.zMax = new Sphere radius: 1, thetaSegments: 24, phiSegments: 24, position: {x: 0, y: 0, z: size / 2}, material: "basic", color: greenThree, panel: false

                this.addEvents this.zMin; this.addEvents this.zMax

                scene.add this.zMin, this.zMax

    removeZ: (save = true) ->

        if this.zMin and this.zMax

            this.zMin.geometry.dispose(); this.zMax.geometry.dispose()
            this.zMin.material.dispose(); this.zMax.material.dispose()

            this.removeEvents this.zMin; this.removeEvents this.zMax

            scene.remove this.zMin, this.zMax

            this.zMin = null; this.zMax = null

    addEvents: (cap) ->

        events.addEventListener cap, "mouseover", (event) =>

            if not events.operation.key

                $("#canvas").css "cursor", "pointer"

        events.addEventListener cap, "mouseout", (event) =>

            if not events.operation.key

                $("#canvas").css "cursor", ""

        events.addEventListener cap, "mousedown", (event) =>

            event.stopPropagation()

        events.addEventListener cap, "mouseup", (event) =>

            event.stopPropagation()

        events.addEventListener cap, "dblclick", (event) =>

            if camera.focus vectorAdaptor "convert", "length", event.target.position

                $("#canvas").css "cursor", ""

        events.addEventListener cap, "contextmenu", (event) =>

            panels.context.add "cap", cap, event.origDomEvent

    removeEvents: (cap) ->

        events.removeEventListener cap, "mouseover"
        events.removeEventListener cap, "mouseout"
        events.removeEventListener cap, "mousedown"
        events.removeEventListener cap, "mouseup"
        events.removeEventListener cap, "dblclick"
        events.removeEventListener cap, "contextmenu"
