# Link: https://threejs.org/docs/#api/en/materials/MeshNormalMaterial

class NormalMeshMaterial extends MeshMaterial

    constructor: (params = {}) ->

        super "normal", params

class POLY.NormalMeshMaterial extends THREE.MeshNormalMaterial

    constructor: (params = {}) ->

        params.reflectivity = if params.reflectivity then params.reflectivity / 100 else 0.5
        params.transmission = if params.transmission then params.transmission / 100 else 0
        params.metalness = if params.metalness then params.metalness / 100 else 0.4
        params.roughness = if params.roughness then params.roughness / 100 else 0.6
        params.opacity = if params.opacity then params.opacity / 100 else 1
        params.side ?= THREE.DoubleSide
        params.color ?= blackThree

        super params