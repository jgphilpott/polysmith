module.exports = {
    testEnvironment: "jest-environment-jsdom",
    moduleFileExtensions: ["js", "json", "coffee"],
    transform: {
        "^.+\\.coffee$": "./jest-transformer.js"
    },
    testMatch: [
        "**/?(*.)+(spec|test).coffee"
    ]
}