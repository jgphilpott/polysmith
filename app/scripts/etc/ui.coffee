class Slider

    constructor: (args) ->

        @min = args.min ?= 1
        @max = args.max ?= 100
        @value = args.value ?= 50

        @start = args.start ?= => null
        @slide = args.slide ?= => null
        @stop = args.stop ?= => null

        @element = args.element.slider args

        this.style = sliderStyle
        this.fill = sliderFill

        this.style this.element

    getValue: ->

        return clone this.value

    setValue: (value = null) ->

        if value

            this.value = Number value

        else

            this.value = this.element.slider "option", "value"

        this.element.slider "value", this.value

        this.style this.element

    animate: (value, duration = 1000, steps = 100) ->

        stepValue = (this.getValue() - value) / steps

        for step in [0...steps]

            setTimeout =>

                this.setValue this.getValue() - stepValue

            , duration / steps * step

sliderFill = (slider, colorOne = "#3273f6", colorTwo = "#efefef") ->

    if slider.hasClass "disabled"

        colorOne = "#848484"
        colorTwo = "#efefef"

    min = slider.slider "option", "min"
    max = slider.slider "option", "max"

    value = slider.slider "option", "value"

    slider.find("span").css "background", colorOne
    slider.css "background", "linear-gradient(90deg, " + colorOne + " " + calculatePercent(min, max, value) + "%, " + colorTwo + " 0%)"

sliderStyle = (slider) ->

    slider.find("span").mouseover ->

        if !events.slider

            sliderFill $(this).parent(), "#3273f6", "#e6e6e6"

    slider.find("span").mouseout ->

        if !events.slider

            sliderFill $(this).parent()

    slider.find("span").unbind "keydown"

    sliderFill slider

sliderStart = (event, slider) ->

    $(this).focus()

    events.slider = true

    event.stopPropagation()

    panel = $(this).closest ".panel"

    panel.css "cursor", "ew-resize"
    panel.find("*").css "cursor", "ew-resize"

sliderSlide = (event, slider) ->

    sliderFill $(this), "#3273f6", "#e6e6e6"

    if $(this).attr("id") is "visibility"

        value = $(this).slider "option", "value"

        $(this).closest(".panel").data("mesh").setOpacity value, false

sliderStop = (event, slider) ->

    $(this).blur()

    sliderFill $(this)

    events.slider = false

    event.stopPropagation()

    panel = $(this).closest ".panel"
    value = $(this).slider "option", "value"

    panel.css "cursor", ""
    panel.find("*").css "cursor", ""

    if panel.attr("id") is "camera"

        settings.set ["controls", this.id + "Speed"], value

    else if panel.attr("id") is "mesh"

        panel.data("mesh").setOpacity value

foldPanel = (element, duration = 1000) ->

    id = $(element).parent().parent().attr "id"
    panel = $(element).parent().parent().parent()

    tool = panel.find "#" + id + ""
    fold = panel.find "#" + id + " .fold"
    head = panel.find "#" + id + " .head"
    body = panel.find "#" + id + " .body"

    if body.css("display") is "none"

        body.css "display", "block"
        height = body.height()
        body.css "display", "none"

        tool.animate {height: height + head.height()}, {duration: duration, queue: false}

        body.css "display", "block"

        fold.rotate 90, duration

    else

        tool.animate {height: head.height()}, {duration: duration, queue: false}

        body.css "display", "none"

        fold.rotate 0, duration

    for tool in panel.find(".body").parent().toArray()

        if $(tool).attr("id") isnt id and $(tool).find(".body").css("display") isnt "none"

            $(tool).animate {height: head.height()}, {duration: duration, queue: false}

            $(tool).find(".body").css "display", "none"

            $(tool).find(".fold").rotate 0, duration
