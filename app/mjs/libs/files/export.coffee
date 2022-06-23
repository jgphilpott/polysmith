exportFile = (type) ->

    removeAxes()

    file = null
    exporter = null
    extension = null

    switch type

        when "collada"

            exporter = new THREE.ColladaExporter()
            extension = "dae"

            break

        when "draco"

            exporter = new THREE.DRACOExporter()
            extension = "drc"

            break

        when "gltf"

            exporter = new THREE.GLTFExporter()
            extension = "gltf"

            break

        when "mmd"

            exporter = new THREE.MMDExporter()
            extension = "mmd"

            break

        when "obj"

            exporter = new THREE.OBJExporter()
            extension = "obj"

            break

        when "ply"

            exporter = new THREE.PLYExporter()
            extension = "ply"

            break

        when "stl"

            exporter = new THREE.STLExporter()
            extension = "stl"

            break

    if exporter

        file = new Blob [exporter.parse scene], type: "text/plain"

    if file and extension

        saveAs file, settings.ui.title.toLowerCase() + "." + extension

    addAxes()

exportFiles = (type) ->

    null
