# Docs: https://threejs.org/docs/#api/en/cameras/Camera

class Camera

    constructor: (type = settings.get "camera.type") ->

        @position = settings.get "camera.position"
        @target = settings.get "camera.target"
        @near = settings.get "camera.near"
        @far = settings.get "camera.far"
        @fov = settings.get "camera.fov"

        position = vectorAdaptor "convert", "length", this.position
        target = vectorAdaptor "convert", "length", this.target
        near = adaptor "convert", "length", this.near
        far = adaptor "convert", "length", this.far
        fov = interpreter "convert", "angle", this.fov

        switch lower type

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

        this.camera.add = this.add
        this.camera.remove = this.remove

        this.camera.getAspect = this.getAspect
        this.camera.setAspect = this.setAspect

        this.camera.getPosition = this.getPosition
        this.camera.setPosition = this.setPosition

        this.camera.getPositionX = this.getPositionX
        this.camera.setPositionX = this.setPositionX

        this.camera.getPositionY = this.getPositionY
        this.camera.setPositionY = this.setPositionY

        this.camera.getPositionZ = this.getPositionZ
        this.camera.setPositionZ = this.setPositionZ

        this.camera.getTarget = this.getTarget
        this.camera.setTarget = this.setTarget

        this.camera.getTargetX = this.getTargetX
        this.camera.setTargetX = this.setTargetX

        this.camera.getTargetY = this.getTargetY
        this.camera.setTargetY = this.setTargetY

        this.camera.getTargetZ = this.getTargetZ
        this.camera.setTargetZ = this.setTargetZ

        this.camera.getNear = this.getNear
        this.camera.setNear = this.setNear

        this.camera.getFar = this.getFar
        this.camera.setFar = this.setFar

        this.camera.getFOV = this.getFOV
        this.camera.setFOV = this.setFOV

        this.camera.target = this.target
        this.camera.focus = this.focus

        this.camera.reset = this.reset

        this.camera.setPosition position
        this.camera.setTarget target

        return this.camera

    add: ->

        scene.add this

        return this

    remove: ->

        scene.remove this

        return this

    getAspect: ->

        return clone this.aspect

    setAspect: (width = window.innerWidth, height = window.innerHeight) ->

        this.aspect = width / height

        this.updateProjectionMatrix()

    getPosition: ->

        return vectorAdaptor "convert", "length", clone this.position

    setPosition: (position, save = true) ->

        panels.camera.setPosition position

        this.position.x = adaptor "invert", "length", position.x
        this.position.y = adaptor "invert", "length", position.y
        this.position.z = adaptor "invert", "length", position.z

        this.lookAt this.target.x, this.target.y, this.target.z

        if save then settings.set "camera.position", this.position

    getPositionX: ->

        return adaptor "convert", "length", clone this.position.x

    setPositionX: (x, save = true) ->

        panels.camera.setPositionX Number x

        this.position.x = adaptor "invert", "length", Number x

        this.lookAt this.target.x, this.target.y, this.target.z

        if save then settings.set "camera.position", this.position

    getPositionY: ->

        return adaptor "convert", "length", clone this.position.y

    setPositionY: (y, save = true) ->

        panels.camera.setPositionY Number y

        this.position.y = adaptor "invert", "length", Number y

        this.lookAt this.target.x, this.target.y, this.target.z

        if save then settings.set "camera.position", this.position

    getPositionZ: ->

        return adaptor "convert", "length", clone this.position.z

    setPositionZ: (z, save = true) ->

        panels.camera.setPositionZ Number z

        this.position.z = adaptor "invert", "length", Number z

        this.lookAt this.target.x, this.target.y, this.target.z

        if save then settings.set "camera.position", this.position

    getTarget: ->

        return vectorAdaptor "convert", "length", clone this.target

    setTarget: (target, save = true) ->

        panels.camera.setTarget target

        this.target.x = adaptor "invert", "length", target.x
        this.target.y = adaptor "invert", "length", target.y
        this.target.z = adaptor "invert", "length", target.z

        this.lookAt this.target.x, this.target.y, this.target.z

        if save then settings.set "camera.target", this.target

    getTargetX: ->

        return adaptor "convert", "length", clone this.target.x

    setTargetX: (x, save = true) ->

        panels.camera.setTargetX Number x

        this.target.x = adaptor "invert", "length", Number x

        this.lookAt this.target.x, this.target.y, this.target.z

        if save then settings.set "camera.target", this.target

    getTargetY: ->

        return adaptor "convert", "length", clone this.target.y

    setTargetY: (y, save = true) ->

        panels.camera.setTargetY Number y

        this.target.y = adaptor "invert", "length", Number y

        this.lookAt this.target.x, this.target.y, this.target.z

        if save then settings.set "camera.target", this.target

    getTargetZ: ->

        return adaptor "convert", "length", clone this.target.z

    setTargetZ: (z, save = true) ->

        panels.camera.setTargetZ Number z

        this.target.z = adaptor "invert", "length", Number z

        this.lookAt this.target.x, this.target.y, this.target.z

        if save then settings.set "camera.target", this.target

    getNear: ->

        return adaptor "convert", "length", clone this.near

    setNear: (near, save = true) ->

        this.near = adaptor "invert", "length", near

        this.updateProjectionMatrix()

        if save then settings.set "camera.near", this.near

    getFar: ->

        return adaptor "convert", "length", clone this.far

    setFar: (far, save = true) ->

        this.far = adaptor "invert", "length", far

        this.updateProjectionMatrix()

        if save then settings.set "camera.far", this.far

    getFOV: ->

        return interpreter "convert", "angle", clone this.fov

    setFOV: (fov, save = true) ->

        this.fov = interpreter "invert", "angle", fov

        this.updateProjectionMatrix()

        if save then settings.set "camera.fov", this.fov

    focus: (point, duration = 1000, steps = 100) ->

        point = vectorAdaptor "invert", "length", point

        if this.target.x isnt point.x or this.target.y isnt point.y or this.target.z isnt point.z

            frame = 0
            this.focusing = true

            target = clone this.target

            stepX = (point.x - target.x) / steps
            stepY = (point.y - target.y) / steps
            stepZ = (point.z - target.z) / steps

            updateCameraTarget = =>

                frame += 1

                target.x += stepX
                target.y += stepY
                target.z += stepZ

                if equal frame, steps

                    this.focusing = false

                camera.lookAt target.x, target.y, target.z

                panels.camera.setTarget vectorAdaptor "convert", "length", clone target

            for step in [0...steps]

                setTimeout updateCameraTarget, duration / steps * step

            settings.set "camera.target", point

            this.target = clone point

            return true

        else

            return false

    reset: ->

        defaults = settings.camera.defaults()

        this.setAspect window.innerWidth, window.innerHeight

        position = vectorAdaptor "convert", "length", defaults.position
        target = vectorAdaptor "convert", "length", defaults.target
        near = adaptor "convert", "length", defaults.near
        far = adaptor "convert", "length", defaults.far
        fov = interpreter "convert", "angle", defaults.fov

        panels.camera.setPosition position
        panels.camera.setTarget target

        this.setPosition position
        this.setTarget target
        this.setNear near
        this.setFar far
        this.setFOV fov
