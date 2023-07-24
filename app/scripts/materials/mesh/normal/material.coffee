# Link: https://threejs.org/docs/#api/en/materials/MeshNormalMaterial

class NormalMeshMaterial extends MeshMaterial

    constructor: (params = {}) ->

        super "normal", params

class POLY.NormalMeshMaterial extends THREE.MeshNormalMaterial

    constructor: (params = {}) ->

        params.side ?= THREE.DoubleSide
        params.color ?= blackThree
        params.reflectivity ?= 50
        params.transmission ?= 0
        params.metalness ?= 50
        params.roughness ?= 50
        params.opacity ?= 100

        $params = clone params

        $params.reflectivity /= 100
        $params.transmission /= 100
        $params.metalness /= 100
        $params.roughness /= 100
        $params.opacity /= 100

        super $params
