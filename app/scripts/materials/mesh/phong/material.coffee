# Link: https://threejs.org/docs/#api/en/materials/MeshPhongMaterial

class PhongMeshMaterial extends MeshMaterial

    constructor: (params = {}) ->

        super "phong", params

class POLY.PhongMeshMaterial extends THREE.MeshPhongMaterial

    constructor: (params = {}) ->

        params.opacity = if params.opacity then params.opacity / 100 else 1
        params.side ?= THREE.DoubleSide
        params.color ?= blackThree

        super params
