class Help

    constructor: (self = this) ->

        this.add()

        @active = false
        @button = $("#help")

        if settings.get "ui.help"

            this.show 0

        else

            this.hide 0

    add: ->

        $("body").append "<img title='Help' id='help' src='/app/imgs/panels/nav/help/" + (if page.path() is "/" then "regular" else "inverted") + ".png'>"

    remove: ->

        this.button.remove()

    show: (duration = 1000) ->

            this.events true

            this.button.animate {width: "30px", height: "30px"}, {duration: duration}

    hide: (duration = 1000) ->

            this.events false

            this.button.animate {width: "0px", height: "0px"}, {duration: duration}

    events: (status = true) ->

        if status

            this.button.mouseover (event) =>

                this.button.css "width", "35px"
                this.button.css "height", "35px"

            this.button.mouseout (event) =>

                if not this.active

                    this.button.css "width", "30px"
                    this.button.css "height", "30px"

            this.button.click (event) =>

                event.stopPropagation()

                if not this.getActive()

                    this.setActive true

                else

                    this.setActive false

                $("#navbar #menu").mousemove -> this.addHelpBox this, "This is the Menu icon!"
                $("#navbar #menu").mouseout -> this.removeHelpBox this

                $("#navbar #title").mousemove -> this.addHelpBox this, "This is the Title!"
                $("#navbar #title").mouseout -> this.removeHelpBox this

                $("#forkme").mousemove -> this.addHelpBox this, "This is the Fork Me icon!"
                $("#forkme").mouseout -> this.removeHelpBox this

                this.button.mousemove -> this.addHelpBox this, "This is the Help icon!"
                this.button.mouseout -> this.removeHelpBox this

                $("#camera.panel").mousemove -> this.addHelpBox this, "This is the camera panel!"
                $("#camera.panel").mouseout -> this.removeHelpBox this

                $("#lights.panel").mousemove -> this.addHelpBox this, "This is the lights panel!"
                $("#lights.panel").mouseout -> this.removeHelpBox this

                $("#menu.panel").mousemove -> this.addHelpBox this, "This is the menu panel!"
                $("#menu.panel").mouseout -> this.removeHelpBox this

                $("#mesh.panel").mousemove -> this.addHelpBox this, "This is a mesh panel!"
                $("#mesh.panel").mouseout -> this.removeHelpBox this

                $("#meshes.panel").mousemove -> this.addHelpBox this, "This is the meshes panel!"
                $("#meshes.panel").mouseout -> this.removeHelpBox this

                $("#settings.panel").mousemove -> this.addHelpBox this, "This is the settings panel!"
                $("#settings.panel").mouseout -> this.removeHelpBox this

                $("#shapes.panel").mousemove -> this.addHelpBox this, "This is the shapes panel!"
                $("#shapes.panel").mouseout -> this.removeHelpBox this

                $("#shortcuts.panel").mousemove -> this.addHelpBox this, "This is the shortcuts panel!"
                $("#shortcuts.panel").mouseout -> this.removeHelpBox this

        else

            this.button.off("mouseover mouseout click")

    setActive: (active = false) ->

        this.active = active

        if active

            $("*").addClass "help"

            if settings.get "ui.help"

                this.button.css "width": "35px", "height": "35px", "filter": "drop-shadow(0px 0px 5px #ccc)"

        else

            $("#help-box").remove()

            $("*").removeClass "help"

            if settings.get "ui.help"

                this.button.css "width": "", "height": "", "filter": ""

    getActive: ->

        return this.active

    addHelpBox: (element, text = "") ->

        if this.active

            $("#help-box").remove()
            $("body").append "<div id='help-box'><p>" + text + "</p></div>"

            $(element).attr "data-title", $(element).attr "title"
            $(element).removeAttr "title"

            helpBox = $("#help-box")
            gapSize = 10

            if event.pageX >= window.innerWidth / 2
                helpBox.css "left", event.pageX - helpBox.outerWidth() - gapSize
            else if event.pageX < window.innerWidth / 2
                helpBox.css "left", event.pageX + gapSize

            if event.pageY >= window.innerHeight / 2
                helpBox.css "top", event.pageY - helpBox.outerHeight() - gapSize
            else if event.pageY < window.innerHeight / 2
                helpBox.css "top", event.pageY + gapSize

    removeHelpBox: (element) ->

        $("#help-box").remove()

        $(element).attr "title", $(element).attr "data-title"
