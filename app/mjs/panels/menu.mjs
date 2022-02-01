export function addMenuPanel() {

  $("body").append("<div id='menu' class='panel'></div>")

  let panel = $("#menu.panel")

  panel.append("<div class='head'><img id='logo' src='/app/imgs/theme/logo.png'><h1 id='name'>Polymaker</h1></div>")

  var client = false

  if (client) {

    panel.append("<div id='profile' class='option opt'><h3>Profile</h3></div>")
    panel.append("<div id='logout' class='option opt'><h3>Logout</h3></div>")

  } else {

    panel.append("<div id='signup' class='option opt'><h3>Sign Up</h3></div>")
    panel.append("<div id='login' class='option opt'><h3>Login</h3></div>")

  }

}
