# Link: https://threejs.org/docs/#api/en/geometries/BoxGeometry

class BoxGeometry extends Geometry

    constructor: (params = {}) ->

        super "box", params

class POLY.BoxBufferGeometry extends THREE.BoxBufferGeometry

    constructor: (params = {}) ->

        length = params.length ?= 10
        width = params.width ?= 10
        height = params.height ?= 10

        lengthSegments = params.lengthSegments ?= 1
        widthSegments = params.widthSegments ?= 1
        heightSegments = params.heightSegments ?= 1

        super length, width, height, lengthSegments, widthSegments, heightSegments
