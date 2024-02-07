# Link: https://threejs.org/docs/#api/en/materials/MeshStandardMaterial

class StandardMeshMaterial extends MeshMaterial

    constructor: (params = {}) ->

        super "standard", params

class POLY.StandardMeshMaterial extends THREE.MeshStandardMaterial

    constructor: (params = {}) ->

        params.side ?= THREE.DoubleSide
        params.color ?= blackThree
        params.transparent ?= true
        params.wireframe ?= false
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
