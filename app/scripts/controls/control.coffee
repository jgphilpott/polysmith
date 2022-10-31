class Controls

    constructor : () ->

        @dragControls = new DragControls()
        @flyControls = new FlyControls()
        @zoomControls = new ZoomControls()

    add : () ->

        this.addDragControls()
        this.addFlyControls()
        this.addZoomControls()

    remove : () ->

        this.removeDragControls()
        this.removeFlyControls()
        this.removeZoomControls()

    addDragControls : () ->

        this.dragControls.add()

    removeDragControls : () ->

        this.dragControls.remove()

    addFlyControls : () ->

        this.flyControls.add()

    removeFlyControls : () ->

        this.flyControls.remove()

    addZoomControls : () ->

        this.zoomControls.add()

    removeZoomControls : () ->

        this.zoomControls.remove()
