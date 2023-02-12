# Docs: https://threejs.org/docs/#api/en/cameras/Camera

class Camera

    constructor: (type = settings.get "camera.type") ->

        @position = settings.get "camera.position"
        @target = settings.get "camera.target"
        @near = settings.get "camera.near"
        @far = settings.get "camera.far"
        @fov = settings.get "camera.fov"

        @type = lower type.trim()

        switch this.type

            when "array"

                @camera = new ArrayCamera(); break

            when "cube"

                @camera = new CubeCamera this.near, this.far; break

            when "orthographic"

                @camera = new OrthographicCamera this.near, this.far; break

            when "perspective"

                @camera = new PerspectiveCamera this.near, this.far, this.fov; break

            when "stereo"

                @camera = new StereoCamera(); break

        this.camera.up.set 0, 0, 1
        this.camera.dragged = null

        this.camera.add = this.add
        this.camera.remove = this.remove

        this.camera.getAspect = this.getAspect
        this.camera.setAspect = this.setAspect

        this.camera.getDragged = this.getDragged
        this.camera.setDragged = this.setDragged

        this.camera.getPosition = this.getPosition
        this.camera.setPosition = this.setPosition

        this.camera.getTarget = this.getTarget
        this.camera.setTarget = this.setTarget

        this.camera.getNear = this.getNear
        this.camera.setNear = this.setNear

        this.camera.getFar = this.getFar
        this.camera.setFar = this.setFar

        this.camera.getFOV = this.getFOV
        this.camera.setFOV = this.setFOV

        this.camera.target = this.target
        this.camera.focus = this.focus

        this.camera.setPosition this.position
        this.camera.setTarget this.target

        return this.camera

    add: ->

        scene.add this

        return this

    remove: ->

        scene.remove this

        return this

    getAspect: ->

        return this.aspect

    setAspect: (width = window.innerWidth, height = window.innerHeight) ->

        this.aspect = width / height

        this.updateProjectionMatrix()

    getDragged: ->

        return this.dragged

    setDragged: (dragged) ->

        this.dragged = dragged

    getPosition: ->

        return this.position

    setPosition: (position, save = true) ->

        this.position.x = position.x
        this.position.y = position.y
        this.position.z = position.z

        panel = $("#camera.panel")
        detail = settings.get "scales.length.detail"

        this.lookAt this.target.x, this.target.y, this.target.z

        panel.find("#position-x input").val position.x.toFixed detail
        panel.find("#position-y input").val position.y.toFixed detail
        panel.find("#position-z input").val position.z.toFixed detail

        if save then settings.set "camera.position", this.position

    getTarget: ->

        return this.target

    setTarget: (target, save = true) ->

        this.target.x = target.x
        this.target.y = target.y
        this.target.z = target.z

        panel = $("#camera.panel")
        detail = settings.get "scales.length.detail"

        this.lookAt this.target.x, this.target.y, this.target.z

        panel.find("#target-x input").val target.x.toFixed detail
        panel.find("#target-y input").val target.y.toFixed detail
        panel.find("#target-z input").val target.z.toFixed detail

        if save then settings.set "camera.target", this.target

    getNear: ->

        return this.near

    setNear: (near) ->

        this.near = near

        this.updateProjectionMatrix()

    getFar: ->

        return this.far

    setFar: (far) ->

        this.far = far

        this.updateProjectionMatrix()

    getFOV: ->

        return this.fov

    setFOV: (fov) ->

        this.fov = fov

        this.updateProjectionMatrix()

    focus: (point, duration = 1000, steps = 100) ->

        if this.target.x isnt point.x or this.target.y isnt point.y or this.target.z isnt point.z

            target = clone this.target

            panel = $("#camera.panel")
            detail = settings.get "scales.length.detail"

            stepX = (point.x - target.x) / steps
            stepY = (point.y - target.y) / steps
            stepZ = (point.z - target.z) / steps

            updateCameraTarget = ->

                target.x += stepX
                target.y += stepY
                target.z += stepZ

                camera.lookAt target.x, target.y, target.z

                panel.find("#target-x input").val target.x.toFixed detail
                panel.find("#target-y input").val target.y.toFixed detail
                panel.find("#target-z input").val target.z.toFixed detail

            for step in [0...steps]

                setTimeout updateCameraTarget, duration / steps * step

            settings.set "camera.target", point

            this.target = point

            return true

        else

            return false
