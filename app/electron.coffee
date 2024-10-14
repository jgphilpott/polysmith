{ app, BrowserWindow, globalShortcut } = require "electron"
{ autoUpdater } = require "electron-updater"

require("electron-reload")(__dirname)

win = null

createWindow = =>

    win = new BrowserWindow

        width: 1600
        height: 900
        webPreferences:

            nodeIntegration: true
            contextIsolation: false

        frame: false # Toggle the default title bar.
        resizable: true # Determines if the window is resizable.
        transparent: true # Determines if the window background is transparent.
        titleBarStyle: "hidden" # Optionally use 'hiddenInset' to keep macOS close, min, max buttons.

    if process.env.NODE_ENV is "development"

        globalShortcut.register "CommandOrControl+Shift+I", =>

            win.webContents.toggleDevTools()

    win.loadFile("app/templates/pages/anvil.html")

    win.maximize()

app.on "ready", =>

    createWindow()

    autoUpdater.checkForUpdatesAndNotify()

app.on "activate", =>

    if BrowserWindow.getAllWindows().length is 0

        createWindow()

app.on "will-quit", =>

    globalShortcut.unregisterAll()

app.on "window-all-closed", =>

    if process.platform isnt "darwin"

        app.quit()

autoUpdater.on "update-available", =>

    autoUpdater.downloadUpdate()

autoUpdater.on "update-downloaded", =>

    win.webContents.send "update-downloaded"
