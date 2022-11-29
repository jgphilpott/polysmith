class Text extends Mesh

    constructor : (params = {}) ->

        super "text", params

class POLY.TextMesh

    constructor : (params = {}) ->

        params.material ?= "normal"
        params.mesh ?= new THREE.Mesh()

        params.mesh.geometry = new TextGeometry params
        params.mesh.material = new MeshMaterial params.material, params

        params.mesh.rotation.z = deg$rad 180

        params.mesh.class = "text"
        params.mesh.name = "Text"

        return params.mesh
