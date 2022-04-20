function sliderFill(slider, colorOne="#3273f6", colorTwo="#efefef") {

  if (slider.hasClass("disabled")) {

    colorOne = "#848484"
    colorTwo = "#efefef"

  }

  let min = slider.slider("option", "min")
  let max = slider.slider("option", "max")

  let value = slider.slider("option", "value")

  slider.find("span").css("background", colorOne)
  slider.css("background", "linear-gradient(90deg, " + colorOne + " " + calculatePercent(min, max, value) + "%, " + colorTwo + " 0%)")

}

function sliderStyle(slider) {

  slider.find("span").mouseover(function() { if (!events.slider) sliderFill($(this).parent(), "#3273f6", "#e6e6e6") })
  slider.find("span").mouseout(function() { if (!events.slider) sliderFill($(this).parent()) })

  slider.find("span").unbind("keydown")

  sliderFill(slider)

}

function sliderStart(event, slider) {

  $(this).focus()

  events.slider = true

  event.stopPropagation()

  let panel = $(this).closest(".panel")

  panel.css("cursor", "grabbing")
  panel.find("*").css("cursor", "grabbing")

}

function sliderSlide(event, slider) {

  sliderFill($(this), "#3273f6", "#e6e6e6")

  let value = $(this).slider("option", "value")

  if ($(this).closest(".controls").attr("id") == "speed") {

    settings.controls[this.id + "Speed"] = value

  } else if (this.id == "visibility") {

    let opacity = value / 100

    let mesh = $(this).closest(".panel").data("mesh")
    let eye = $(this).closest(".controls").find("#eye")

    opacity < 0.5 ? eye.attr("src", "/app/imgs/panels/visibility/hidden.png") : eye.attr("src", "/app/imgs/panels/visibility/visible.png")

    mesh.material.opacity = opacity

  }

}

function sliderStop(event, slider) {

  $(this).blur()

  sliderFill($(this))

  events.slider = false

  event.stopPropagation()

  let panel = $(this).closest(".panel")

  panel.css("cursor", "")
  panel.find("*").css("cursor", "")

}

function fold(element, degree=90, duration=1000) {

  let id = $(element).parent().parent().attr("id")
  let panel = $(element).parent().parent().parent()

  let tool = panel.find("#" + id + "")
  let fold = panel.find("#" + id + " .fold")
  let head = panel.find("#" + id + " .head")
  let body = panel.find("#" + id + " .body")

  if (body.css("display") == "none") {

    body.css("display", "block")
    let height = body.height()
    body.css("display", "none")

    tool.animate({height: height + head.height()}, {duration: duration, queue: false})

    body.css("display", "block")

    rotate(fold, degree, duration)

  } else {

    tool.animate({height: head.height()}, {duration: duration, queue: false, complete: function() { body.css("display", "none") }})

    rotate(fold, 0, duration)

  }

  panel.find(".body").parent().toArray().forEach((item, i) => {

    if ($(item).attr("id") != id && $(item).find(".body").css("display") != "none") {

      $(item).animate({height: head.height()}, {duration: duration, queue: false, complete: function() { $(item).find(".body").css("display", "none") }})

      rotate($(item).find(".fold"), 0, duration)

    }

  })

}