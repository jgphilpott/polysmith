class Exporter

    constructor : () ->

        @exporter = null
        @file = null

        return

    exportFile : (type = "") ->

        switch lower type.trim()

            when "collada"

                this.exporter = new ColladaExporter(); break

            when "draco"

                this.exporter = new DRACOExporter(); break

            when "gltf"

                this.exporter = new GLTFExporter(); break

            when "mmd"

                this.exporter = new MMDExporter(); break

            when "obj"

                this.exporter = new OBJExporter(); break

            when "ply"

                this.exporter = new PLYExporter(); break

            when "stl"

                this.exporter = new STLExporter(); break

        if this.exporter

            removeAxes()

            this.file = new Blob [this.exporter.parse scene], type: "text/plain"

            if this.file

                saveAs this.file, lower settings.ui.title + "." + this.exporter.extension

            addAxes()

        this.exporter = null
        this.file = null

        return

    exportFiles : (types = []) ->

        for type in types

            this.exportFile type

        this.exporter = null
        this.file = null

        return
