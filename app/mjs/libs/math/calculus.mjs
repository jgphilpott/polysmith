export function findTangent(x, coefficients) {

  let slope = 0
  let intercept = coefficients[0]

  for (let i = 1; i < coefficients.length; i++) {

    slope += coefficients[i] * i * Math.pow(x, i - 1)
    intercept += coefficients[i] * Math.pow(x, i)

  }

  return [intercept - slope * x, slope]

}

export function findArea(lowerLimit, upperLimit, coefficients) {

  let lower = 0
  let upper = 0

  for (let i = 0; i < coefficients.length; i++) {

    lower += (coefficients[i] * Math.pow(lowerLimit, i + 1)) / (i + 1)
    upper += (coefficients[i] * Math.pow(upperLimit, i + 1)) / (i + 1)

  }

  return Math.abs(upper - lower)

}
