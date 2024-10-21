html = ""

$ = require "jquery"

fs = require "fs"
path = require "path"

Forkme = require "./forkme"
Navbar = require "./navbar"

delete window.location

window.location =

    href: ""
    page: "root"
    name: "Polysmith"
    platform: "electron"

global.fetch = jest.fn =>

    file = path.resolve __dirname, html

    Promise.resolve

        text: => Promise.resolve fs.readFileSync file, "utf-8"

test "Forkme", (done) =>

    html = "../../templates/ui/forkme.html"

    forkme = new Forkme()

    process.nextTick =>

        expect(forkme.banner.length).toBe 1

        expect(forkme.link.href).toBe "https://github.com/jgphilpott/polysmith"

        forkme.hide(); expect(forkme.banner.css "display").toBe "none"
        forkme.show(); expect(forkme.banner.css "display").toBe "block"

        forkme.remove(); expect($("#forkme").length).toBe 0
        forkme.add(); expect($("#forkme").length).toBe 1

        forkme.click()

        done()

test "Navbar", (done) =>

    html = "../../templates/ui/navbar.html"

    navbar = new Navbar()

    process.nextTick =>

        expect(navbar.icons.length).toBe 3

        expect(navbar.anvil.length).toBe 1
        expect(navbar.docs.length).toBe 1
        expect(navbar.tutorials.length).toBe 1

        expect(navbar.title.text()).toBe "Polysmith"

        window.location.platform = "electron"

        navbar.anvil.click(); expect(window.location.href).toBe "./anvil.html"
        navbar.docs.click(); expect(window.location.href).toBe "./docs.html"
        navbar.tutorials.click(); expect(window.location.href).toBe "./tutorials.html"

        window.location.platform = "express"

        navbar.anvil.click(); expect(window.location.href).toBe "/anvil"
        navbar.docs.click(); expect(window.location.href).toBe "/docs"
        navbar.tutorials.click(); expect(window.location.href).toBe "/tutorials"

        navbar.title.text("   "); navbar.title.blur()
        expect(navbar.title.text()).toBe window.location.name

        navbar.title.text("abc"); navbar.title.blur()
        expect(navbar.title.text()).toBe "abc"

        navbar.title.text("abcABC"); navbar.title.blur()
        expect(navbar.title.text()).toBe "abcABC"

        navbar.title.text("abcABC!@# "); navbar.title.blur()
        expect(navbar.title.text()).toBe "abcABC"

        navbar.title.text("abcABC_-!@# "); navbar.title.blur()
        expect(navbar.title.text()).toBe "abcABC_-"

        navbar.title.text("abcABC_-!@# 123"); navbar.title.blur()
        expect(navbar.title.text()).toBe "abcABC_- 123"

        done()
