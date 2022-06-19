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

    slider.find("span").mouseover () ->

        if !events.slider

            sliderFill $(this).parent(), "#3273f6", "#e6e6e6"

    slider.find("span").mouseout () ->

        if !events.slider

            sliderFill $(this).parent()

    slider.find("span").unbind "keydown"

    sliderFill slider

sliderStart = (event, slider) ->

    $(this).focus()

    events.slider = true

    event.stopPropagation()

    panel = $(this).closest ".panel"

    panel.css "cursor", "grabbing"
    panel.find("*").css "cursor", "grabbing"

sliderSlide = (event, slider) ->

    sliderFill $(this), "#3273f6", "#e6e6e6"

    if $(this).attr("id") == "visibility"

        eye = $(this).closest(".controls").find "#eye"
        mesh = $(this).closest(".panel").data "mesh"
        opacity = $(this).slider("option", "value") / 100

        eye.attr "src", "/app/imgs/panels/visibility/" + (if opacity < 0.5 then "hidden" else "visible") + ".png"

        mesh.material.opacity = opacity

sliderStop = (event, slider) ->

    $(this).blur()

    sliderFill $(this)

    events.slider = false

    event.stopPropagation()

    panel = $(this).closest ".panel"
    value = $(this).slider "option", "value"

    panel.css "cursor", ""
    panel.find("*").css "cursor", ""

    if panel.attr("id") == "camera"

        settings.controls[this.id + "Speed"] = value

        updateSettings "controls", this.id + "Speed", value

    else if panel.attr("id") == "mesh"

        window.updateMesh panel.data("mesh"), "visibility", "slider", value, true

foldPanel = (element, duration = 1000) ->

    id = $(element).parent().parent().attr "id"
    panel = $(element).parent().parent().parent()

    tool = panel.find "#" + id + ""
    fold = panel.find "#" + id + " .fold"
    head = panel.find "#" + id + " .head"
    body = panel.find "#" + id + " .body"

    if body.css("display") == "none"

        body.css "display", "block"
        height = body.height()
        body.css "display", "none"

        tool.animate {height: height + head.height()}, {duration: duration, queue: false}

        body.css "display", "block"

        rotate fold, 90, duration

    else

        tool.animate {height: head.height()}, {duration: duration, queue: false}

        body.css "display", "none"

        rotate fold, 0, duration

    for tool in panel.find(".body").parent().toArray()

        if $(tool).attr("id") != id && $(tool).find(".body").css("display") != "none"

            $(tool).animate {height: head.height()}, {duration: duration, queue: false}

            $(tool).find(".body").css "display", "none"

            rotate $(tool).find(".fold"), 0, duration
