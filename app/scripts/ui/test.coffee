fs = require "fs"
path = require "path"

Navbar = require "./navbar"

file = path.resolve __dirname, "../../templates/ui/navbar.html"

global.fetch = jest.fn =>

    Promise.resolve

        text: => Promise.resolve fs.readFileSync file, "utf-8"

test "Navbar", (done) =>

    delete window.location

    window.location =

        platform: "electron"
        name: "Polysmith"
        page: "root"
        href: ""

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
