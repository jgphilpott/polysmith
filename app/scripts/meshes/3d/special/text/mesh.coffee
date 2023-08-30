class Text extends Mesh

    constructor: (params = {}) ->

        super "text", params

class POLY.TextMesh

    constructor: (params = {}) ->

        params.material ?= "normal"
        params.mesh ?= new THREE.Mesh()

        params.mesh.geometry = new TextGeometry params
        params.mesh.material = new MeshMaterial params.material, params

        params.mesh.class = params.class ?= "text"
        params.mesh.name = params.name ?= "Text"

        params.mesh.rotation.z = deg$rad 180

        params.mesh.getText = this.getText
        params.mesh.setText = this.setText

        params.mesh.getFont = this.getFont
        params.mesh.setFont = this.setFont

        params.mesh.getSize = this.getSize
        params.mesh.setSize = this.setSize

        params.mesh.getHeight = this.getHeight
        params.mesh.setHeight = this.setHeight

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

    getText: ->

        return clone this.params.text

    setText: (text, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.text = String text
            this.geometry = new TextGeometry this.params

            if save then this.save "update"

    getFont: ->

        return clone this.params.font

    setFont: (font, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.font = String font
            this.geometry = new TextGeometry this.params

            if save then this.save "update"

    getSize: ->

        return clone this.params.size

    setSize: (size, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.size = Number size
            this.geometry = new TextGeometry this.params

            if save then this.save "update"

    getHeight: ->

        return clone this.params.height

    setHeight: (height, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.height = Number height
            this.geometry = new TextGeometry this.params

            if save then this.save "update"

    getBevelEnabled: ->

        return clone this.params.bevelEnabled

    setBevelEnabled: (bevelEnabled, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.bevelEnabled = Boolean bevelEnabled
            this.geometry = new TextGeometry this.params

            if save then this.save "update"

    getBevelSize: ->

        return clone this.params.bevelSize

    setBevelSize: (bevelSize, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.bevelSize = Number bevelSize
            this.geometry = new TextGeometry this.params

            if save then this.save "update"

    getBevelOffset: ->

        return clone this.params.bevelOffset

    setBevelOffset: (bevelOffset, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.bevelOffset = Number bevelOffset
            this.geometry = new TextGeometry this.params

            if save then this.save "update"

    getBevelThickness: ->

        return clone this.params.bevelThickness

    setBevelThickness: (bevelThickness, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.bevelThickness = Number bevelThickness
            this.geometry = new TextGeometry this.params

            if save then this.save "update"

    getBevelSegments: ->

        return clone this.params.bevelSegments

    setBevelSegments: (bevelSegments, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.bevelSegments = Number bevelSegments
            this.geometry = new TextGeometry this.params

            if save then this.save "update"

    getCurveSegments: ->

        return clone this.params.curveSegments

    setCurveSegments: (curveSegments, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.curveSegments = Number curveSegments
            this.geometry = new TextGeometry this.params

            if save then this.save "update"
