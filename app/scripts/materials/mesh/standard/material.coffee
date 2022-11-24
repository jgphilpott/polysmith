# Link: https://threejs.org/docs/#api/en/materials/MeshStandardMaterial

class StandardMeshMaterial extends MeshMaterial

    constructor : (params = {}) ->

        super "standard", params

class POLY.StandardMeshMaterial extends THREE.MeshStandardMaterial

    constructor : (params = {}) ->

        map = params.map ?= null
        color = params.color ?= blackThree
        side = params.side ?= THREE.DoubleSide

        super

            map: map
            color: color
            side: side
