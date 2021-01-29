// Find the best-fit curve for an nth order polynomial.
export function polyfit(xArray, yArray, order) {

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

  return coefficients

}

// Predict y given x.
export function predict(x, coefficients) {

  let prediction = 0

  for (let i = 0; i < coefficients.length; i++) {

    prediction += coefficients[i] * Math.pow(x, i)

  }

  return prediction

}

// Evaluate model accuracy.
export function rSquared(x, y, coefficients) {

  let regressionSquaredError = 0
  let totalSquaredError = 0

  let yMean = y.reduce((a, b) => a + b) / y.length

  for (let i = 0; i < x.length; i++) {

    regressionSquaredError += Math.pow(y[i] - predict(x[i], coefficients), 2)
    totalSquaredError += Math.pow(y[i] - yMean, 2)

  }

  return 1 - (regressionSquaredError / totalSquaredError)

}
