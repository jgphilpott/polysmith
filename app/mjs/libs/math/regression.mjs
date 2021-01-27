// Find the best-fit curve for an nth order polynomial.
export function polyfit(xArray, yArray, order) {

  // Type check arguments.
  if (Array.isArray(xArray) && Array.isArray(yArray) && typeof(order) == "number") {

    // Value check arguments.
    if (xArray.length == yArray.length && xArray.length >= 1 && order >= 0) {

      if (xArray.length <= order) console.warn("Warning: Polyfit may be poorly conditioned.")

      let xMatrix = []
      let yMatrix = numeric.transpose([yArray])

      for (let i = 0; i < xArray.length; i++) {

        let temp = []

        for (let j = 0; j <= order; j++) {

          temp.push(Math.pow(xArray[i], j))

        }

        xMatrix.push(temp)

      }

      let xMatrixT = numeric.transpose(xMatrix)

      let dot1 = numeric.dot(xMatrixT, xMatrix)
      let dot2 = numeric.dot(xMatrixT, yMatrix)

      let dotInv = numeric.inv(dot1)

      let coefficients = numeric.dot(dotInv, dot2)

      return coefficients // Coefficients format: a + bx^1 + cx^2 ...

    } else {

      throw "Invalid argument value."

    }

  } else {

    throw "Invalid argument type."

  }

}

// Predict y given x.
export function predict(x, coefficients) {

  // Check arguments validity.
  if (typeof(x) == "number" && Array.isArray(coefficients) && coefficients.length > 0) {

    let prediction = 0

    for (let i = 0; i < coefficients.length; i++) {

      prediction += coefficients[i] * Math.pow(x, i)

    }

    return prediction

  } else {

    throw "Invalid arguments."

  }

}

// Calculate model accuracy.
export function rSquared(x, y, coefficients) {

  let regressionSquaredError = []
  let totalSquaredError = []

  let yMean = y.reduce((a, b) => a + b, 0) / y.length

  for (let i = 0; i < x.length; i++) {

    regressionSquaredError.push(Math.pow(y[i] - predict(x[i], coefficients), 2))
    totalSquaredError.push(Math.pow(y[i] - yMean, 2))

  }

  let regressionSquaredErrorSum = regressionSquaredError.reduce((a, b) => a + b, 0)
  let totalSquaredErrorSum = totalSquaredError.reduce((a, b) => a + b, 0)

  return 1 - (regressionSquaredErrorSum / totalSquaredErrorSum)

}
