# Link: https://threejs.org/docs/#api/en/cameras/Camera

class Camera

    constructor : (type = "perspective") ->

        @type = lower type.trim()

        @position = settings.getSetting "camera", "position"
        @target = settings.getSetting "camera", "target"

        switch this.type

            when "array"

                @camera = new ArrayCamera(); break

            when "cube"

                @camera = new CubeCamera(); break

            when "orthographic"

                @camera = new OrthographicCamera(); break

            when "perspective"

                @camera = new PerspectiveCamera(); break

            when "stereo"

                @camera = new StereoCamera(); break

        this.camera.up.set 0, 0, 1
        this.camera.dragged = null

        this.camera.add = this.add
        this.camera.remove = this.remove

        this.camera.getDragged = this.getDragged
        this.camera.setDragged = this.setDragged

        this.camera.getAspect = this.getAspect
        this.camera.setAspect = this.setAspect

        this.camera.getPosition = this.getPosition
        this.camera.setPosition = this.setPosition

        this.camera.getTarget = this.getTarget
        this.camera.setTarget = this.setTarget

        this.camera.target = this.target
        this.camera.focus = this.focus

        this.camera.setPosition this.position
        this.camera.setTarget this.target

        return this.camera

    add : () ->

        scene.add this

        return this

    remove : () ->

        scene.remove this

        return this

    getDragged : () ->

        return this.dragged

    setDragged : (dragged) ->

        this.dragged = dragged

    getAspect : () ->

        return this.aspect

    setAspect : (width = window.innerWidth, height = window.innerHeight) ->

        this.aspect = width / height

        this.updateProjectionMatrix()

    getPosition : () ->

        return this.position

    setPosition : (position, updateSettings = true) ->

        panel = $("#camera.panel")

        this.position.x = position.x
        this.position.y = position.y
        this.position.z = position.z

        if updateSettings

            settings.setSetting "camera", "position", position

        this.lookAt this.target.x, this.target.y, this.target.z

        panel.find("#position-x input").val position.x.toFixed 2
        panel.find("#position-y input").val position.y.toFixed 2
        panel.find("#position-z input").val position.z.toFixed 2

    getTarget : () ->

        return this.target

    setTarget : (target, updateSettings = true) ->

        panel = $("#camera.panel")

        this.target.x = target.x
        this.target.y = target.y
        this.target.z = target.z

        if updateSettings

            settings.setSetting "camera", "target", target

        this.lookAt this.target.x, this.target.y, this.target.z

        panel.find("#target-x input").val target.x.toFixed 2
        panel.find("#target-y input").val target.y.toFixed 2
        panel.find("#target-z input").val target.z.toFixed 2

    focus : (point, duration = 1000, steps = 100) ->

        if this.target.x != point.x or this.target.y != point.y or this.target.z != point.z

            point = clone point
            target = clone this.target

            panel = $("#camera.panel")

            stepX = (point.x - target.x) / steps
            stepY = (point.y - target.y) / steps
            stepZ = (point.z - target.z) / steps

            updateCameraTarget = () ->

                target.x += stepX
                target.y += stepY
                target.z += stepZ

                camera.lookAt target.x, target.y, target.z

                panel.find("#target-x input").val target.x.toFixed 2
                panel.find("#target-y input").val target.y.toFixed 2
                panel.find("#target-z input").val target.z.toFixed 2

            for step in [0...steps]

                setTimeout updateCameraTarget, duration / steps * step

            settings.setSetting "camera", "target", point

            this.target = point

            return true

        else

            return false
