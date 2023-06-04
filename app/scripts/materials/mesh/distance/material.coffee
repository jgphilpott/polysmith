# Link: https://threejs.org/docs/#api/en/materials/MeshDistanceMaterial

class DistanceMeshMaterial extends MeshMaterial

    constructor: (params = {}) ->

        super "distance", params

class POLY.DistanceMeshMaterial extends THREE.MeshDistanceMaterial

    constructor: (params = {}) ->

        params.opacity = if params.opacity then params.opacity / 100 else 1
        params.side ?= THREE.DoubleSide
        params.color ?= blackThree

        super params
