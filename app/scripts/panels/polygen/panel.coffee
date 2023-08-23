class PolygenPanel

    constructor: ->

        return this

    add: ->

        template =

            """
            <div id='polygen' class='panel'>

                <img title='Close' class='close' src='/app/imgs/panels/nav/close.png'>

                <h3>Polygen</h3>

            </div>
            """

        $("body").append template

        @panel = $("#polygen.panel")

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
