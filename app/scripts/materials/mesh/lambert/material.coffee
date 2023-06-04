# Link: https://threejs.org/docs/#api/en/materials/MeshLambertMaterial

class LambertMeshMaterial extends MeshMaterial

    constructor: (params = {}) ->

        super "lambert", params

class POLY.LambertMeshMaterial extends THREE.MeshLambertMaterial

    constructor: (params = {}) ->

        params.opacity = if params.opacity then params.opacity / 100 else 1
        params.side ?= THREE.DoubleSide
        params.color ?= blackThree

        super params
