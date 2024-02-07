class NavBar

    constructor: ->

        this.add()

        @bar = $("#navbar")

        @icons = this.bar.find ".icon"
        @menu = this.bar.find "#menu"
        @anvil = this.bar.find "#anvil"
        @docs = this.bar.find "#docs"
        @tutorials = this.bar.find "#tutorials"

        @title = this.bar.find "#title span"

        if page.path() is "/"

            this.title.text settings.get "ui.title"

        else

            this.title.css "cursor", "default"

        if settings.get "ui.navbar"

            this.show 0

        else if page.path() is "/"

            this.hide 0

        this.highlight()
        this.events()

    add: ->

        if page.path() is "/"

            main = "<img title='Menu' id='menu' class='icon' src='/app/imgs/theme/nav/menu/white.png'>"

        else

            main = "<img title='Polymorph' id='anvil' class='icon' src='/app/imgs/theme/nav/anvil/white.png'>"

        template =

            """
            <div id='navbar'>

                """ + main + """
                <img title='Documentation' id='docs' class='icon' src='/app/imgs/theme/nav/docs/white.png'>
                <img title='Tutorials' id='tutorials' class='icon' src='/app/imgs/theme/nav/tutorials/white.png'>

                <h1 id='title'>

                    <span contenteditable='""" + (page.path() is "/") + """'>

                        """ + data.title.upper() + """

                    </span>

                </h1>

            </div>
            """

        $("body").append template

    remove: ->

        this.bar.remove()

    show: (duration = 1000) ->

        this.bar.animate {top: 0}, {duration: duration}

    hide: (duration = 1000) ->

        this.bar.animate {top: -this.bar.height()}, {duration: duration}

    events: ->

        this.menu.click =>

            panels.menu.toggle()

        this.anvil.click =>

            page.redirect "/"

        this.docs.click =>

            if page.path() isnt "/docs"

                page.redirect "/docs"

        this.tutorials.click =>

            if page.path() isnt "/tutorials"

                page.redirect "/tutorials"

        this.icons.on "mouseenter", (event) =>

            this.highlight event.target.id

        this.icons.on "mouseleave", (event) =>

            this.highlight()

        this.title.on "keypress keydown keyup", (event) =>

            event.stopPropagation()

            if event.key is "Enter"

                    this.title.blur()

                    event.preventDefault()

        this.title.on "blur", (event) =>

            text = this.title[0].innerText.replace(/[^a-zA-Z0-9-_ ]/g, "").trim()
            title = if text then text else data.title.upper()

            settings.set "ui.title", title

            this.title.text title

    highlight: (icon = page.path().slice(1)) ->

        this.icons.css "opacity", 0.5

        if icon

            $("#" + icon + "").css "opacity", 1

        else

            this.menu.css "opacity", 1
