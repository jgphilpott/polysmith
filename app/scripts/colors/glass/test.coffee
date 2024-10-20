grayscale = require "./grayscale"
rainbow = require "./rainbow"

test "grayscale", =>

    expect(typeof grayscale.black).toBe "string"
    expect(typeof grayscale.darkGray).toBe "string"
    expect(typeof grayscale.gray).toBe "string"
    expect(typeof grayscale.lightGray).toBe "string"
    expect(typeof grayscale.white).toBe "string"

    expect(grayscale.black).toContain "rgba"
    expect(grayscale.darkGray).toContain "rgba"
    expect(grayscale.gray).toContain "rgba"
    expect(grayscale.lightGray).toContain "rgba"
    expect(grayscale.white).toContain "rgba"

    expect(grayscale.black).toContain "0.5)"
    expect(grayscale.darkGray).toContain "0.5)"
    expect(grayscale.gray).toContain "0.5)"
    expect(grayscale.lightGray).toContain "0.5)"
    expect(grayscale.white).toContain "0.5)"

test "rainbow", =>

    expect(typeof rainbow.red).toBe "string"
    expect(typeof rainbow.orange).toBe "string"
    expect(typeof rainbow.yellow).toBe "string"
    expect(typeof rainbow.green).toBe "string"
    expect(typeof rainbow.blue).toBe "string"
    expect(typeof rainbow.purple).toBe "string"
    expect(typeof rainbow.pink).toBe "string"

    expect(rainbow.red).toContain "rgba"
    expect(rainbow.orange).toContain "rgba"
    expect(rainbow.yellow).toContain "rgba"
    expect(rainbow.green).toContain "rgba"
    expect(rainbow.blue).toContain "rgba"
    expect(rainbow.purple).toContain "rgba"
    expect(rainbow.pink).toContain "rgba"

    expect(rainbow.red).toContain "0.5)"
    expect(rainbow.orange).toContain "0.5)"
    expect(rainbow.yellow).toContain "0.5)"
    expect(rainbow.green).toContain "0.5)"
    expect(rainbow.blue).toContain "0.5)"
    expect(rainbow.purple).toContain "0.5)"
    expect(rainbow.pink).toContain "0.5)"
