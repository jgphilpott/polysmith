# Link: https://threejs.org/docs/#api/en/geometries/BoxGeometry

class BoxGeometry extends Geometry

    constructor: (params = {}) ->

        super "box", params

class POLY.BoxBufferGeometry extends THREE.BoxBufferGeometry

    constructor: (params = {}) ->

        length = adaptor "convert", "length", 10
        width = adaptor "convert", "length", 10
        height = adaptor "convert", "length", 10

        length = params.length ?= length
        width = params.width ?= width
        height = params.height ?= height

        lengthSegments = params.lengthSegments ?= 1
        widthSegments = params.widthSegments ?= 1
        heightSegments = params.heightSegments ?= 1

        length = adaptor "invert", "length", length
        width = adaptor "invert", "length", width
        height = adaptor "invert", "length", height

        super length, width, height, lengthSegments, widthSegments, heightSegments
