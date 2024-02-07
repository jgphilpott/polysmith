class LightsPanel

    constructor: ->

        return this

    add: ->

        $("body").append "<div id='lights' class='panel'><img title='Close' class='close' src='/app/imgs/panels/nav/close/black.png'></div>"

        @panel = $("#lights.panel")

        this.panel.append "<img title='Lights' class='lights' src='/app/imgs/panels/main/light.png'>"
        this.panel.append "<img title='Reset Lights' class='reset' src='/app/imgs/panels/tools/reset.png'>"

        if lights.length

            length = settings.get ["scales", "length"]

            this.panel.append "<div id='list'></div>"

            list = this.panel.find "#list"

            lights.forEach (light) ->

                template =

                    """
                    <div id='light-""" + light.uuid + """' class='light'>
                        <div class='head'>

                            <img title='Fold Light' class='fold' src='/app/imgs/panels/nav/fold/black.png'>

                            <select name='types' id='types'>

                                <option value='ambient' """ + (if light.type is "ambient" then "selected" else "") + """>Ambient</option>
                                <option value='point' """ + (if light.type is "point" then "selected" else "") + """>Point</option>

                            </select>

                            <div id='intensity' class='slider'></div>

                            <img title='Lock Light' class='lock' src='/app/imgs/panels/lock/""" + (if light.getLock() then "locked" else "unlocked") + """.png'>
                            <img title='Delete Light' class='trash' src='/app/imgs/panels/tools/trash.png'>

                        </div>
                        <div class='body'>

                            <span id='position-x'>
                                <label id='x'>X</label>
                                <div class='suffix """ + length.unit[length.scale] + """'>
                                    <input type=number step=1 value=""" + light.getPositionX().toFixed(2) + """>
                                </div>
                                <button id='plus'>+</button>
                                <button id='minus'>-</button>
                            </span>

                            <span id='position-y'>
                                <label id='y'>Y</label>
                                <div class='suffix """ + length.unit[length.scale] + """'>
                                    <input type=number step=1 value=""" + light.getPositionY().toFixed(2) + """>
                                </div>
                                <button id='plus'>+</button>
                                <button id='minus'>-</button>
                            </span>

                            <span id='position-z'>
                                <label id='z'>Z</label>
                                <div class='suffix """ + length.unit[length.scale] + """'>
                                    <input type=number step=1 value=""" + light.getPositionZ().toFixed(2) + """>
                                </div>
                                <button id='plus'>+</button>
                                <button id='minus'>-</button>
                            </span>

                        </div>
                    </div>
                    """

                list.append template

                template = list.find "#light-" + light.uuid + ""

                types = template.find "select#types"
                intensity = template.find "#intensity.slider"

                intensity.slider {min: 0, max: 100, value: light.intensity * 100, start: sliderStart, slide: sliderSlide, stop: sliderStop}

                template.data "light", light

                sliderStyle intensity

        else

            this.panel.append "<p id='none'><b>None</b></p>"

        this.panel.append "<img title='Add New Light' class='nav' src='/app/imgs/panels/nav/plus/regular.png'>"

        this.panel.find(".fold").click((event) ->

            foldPanel this

        ).on "mousedown mouseup", (event) -> event.stopPropagation()

        this.panel.find("select#types").on "mousedown mouseup", (event) -> event.stopPropagation()

        this.panel.find(".slider").on "mousedown mouseup", (event) -> event.stopPropagation()

        this.panel.find(".lock").click((event) ->

            template = $(this).closest "div.light"
            light = template.data "light"
            lock = light.toggleLock()

            template.find("select").toggleClass "disabled", lock
            template.find("select").prop "disabled", lock

            template.find(".slider").toggleClass "disabled", lock
            template.find(".slider").slider(if lock then "disable" else "enable")

            template.find(".lock").attr "src", "/app/imgs/panels/lock/" + (if lock then "locked" else "unlocked") + ".png"
            template.find(".trash").toggleClass "disabled", lock

            template.find("input").toggleClass "disabled", lock
            template.find("button").toggleClass "disabled", lock

            sliderStyle template.find ".slider"

        ).on "mousedown mouseup", (event) -> event.stopPropagation()

        this.panel.find(".trash").on "mousedown mouseup", (event) -> event.stopPropagation()

        this.panel.data "lights", lights

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
