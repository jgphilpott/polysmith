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
