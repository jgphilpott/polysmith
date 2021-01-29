// Find the tangent of a polynomial function at x.
export function findTangent(x, coefficients) {

  let slope = 0
  let intercept = coefficients[0]

  for (let i = 1; i < coefficients.length; i++) {

    slope += coefficients[i] * i * Math.pow(x, i - 1)
    intercept += coefficients[i] * Math.pow(x, i)

  }

  return [intercept - slope * x, slope]

}

// Find the area under a polynomial function within bounds.
// This function works assuming your curve is either entirely above or entirely below the x axis.
// If your curve crosses the x axis within the given bounds you will need to first find the roots (x intercepts) and then calculate the segments above and below the axis separately.
export function findArea(lowerLimit, upperLimit, coefficients) {

  let lower = 0
  let upper = 0

  for (let i = 0; i < coefficients.length; i++) {

    lower += (coefficients[i] * Math.pow(lowerLimit, i + 1)) / (i + 1)
    upper += (coefficients[i] * Math.pow(upperLimit, i + 1)) / (i + 1)

  }

  return Math.abs(upper - lower)

}
