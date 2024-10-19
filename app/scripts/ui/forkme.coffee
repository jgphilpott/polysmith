$ = require "jquery"

class Forkme

    constructor: ->

        fetch("../../templates/ui/forkme.html").then((response) =>

            return response.text()

        ).then((html) =>

            @html = html

            this.add()

        ).catch((error) =>

            console.error error

        )

    add: ->

        $("body").append this.html

        @banner = $("#forkme")
        @link = $("#github")[0]

    remove: ->

        this.banner.remove()

    show: ->

        this.banner.css "display", "block"

    hide: ->

        this.banner.css "display", "none"

    click: ->

        this.link.click()

module.exports = Forkme
