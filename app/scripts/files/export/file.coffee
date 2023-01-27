# Link: https://github.com/mrdoob/three.js/tree/670b1e9e85356d98efa4c702e93c85dd52f01e1e/examples/js/exporters

class Exporter

    constructor : () ->

        @exporter = null
        @file = null

    exportFile : (type = "") ->

        type = lower type.trim()

        switch type

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

            grid.remove()

            this.file = new Blob [this.exporter.parse scene], type: "text/plain"

            if this.file

                saveAs this.file, lower settings.getSetting("ui", "title") + "." + this.exporter.extension

            grid.add()

        this.exporter = null
        this.file = null

    exportFiles : (types = []) ->

        for type in types

            this.exportFile type

        this.exporter = null
        this.file = null
