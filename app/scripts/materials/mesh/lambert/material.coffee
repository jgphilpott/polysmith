# Link: https://threejs.org/docs/#api/en/materials/MeshLambertMaterial

class LambertMeshMaterial extends MeshMaterial

    constructor: (params = {}) ->

        super "lambert", params

class POLY.LambertMeshMaterial extends THREE.MeshLambertMaterial

    constructor: (params = {}) ->

        params.reflectivity = if params.reflectivity then params.reflectivity / 100 else 0.5
        params.transmission = if params.transmission then params.transmission / 100 else 0
        params.metalness = if params.metalness then params.metalness / 100 else 0.5
        params.roughness = if params.roughness then params.roughness / 100 else 0.5
        params.opacity = if params.opacity then params.opacity / 100 else 1
        params.side ?= THREE.DoubleSide
        params.color ?= blackThree

        super params
