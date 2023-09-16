class NavBar

    constructor: ->

        @bar = $("#navbar")

        @menu = this.bar.find "#menu"
        @title = this.bar.find "#title"

        this.title.find("span").text settings.get "ui.title"

        if settings.get "ui.navbar"

            this.show 0

        else

            this.hide 0

    show: (duration = 1000) ->

        this.bar.animate {top: 0}, {duration: duration}

    hide: (duration = 1000) ->

        this.bar.animate {top: -50}, {duration: duration}
