function sliderStyle(slider) {

  slider.find("span").unbind("keydown")

  let min = $(this).slider("option", "min")
  let max = $(this).slider("option", "max")
  let value = $(this).slider("option", "value")

  slider.css("background", "linear-gradient(90deg, #3273f6 " + calculatePercent(min, max, value) + "%, #efefef 0%)")

}

function sliderStart(event, slider) {

  $(this).focus()

  event.stopPropagation()

  $("*").css("cursor", "url('app/imgs/icons/cursors/grabbing.png'), grabbing")

}

function sliderSlide(event, slider) {

  let min = $(this).slider("option", "min")
  let max = $(this).slider("option", "max")
  let value = $(this).slider("option", "value")

  if ($(this).closest(".controls").attr("id") == "speed") settings.controls[this.id + "Speed"] = value

  $(this).css("background", "linear-gradient(90deg, #3273f6 " + calculatePercent(min, max, value) + "%, #efefef 0%)")

}

function sliderStop(event, slider) {

  $(this).blur()

  event.stopPropagation()

  $("*").css("cursor", "")

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