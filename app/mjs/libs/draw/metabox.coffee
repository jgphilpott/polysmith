drawMetabox = (event, object) ->

    metabox = $ "#metabox"

    metabox.append "<h1>" + object.name + "</h1>"

eraseMetabox = () ->

    metabox = $ "#metabox"
    data = metabox.find "*"

    data.remove()
