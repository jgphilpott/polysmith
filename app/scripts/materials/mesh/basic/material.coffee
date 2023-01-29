# Link: https://threejs.org/docs/#api/en/materials/MeshBasicMaterial

class BasicMeshMaterial extends MeshMaterial

    constructor: (params = {}) ->

        super "basic", params

class POLY.BasicMeshMaterial extends THREE.MeshBasicMaterial

    constructor: (params = {}) ->

        map = params.map ?= null
        color = params.color ?= blackThree
        side = params.side ?= THREE.DoubleSide

        super

            map: map
            color: color
            side: side
