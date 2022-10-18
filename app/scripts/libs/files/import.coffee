importFile = (type, path, properties = {}) ->

    mesh = null
    loader = null
    material = new MeshMaterial "normal"

    switch lower type

        when "3mf"

            loader = new THREE.ThreeMFLoader(); break

        when "amf"

            loader = new THREE.AMFLoader(); break

        when "collada"

            loader = new THREE.ColladaLoader(); break

        when "draco"

            loader = new THREE.DRACOLoader(); break

        when "fbx"

            loader = new THREE.FBXLoader(); break

        when "gltf"

            loader = new THREE.GLTFLoader(); break

        when "mmd"

            loader = new THREE.MMDLoader(); break

        when "obj"

            loader = new THREE.OBJLoader(); break

        when "ply"

            loader = new THREE.PLYLoader(); break

        when "stl"

            loader = new THREE.STLLoader(); break

        when "svg"

            loader = new THREE.SVGLoader(); break

        when "vrml"

            loader = new THREE.VRMLLoader(); break

    if loader

        if type == "svg"

            $.get path, (svg) ->

                shapes = []
                paths = loader.parse(svg).paths

                for path in paths

                    Array.prototype.push.apply shapes, path.toShapes()

                geometry = new THREE.ExtrudeBufferGeometry shapes, properties
                mesh = new THREE.Mesh geometry, material

        else

            loader.load path, (object) ->

                objects = []

                if type == "obj"

                    object.traverse (property) ->

                        if property instanceof THREE.Mesh

                            property.material = material
                            objects.push property

                else

                    objects.push new THREE.Mesh object, material

                for object in objects

                    addMesh object

    return mesh

importFiles = (input) ->

    if input.files and input.files.length

        for file in input.files

            reader = new FileReader()

            reader.readAsDataURL file

            reader.extension = file.name.match(/\.[0-9a-z]+$/i)[0].substring(1)

            reader.onload = (file) -> importFile file.target.extension, file.target.result
