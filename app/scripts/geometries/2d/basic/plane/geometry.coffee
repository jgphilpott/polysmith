# Link: https://threejs.org/docs/#api/en/geometries/PlaneGeometry

class PlaneGeometry extends Geometry

    constructor: (params = {}) ->

        super "plane", params

class POLY.PlaneBufferGeometry extends THREE.PlaneBufferGeometry

    constructor: (params = {}) ->

        width = adaptor "convert", "length", 10
        length = adaptor "convert", "length", 10

        width = params.width ?= width
        length = params.length ?= length

        widthSegments = params.widthSegments ?= 1
        lengthSegments = params.lengthSegments ?= 1

        width = adaptor "invert", "length", width
        length = adaptor "invert", "length", length

        super width, length, widthSegments, lengthSegments
