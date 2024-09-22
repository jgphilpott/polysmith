{app, BrowserWindow} = require "electron"

path = require "path"
pug = require "pug"

createWindow = =>

    win = new BrowserWindow

        webPreferences:

            nodeIntegration: true

    html = pug.renderFile path.join(__dirname, "templates/anvil.pug"), mode: "electron"

    win.loadURL "data:text/html;charset=utf-8," + encodeURI html

    win.maximize()

app.whenReady().then =>

    createWindow()

    app.on "activate", =>

        if BrowserWindow.getAllWindows().length is 0

            createWindow()

app.on "window-all-closed", =>

    if process.platform isnt "darwin"

        app.quit()
