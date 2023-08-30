class Image extends Mesh

    constructor: (params = {}) ->

        super "image", params

class POLY.ImageMesh

    constructor: (params = {}) ->

        params.material ?= "normal"
        params.mesh ?= new THREE.Mesh()

        params.mesh.geometry = new ImageGeometry params
        params.mesh.material = new MeshMaterial params.material, params

        params.mesh.class = params.class ?= "image"
        params.mesh.name = params.name ?= "Image"

        params.mesh.rotation.y = deg$rad 180

        params.mesh.getImage = this.getImage
        params.mesh.setImage = this.setImage

        params.mesh.getSteps = this.getSteps
        params.mesh.setSteps = this.setSteps

        params.mesh.getDepth = this.getDepth
        params.mesh.setDepth = this.setDepth

        params.mesh.getBevelEnabled = this.getBevelEnabled
        params.mesh.setBevelEnabled = this.setBevelEnabled

        params.mesh.getBevelSize = this.getBevelSize
        params.mesh.setBevelSize = this.setBevelSize

        params.mesh.getBevelOffset = this.getBevelOffset
        params.mesh.setBevelOffset = this.setBevelOffset

        params.mesh.getBevelThickness = this.getBevelThickness
        params.mesh.setBevelThickness = this.setBevelThickness

        params.mesh.getBevelSegments = this.getBevelSegments
        params.mesh.setBevelSegments = this.setBevelSegments

        params.mesh.getCurveSegments = this.getCurveSegments
        params.mesh.setCurveSegments = this.setCurveSegments

        return params.mesh

    getImage: ->

        return clone this.params.image

    setImage: (image, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.image = String image
            this.geometry = new ImageGeometry this.params

            if save then this.save "update"

    getSteps: ->

        return clone this.params.steps

    setSteps: (steps, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.steps = Number steps
            this.geometry = new ImageGeometry this.params

            if save then this.save "update"

    getDepth: ->

        return clone this.params.depth

    setDepth: (depth, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.depth = Number depth
            this.geometry = new ImageGeometry this.params

            if save then this.save "update"

    getBevelEnabled: ->

        return clone this.params.bevelEnabled

    setBevelEnabled: (bevelEnabled, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.bevelEnabled = Boolean bevelEnabled
            this.geometry = new ImageGeometry this.params

            if save then this.save "update"

    getBevelSize: ->

        return clone this.params.bevelSize

    setBevelSize: (bevelSize, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.bevelSize = Number bevelSize
            this.geometry = new ImageGeometry this.params

            if save then this.save "update"

    getBevelOffset: ->

        return clone this.params.bevelOffset

    setBevelOffset: (bevelOffset, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.bevelOffset = Number bevelOffset
            this.geometry = new ImageGeometry this.params

            if save then this.save "update"

    getBevelThickness: ->

        return clone this.params.bevelThickness

    setBevelThickness: (bevelThickness, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.bevelThickness = Number bevelThickness
            this.geometry = new ImageGeometry this.params

            if save then this.save "update"

    getBevelSegments: ->

        return clone this.params.bevelSegments

    setBevelSegments: (bevelSegments, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.bevelSegments = Number bevelSegments
            this.geometry = new ImageGeometry this.params

            if save then this.save "update"

    getCurveSegments: ->

        return clone this.params.curveSegments

    setCurveSegments: (curveSegments, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.curveSegments = Number curveSegments
            this.geometry = new ImageGeometry this.params

            if save then this.save "update"
