# Link: https://threejs.org/docs/#api/en/geometries/TorusGeometry

class TorusGeometry extends Geometry

    constructor : (params = {}) ->

        super "torus", params

class POLY.TorusBufferGeometry extends THREE.TorusBufferGeometry

    constructor : (params = {}) ->

        radius = params.radius ?= 5
        thickness = params.thickness ?= 1

        radialSegments = params.radialSegments ?= 42
        tubularSegments = params.tubularSegments ?= 42

        arc = if "arc" of params then params.arc else Math.PI * 2

        super radius, thickness, radialSegments, tubularSegments, arc
