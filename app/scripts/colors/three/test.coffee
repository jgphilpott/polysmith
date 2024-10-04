THREE = require "three"

grayscale = require "./grayscale"
rainbow = require "./rainbow"

test "grayscale", =>

    expect(grayscale.black).toBeInstanceOf THREE.Color
    expect(grayscale.darkGray).toBeInstanceOf THREE.Color
    expect(grayscale.gray).toBeInstanceOf THREE.Color
    expect(grayscale.lightGray).toBeInstanceOf THREE.Color
    expect(grayscale.white).toBeInstanceOf THREE.Color

    expect(grayscale.black.getHexString()).toBe "000000"
    expect(grayscale.darkGray.getHexString()).toBe "b3b3b3"
    expect(grayscale.gray.getHexString()).toBe "cccccc"
    expect(grayscale.lightGray.getHexString()).toBe "e6e6e6"
    expect(grayscale.white.getHexString()).toBe "ffffff"

test "rainbow", =>

    expect(rainbow.red).toBeInstanceOf THREE.Color
    expect(rainbow.orange).toBeInstanceOf THREE.Color
    expect(rainbow.yellow).toBeInstanceOf THREE.Color
    expect(rainbow.green).toBeInstanceOf THREE.Color
    expect(rainbow.blue).toBeInstanceOf THREE.Color
    expect(rainbow.purple).toBeInstanceOf THREE.Color
    expect(rainbow.pink).toBeInstanceOf THREE.Color

    expect(rainbow.red.getHexString()).toBe "e03a3e"
    expect(rainbow.orange.getHexString()).toBe "f5821f"
    expect(rainbow.yellow.getHexString()).toBe "fdb827"
    expect(rainbow.green.getHexString()).toBe "61bb46"
    expect(rainbow.blue.getHexString()).toBe "009ddc"
    expect(rainbow.purple.getHexString()).toBe "963d97"
    expect(rainbow.pink.getHexString()).toBe "e14375"
