# Link: https://threejs.org/docs/#api/en/materials/MeshLambertMaterial

class LambertMeshMaterial extends MeshMaterial

    constructor: (params = {}) ->

        super "lambert", params

class POLY.LambertMeshMaterial extends THREE.MeshLambertMaterial

    constructor: (params = {}) ->

        map = params.map ?= null
        color = params.color ?= blackThree
        side = params.side ?= THREE.DoubleSide

        super

            map: map
            color: color
            side: side
