addPolygenPanel = ->

    $("body").append "<div id='polygen' class='panel'><img title='Close' class='close' src='/app/imgs/panels/nav/close.png'></div>"

    panel = $("#polygen.panel")

    panel.append "<h3>Polygen</h3>"

    return panel
