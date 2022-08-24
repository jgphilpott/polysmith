function addLightsPanel() {

  $("body").append("<div id='lights' class='panel'><img title='Close' class='close' src='/app/imgs/panels/nav/close.png'></div>")

  let panel = $("#lights.panel")

  panel.append("<img title='Lights' class='lights' src='/app/imgs/panels/main/light.png'>")
  panel.append("<img title='Reset Lights' class='reset' src='/app/imgs/panels/tools/reset.png'>")

  if (lights.length) {

    panel.append("<div id='list'></div>")

    let list = panel.find("#list")

    lights.forEach((light) => {

      let min = - scale * 2
      let max = scale * 2

      let template =

        `<div id='light-` + light.uuid + `' class='light'>
            <div class='head'>

                <img title='Fold Light' class='fold' src='/app/imgs/panels/nav/fold.png'>

                <select name='types' id='types'>

                    <option value='ambient' ` + (light.type == "ambient" ? "selected" : "") + `>Ambient</option>
                    <option value='point' ` + (light.type == "point" ? "selected" : "") + `>Point</option>

                </select>

                <div id='intensity' class='slider'></div>

                <img title='Lock Light' class='lock' src='/app/imgs/panels/lock/` + (light.lock ? "locked" : "unlocked") + `.png'>
                <img title='Delete Light' class='trash' src='/app/imgs/panels/tools/trash.png'>

            </div>
            <div class='body'>

              <span id='position-x'><label id='x'>X</label><input type=number step=1 min=` + min + ` max=` + max + ` value=` + light.getX().toFixed(2) + `><button id='plus'>+</button><button id='minus'>-</button></span>
              <span id='position-y'><label id='y'>Y</label><input type=number step=1 min=` + min + ` max=` + max + ` value=` + light.getY().toFixed(2) + `><button id='plus'>+</button><button id='minus'>-</button></span>
              <span id='position-z'><label id='z'>Z</label><input type=number step=1 min=` + min + ` max=` + max + ` value=` + light.getZ().toFixed(2) + `><button id='plus'>+</button><button id='minus'>-</button></span>

            </div>
        </div>`

      list.append(template)

      template = list.find("#light-" + light.uuid + "")

      let types = template.find("select#types")
      let intensity = template.find("#intensity.slider")

      intensity.slider({min: 0, max: 100, value: light.intensity * 100, start: sliderStart, slide: sliderSlide, stop: sliderStop})

      template.data("light", light)

      sliderStyle(intensity)

    })

  } else {

    panel.append("<p id='none'><b>None</b></p>")

  }

  panel.append("<img title='Add New Light' class='nav' src='/app/imgs/panels/nav/+.png'>")

  panel.find(".fold").click(function(event) {

    event.stopPropagation()

    foldPanel(this)

  }).on("mousedown mouseup", function(event) { event.stopPropagation() })

  panel.find("select#types").on("mousedown mouseup", function(event) { event.stopPropagation() })

  panel.find(".slider").on("mousedown mouseup", function(event) { event.stopPropagation() })

  panel.find(".lock").click(function(event) {

    let template = $(this).closest("div.light")
    let light = template.data("light")
    let lock = light.toggleLock()

    template.find("select").toggleClass("disabled", lock)
    template.find("select").prop("disabled", lock)

    template.find(".slider").toggleClass("disabled", lock)
    template.find(".slider").slider(lock ? "disable" : "enable")

    template.find(".lock").attr("src", "/app/imgs/panels/lock/" + (lock ? "locked" : "unlocked") + ".png")
    template.find(".trash").toggleClass("disabled", lock)

    template.find("input").toggleClass("disabled", lock)
    template.find("button").toggleClass("disabled", lock)

    sliderStyle(template.find(".slider"))

  }).on("mousedown mouseup", function(event) { event.stopPropagation() })

  panel.find(".trash").on("mousedown mouseup", function(event) { event.stopPropagation() })

  panel.data("lights", lights)

  return panel

}