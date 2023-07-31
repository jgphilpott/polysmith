# Link: https://threejs.org/docs/#api/en/geometries/BoxGeometry

class BoxGeometry extends Geometry

    constructor: (params = {}) ->

        super "box", params

class POLY.BoxBufferGeometry extends THREE.BoxBufferGeometry

    constructor: (params = {}) ->

        width = adaptor "convert", "length", 10
        length = adaptor "convert", "length", 10
        height = adaptor "convert", "length", 10

        width = params.width ?= width
        length = params.length ?= length
        height = params.height ?= height

        widthSegments = params.widthSegments ?= 1
        lengthSegments = params.lengthSegments ?= 1
        heightSegments = params.heightSegments ?= 1

        width = adaptor "invert", "length", width
        length = adaptor "invert", "length", length
        height = adaptor "invert", "length", height

        super width, length, height, widthSegments, lengthSegments, heightSegments
