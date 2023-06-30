# Link: https://threejs.org/docs/#api/en/geometries/PlaneGeometry

class PlaneGeometry extends Geometry

    constructor: (params = {}) ->

        super "plane", params

class POLY.PlaneBufferGeometry extends THREE.PlaneBufferGeometry

    constructor: (params = {}) ->

        width = adaptor "convert", "length", 10
        height = adaptor "convert", "length", 10

        width = params.width ?= width
        height = params.height ?= height

        widthSegments = params.widthSegments ?= 1
        heightSegments = params.heightSegments ?= 1

        width = adaptor "invert", "length", width
        height = adaptor "invert", "length", height

        super width, height, widthSegments, heightSegments
