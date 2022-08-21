function addLightsPanel() {

  $("body").append("<div id='lights' class='panel'><img title='Close' class='close' src='/app/imgs/panels/nav/close.png'></div>")

  let panel = $("#lights.panel")

  panel.append("<img title='Lights' class='lights' src='/app/imgs/panels/main/light.png'>")
  panel.append("<img title='Reset Lights' class='reset' src='/app/imgs/panels/tools/reset.png'>")

  if (lights.length) {

    panel.append("<div id='list'></div>")

    let list = panel.find("#list")

    lights.forEach((light) => {

      let template =

        `<div id='light-` + light.uuid + `'>
            <div class='head'>

                <img title='Fold Light' class='fold' src='/app/imgs/panels/nav/fold.png'>

                <select name='types' id='types'>

                    <option value='ambient' ` + (light.type == "ambient" ? "selected" : "") + `>Ambient</option>
                    <option value='point' ` + (light.type == "point" ? "selected" : "") + `>Point</option>

                </select>

                <div id='intensity' class='slider'></div>

                <img title='Delete Light' class='trash' src='/app/imgs/panels/tools/trash.png'>

            </div>
        </div>`

      list.append(template)

      template = list.find("#light-" + light.uuid + "")

      let types = template.find("select#types")
      let intensity = template.find("#intensity.slider")

      intensity.slider({min: 0, max: 100, value: light.intensity * 100, start: sliderStart, slide: sliderSlide, stop: sliderStop})

      sliderStyle(intensity)

    })

  } else {

    panel.append("<p id='none'><b>None</b></p>")

  }

  panel.append("<img title='Add New Light' class='nav' src='/app/imgs/panels/nav/+.png'>")

  return panel

}