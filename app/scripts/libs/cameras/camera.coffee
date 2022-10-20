# Link: https://threejs.org/docs/#api/en/cameras/Camera

class Camera

    constructor : (type) ->

        @type = type.toLowerCase().trim()

        @position = settings.camera.position
        @target = settings.camera.target

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

        this.camera.add = this.add
        this.camera.remove = this.remove

        this.camera.position.set this.position.x, this.position.y, this.position.z
        this.camera.lookAt this.target.x, this.target.y, this.target.z
        this.camera.target = this.target

        return this.camera

    add : (self = this) ->

        scene.add self

        return self

    remove : (self = this) ->

        scene.remove self

        return self
