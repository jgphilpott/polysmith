class ForkMe

    constructor: ->

        @banner = $("#forkme")

        if settings.get "ui.forkme"

            this.show()

        else

            this.hide()

    show: ->

        this.banner.css "display", "block"

    hide: ->

        this.banner.css "display", "none"
