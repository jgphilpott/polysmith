# Link: https://threejs.org/docs/#api/en/geometries/PlaneGeometry

class PlaneGeometry extends Geometry

    constructor : (params = {}) ->

        super "plane", params

class POLY.PlaneBufferGeometry extends THREE.PlaneBufferGeometry

    constructor : (params = {}) ->

        width = params.width ?= 10
        height = params.height ?= 10

        widthSegments = params.widthSegments ?= 1
        heightSegments = params.heightSegments ?= 1

        super width, height, widthSegments, heightSegments
