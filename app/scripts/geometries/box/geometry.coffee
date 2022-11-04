# Link: https://threejs.org/docs/#api/en/geometries/BoxGeometry

class BoxGeometry extends Geometry

    constructor : (length = 10, width = 10, height = 10, lengthSegments = 1, widthSegments = 1, heightSegments = 1) ->

        super "box",

            length: length
            width: width
            height: height

            lengthSegments: lengthSegments
            widthSegments: widthSegments
            heightSegments: heightSegments

class POLY.BoxBufferGeometry extends THREE.BoxBufferGeometry

    constructor : (params) ->

        length = if "length" in params then params.length else 10
        width = if "width" in params then params.width else 10
        height = if "height" in params then params.height else 10

        lengthSegments = if "lengthSegments" in params then params.lengthSegments else 1
        widthSegments = if "widthSegments" in params then params.widthSegments else 1
        heightSegments = if "heightSegments" in params then params.heightSegments else 1

        super length, width, height, lengthSegments, widthSegments, heightSegments
