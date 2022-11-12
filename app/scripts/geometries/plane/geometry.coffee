# Link: https://threejs.org/docs/#api/en/geometries/PlaneGeometry

class PlaneGeometry extends Geometry

    constructor : (width = 10, height = 10, widthSegments = 1, heightSegments = 1) ->

        super "plane",

            width: width
            height: height

            widthSegments: widthSegments
            heightSegments: heightSegments

class POLY.PlaneBufferGeometry extends THREE.PlaneBufferGeometry

    constructor : (params) ->

        width = if "width" of params then params.width else 10
        height = if "height" of params then params.height else 10

        widthSegments = if "widthSegments" of params then params.widthSegments else 1
        heightSegments = if "heightSegments" of params then params.heightSegments else 1

        super width, height, widthSegments, heightSegments
