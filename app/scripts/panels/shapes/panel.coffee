class ShapesPanel

    constructor: ->

        return this

    add: ->

        template =

            """
            <div id='shapes' class='panel'>

                <img title='Close' class='close' src='/app/imgs/panels/nav/close.png'>
                <img title='Reset Shapes' class='reset' src='/app/imgs/panels/tools/reset.png'>

                <h3>Shapes</h3>

                <div id='basic' class='category'>

                    <div class='head'>

                        <img title='Fold Basic' class='fold' src='/app/imgs/panels/nav/fold.png'>

                        <h4>Basic</h4>

                    </div>

                    <div class='body'>

                        <img title='Box' id='box' class='shape' src='/app/imgs/icons/shapes/basic/box.png'>
                        <img title='Cylinder' id='cylinder' class='shape' src='/app/imgs/icons/shapes/basic/cylinder.png'>
                        <img title='Sphere' id='sphere' class='shape' src='/app/imgs/icons/shapes/basic/sphere.png'>

                    </div>

                </div>

                <div id='prisms' class='category'>

                    <div class='head'>

                        <img title='Fold Prisms' class='fold' src='/app/imgs/panels/nav/fold.png'>

                        <h4>Prisms</h4>

                    </div>

                    <div class='body'>

                        <img title='Triangular Prism' id='triangular-prism' class='shape' src='/app/imgs/icons/shapes/prisms/prism-3.png'>
                        <img title='Rectangular Prism' id='rectangular-prism' class='shape' src='/app/imgs/icons/shapes/prisms/prism-4.png'>
                        <img title='Pentagonal Prism' id='pentagonal-prism' class='shape' src='/app/imgs/icons/shapes/prisms/prism-5.png'>
                        <img title='Hexagonal Prism' id='hexagonal-prism' class='shape' src='/app/imgs/icons/shapes/prisms/prism-6.png'>
                        <img title='Heptagonal Prism' id='heptagonal-prism' class='shape' src='/app/imgs/icons/shapes/prisms/prism-7.png'>
                        <img title='Octagonal Prism' id='octagonal-prism' class='shape' src='/app/imgs/icons/shapes/prisms/prism-8.png'>

                    </div>

                </div>

                <div id='pyramids' class='category'>

                    <div class='head'>

                        <img title='Fold Pyramids' class='fold' src='/app/imgs/panels/nav/fold.png'>

                        <h4>Pyramids</h4>

                    </div>

                    <div class='body'>

                        <img title='Triangular Pyramid' id='triangular-pyramid' class='shape' src='/app/imgs/icons/shapes/pyramids/pyramid-3.png'>
                        <img title='Rectangular Pyramid' id='rectangular-pyramid' class='shape' src='/app/imgs/icons/shapes/pyramids/pyramid-4.png'>
                        <img title='Pentagonal Pyramid' id='pentagonal-pyramid' class='shape' src='/app/imgs/icons/shapes/pyramids/pyramid-5.png'>
                        <img title='Cone' id='cone' class='shape' src='/app/imgs/icons/shapes/pyramids/pyramid-x.png'>

                    </div>

                </div>

                <div id='hedrons' class='category'>

                    <div class='head'>

                        <img title='Fold Hedrons' class='fold' src='/app/imgs/panels/nav/fold.png'>

                        <h4>Hedrons</h4>

                    </div>

                    <div class='body'>

                        <img title='Octahedron' id='octahedron' class='shape' src='/app/imgs/icons/shapes/hedrons/octahedron.png'>
                        <img title='Dodecahedron' id='dodecahedron' class='shape' src='/app/imgs/icons/shapes/hedrons/dodecahedron.png'>
                        <img title='Icosahedron' id='icosahedron' class='shape' src='/app/imgs/icons/shapes/hedrons/icosahedron.png'>

                    </div>

                </div>

                <div id='special' class='category'>

                    <div class='head'>

                        <img title='Fold Special' class='fold' src='/app/imgs/panels/nav/fold.png'>

                        <h4>Special</h4>

                    </div>

                    <div class='body'>

                        <img title='Torus' id='torus' class='shape' src='/app/imgs/icons/shapes/special/torus.png'>
                        <img title='Text' id='text' class='shape' src='/app/imgs/icons/shapes/special/text.png'>
                        <img title='Image' id='image' class='shape' src='/app/imgs/icons/shapes/special/image.png'>

                    </div>

                </div>

            </div>
            """

        $("body").append template

        @panel = $("#shapes.panel")
        @shapes = this.panel.find("img.shape")
        @categories = settings.get("panels.shapes.selected")

        for category in this.categories

            this.fold category, 0

        for shortcut in settings.get "panels.shortcuts.selected"

            this.panel.find("img.shape#" + shortcut + "").css "opacity", 0.5

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

        this.panel.find("img.reset").click (event) => this.reset()

        this.panel.find(".fold, h4").click (event) =>

            selection = $(event.target).closest(".category").attr("id")

            if this.categories.includes selection

                this.categories.exclude (category) => category is selection

            else

                this.categories.push selection

            settings.set "panels.shapes.selected", this.categories

            event.stopPropagation()

            this.fold selection

        this.panel.find(".fold, h4").on "mousedown mouseup", (event) =>

            event.stopPropagation()

        for shape in this.shapes

            shape = $(shape)

            panels.shortcuts.dragable shape

            shape.contextmenu (event) =>

                contextMenu "shape", $(event.target), event

            shape.clickSingleDouble (event) =>

                panels.shortcuts.toggle event.target.id
                event.stopPropagation()

            , (event) =>

                new Mesh(event.target.id).add()
                event.stopPropagation()

    fold: (target, duration = 1000) ->

            category = this.panel.find "#" + target + ""
            head = category.find ".head"
            body = category.find ".body"
            fold = head.find ".fold"

            if this.categories.includes target

                body.css "display", "block"
                height = body.height()
                body.css "display", "none"

                category.animate {height: height + head.height()}, {duration: duration}
                body.css "display", "block"
                fold.rotate 90, duration

            else

                category.animate {height: head.height()}, {duration: duration}
                body.css "display", "none"
                fold.rotate 0, duration

    reset: ->

        panelDefaults = settings.panels.defaults()

        shapeDefaults = panelDefaults.shapes.selected
        shortcutDefaults = panelDefaults.shortcuts.selected

        this.categories = shapeDefaults
        panels.shortcuts.shortcuts = shortcutDefaults

        settings.set "panels.shapes.selected", shapeDefaults
        settings.set "panels.shortcuts.selected", shortcutDefaults

        for category in this.panel.find ".category"

            this.fold category.id

        for shape in panels.shortcuts.find ".shape"

            panels.shortcuts.animate shape.id
