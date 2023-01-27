class Controls

    constructor : () ->

        @active = null

        @drag = new DragControls()
        @fly = new FlyControls()
        @zoom = new ZoomControls()

    add : () ->

        if not this.active

            this.active = true

            this.drag.add()
            this.fly.add()
            this.zoom.add()

    remove : () ->

        if this.active

            this.active = false

            this.drag.remove()
            this.fly.remove()
            this.zoom.remove()
