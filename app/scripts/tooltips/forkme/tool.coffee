class ForkMe

    constructor: ->

        this.add()

        @banner = $("#forkme")

        if settings.get "ui.forkme"

            this.show()

        else

            this.hide()

    add: ->

        template =

            """
            <a href='https://github.com/jgphilpott/polymorph' target='_blank'>

                <img title='Fork Me' id='forkme' src='/app/imgs/theme/forkme/right/red.png'>

            </a>
            """

        $("body").append template

    remove: ->

        this.banner.remove()

    show: ->

        this.banner.css "display", "block"

    hide: ->

        this.banner.css "display", "none"
