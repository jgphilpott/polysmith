$ = require "jquery"

class Navbar

    constructor: ->

        fetch("../../templates/ui/navbar.html").then((response) =>

            return response.text()

        ).then((html) =>

            @html = html

            this.add()

        ).catch((error) =>

            console.error error

        )

    add: ->

        $("body").append this.html

        @navbar = $("#navbar")

        @icons = this.navbar.find ".icon"

        @anvil = this.navbar.find "#anvil"
        @docs = this.navbar.find "#docs"
        @tutorials = this.navbar.find "#tutorials"

        @title = this.navbar.find "#title span"

        $("title").text window.location.name

        this.title.text window.location.name

        if window.location.page isnt "anvil"

            this.title.css "cursor", "default"
            this.title.attr "contenteditable", false

        $("img#" + window.location.page + ".icon").css "opacity", 0.5

        this.events()

    remove: ->

        this.navbar.remove()

    show: (duration = 1000) ->

        this.navbar.animate {top: 0}, {duration: duration}

    hide: (duration = 1000) ->

        this.navbar.animate {top: -this.navbar.height()}, {duration: duration}

    events: ->

        this.icons.on "mouseenter", (event) =>

            this.icons.css "opacity", 1
            $(event.target).css "opacity", 0.5

        this.icons.on "mouseleave", (event) =>

            if window.location.page isnt event.target.id

                $(event.target).css "opacity", 1
                this[window.location.page].css "opacity", 0.5

        this.icons.on "click", (event) =>

            if window.location.page isnt event.target.id

                if window.location.platform is "express"

                    window.location.href = "/" + event.target.id

                if window.location.platform is "electron"

                    window.location.href = "./" + event.target.id + ".html"

        this.title.on "keypress keydown keyup", (event) =>

            event.stopPropagation()

            if event.key is "Enter"

                    this.title.blur()

                    event.preventDefault()

        this.title.on "blur", (event) =>

            text = this.title.text().replace(/[^a-zA-Z0-9-_ ]/g, "").trim()
            title = if text then text else window.location.name

            this.title.text title

module.exports = Navbar
