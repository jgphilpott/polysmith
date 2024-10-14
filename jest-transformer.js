const coffee = require("coffeescript")

module.exports = {
    process(test) {
        return {code: coffee.compile(test, {bare: true})}
    }
}