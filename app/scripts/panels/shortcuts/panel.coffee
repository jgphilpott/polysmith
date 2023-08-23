class ShortcutsPanel

    constructor: ->

        return this

    add: ->

        template =

            """
            <div id='shortcuts' class='panel'>

                <img title='Close' class='close' src='/app/imgs/panels/nav/close.png'>

                <img title='Box' id='box' class='shape' src='/app/imgs/icons/shapes/basic/box.png'>
                <img title='Cylinder' id='cylinder' class='shape' src='/app/imgs/icons/shapes/basic/cylinder.png'>
                <img title='Sphere' id='sphere' class='shape' src='/app/imgs/icons/shapes/basic/sphere.png'>

                <img title='Triangular Prism' id='triangular-prism' class='shape' src='/app/imgs/icons/shapes/prisms/prism-3.png'>
                <img title='Rectangular Prism' id='rectangular-prism' class='shape' src='/app/imgs/icons/shapes/prisms/prism-4.png'>
                <img title='Pentagonal Prism' id='pentagonal-prism' class='shape' src='/app/imgs/icons/shapes/prisms/prism-5.png'>
                <img title='Hexagonal Prism' id='hexagonal-prism' class='shape' src='/app/imgs/icons/shapes/prisms/prism-6.png'>
                <img title='Heptagonal Prism' id='heptagonal-prism' class='shape' src='/app/imgs/icons/shapes/prisms/prism-7.png'>
                <img title='Octagonal Prism' id='octagonal-prism' class='shape' src='/app/imgs/icons/shapes/prisms/prism-8.png'>

                <img title='Triangular Pyramid' id='triangular-pyramid' class='shape' src='/app/imgs/icons/shapes/pyramids/pyramid-3.png'>
                <img title='Rectangular Pyramid' id='rectangular-pyramid' class='shape' src='/app/imgs/icons/shapes/pyramids/pyramid-4.png'>
                <img title='Pentagonal Pyramid' id='pentagonal-pyramid' class='shape' src='/app/imgs/icons/shapes/pyramids/pyramid-5.png'>
                <img title='Cone' id='cone' class='shape' src='/app/imgs/icons/shapes/pyramids/pyramid-x.png'>

                <img title='Octahedron' id='octahedron' class='shape' src='/app/imgs/icons/shapes/hedrons/octahedron.png'>
                <img title='Dodecahedron' id='dodecahedron' class='shape' src='/app/imgs/icons/shapes/hedrons/dodecahedron.png'>
                <img title='Icosahedron' id='icosahedron' class='shape' src='/app/imgs/icons/shapes/hedrons/icosahedron.png'>

                <img title='Torus' id='torus' class='shape' src='/app/imgs/icons/shapes/special/torus.png'>
                <img title='Text' id='text' class='shape' src='/app/imgs/icons/shapes/special/text.png'>
                <img title='Image' id='image' class='shape' src='/app/imgs/icons/shapes/special/image.png'>

                <img title='Toggle Shapes Panel' id='toggle' class='nav' src='/app/imgs/panels/nav/""" + (if settings.get("panels.shapes.open") then "x" else "+") + """.png'>

            </div>
            """

        $("body").append template

        @panel = $("#shortcuts.panel")
        @shapes = this.panel.find("img.shape")
        @shortcuts = settings.get("panels.shortcuts.selected")

        for shortcut in this.shortcuts

            shortcut = this.panel.find "img#" + shortcut + ".shape"

            shortcut.css "width", 50
            shortcut.css "height", 50
            shortcut.css "margin", 10

        this.events()

    remove: ->

        this.panel.remove()

    show: ->

        this.panel.css "visibility", "visible"
        this.panel.css "z-index", events.zIndex += 1

    hide: ->

        this.panel.css "visibility", "hidden"

    events: ->

        panels.events this.panel

        for shape in this.shapes

            shape = $(shape)

            this.dragable shape

            shape.contextmenu (event) =>

                contextMenu "shape", $(event.target), event

            shape.clickSingleDouble (event) =>

                if settings.get "panels.shapes.open"

                    this.toggle event.target.id

                event.stopPropagation()

            , (event) =>

                new Mesh(event.target.id).add()
                event.stopPropagation()

            shape.mouseenter (event) =>

                if settings.get "panels.shapes.open"

                    this.shapes.css "cursor", "pointer"

                else

                    this.shapes.css "cursor", "grab"

        this.panel.find("img#toggle").click (event) =>

            settings.set "panels.shapes.open", not settings.get "panels.shapes.open"

        this.panel.find("img#toggle").on "mousedown mouseup", (event) =>

            event.stopPropagation()

    toggle: (target, duration = 1000) ->

        shortcut = this.panel.find "img#" + target + ".shape"
        shape = panels.shapes.panel.find "img#" + target + ".shape"

        if this.shortcuts.includes target

            this.shortcuts.exclude (shortcut) => shortcut is target

            shortcut.animate {width: 0, height: 0, margin: 0}, {duration: duration}
            shape.animate {opacity: 1}, {duration: duration}

        else

            this.shortcuts.push target

            shortcut.animate {width: 50, height: 50, margin: 10}, {duration: duration}
            shape.animate {opacity: 0.5}, {duration: duration}

        settings.set "panels.shortcuts.selected", this.shortcuts

    dragable: (shape) ->

        xOffset = 0
        yOffset = 0

        dragged = null

        start = (event) =>

            event.stopPropagation()

            $("body").append "<img class='ghost-shape' src='" + shape.attr("src") + "'>"
            $(".ghost-shape").css "z-index", events.zIndex + 100

            xOffset = event.clientX - shape.offset().left
            yOffset = event.clientY - shape.offset().top

            document.onmousemove = drag
            document.onmouseup = stop

        drag = (event) =>

            dragged = true

            event.stopPropagation()

            eventX = event.clientX - xOffset
            eventY = event.clientY - yOffset

            $(".ghost-shape").css "cursor", "grabbing"

            $(".ghost-shape").css top: eventY, left: eventX

        stop = (event) =>

            event.stopPropagation()

            ghost = $(".ghost-shape")

            if dragged

                size = vectorAdaptor "invert", "length", printer.getSize()
                coordinates = d2$d3 ghost.offset().left + (ghost.width() / 2), ghost.offset().top + (ghost.height() / 2)

                x = if coordinates.x < -size.x then -size.x else if coordinates.x > size.x then size.x else coordinates.x
                y = if coordinates.y < -size.y then -size.y else if coordinates.y > size.y then size.y else coordinates.y
                z = if coordinates.z < -size.z then -size.z else if coordinates.z > size.z then size.z else coordinates.z

                mesh = new Mesh shape.attr("id"), position: {x: x, y: y, z: z}

                if shape.attr("id") isnt "text" and shape.attr("id") isnt "image"

                    composer.outlinePass.visibleEdgeColor.set blackThree
                    composer.outlinePass.selectedObjects = [mesh]

                    $("#canvas").css "cursor", "grab"

                mesh.add()

            document.onmousemove = null
            document.onmouseup = null

            dragged = null

            ghost.remove()

        shape.mousedown start
